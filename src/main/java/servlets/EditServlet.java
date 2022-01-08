package servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.UserDao;
import entities.Message;
import entities.User;
import helper.ConnectionProvider;
import helper.Helper;

@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("update_name");
		String password = request.getParameter("update_password");
		String about = request.getParameter("update_about");
		Part part = request.getPart("update_profile");
		String profile = part.getSubmittedFileName();

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		// get the user session
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentUser");
		user.setName(name);
		user.setPassword(password);
		user.setAbout(about);
		String oldProfile = user.getProfile();
		user.setProfile(profile);

		UserDao dao = new UserDao(ConnectionProvider.getConnection());

		if (dao.updateUser(user)) {

			String path = "C:/Accenture/Projects/TechBlog/src/main/webapp/img/profile/" + user.getProfile();
			String oldFilePath = "C:/Accenture/Projects/TechBlog/src/main/webapp/img/profile/" + oldProfile;

			if (!oldProfile.equals("default.png")) {

				if (Helper.deleteFile(oldFilePath)) {
					if (Helper.saveFile(part.getInputStream(), path)) {

						Message msg = new Message("Profile Details updated Successfully", "success", "alert-success");
						session.setAttribute("msg", msg);

						response.sendRedirect("dashboard.jsp");

					} else {
						Message msg = new Message("Unable to update profile pic", "error", "alert-danger");
						session.setAttribute("msg", msg);

						response.sendRedirect("dashboard.jsp");
					}
				} else {
					Message msg = new Message("Unable to delete old profile pic", "error", "alert-danger");
					session.setAttribute("msg", msg);

					response.sendRedirect("dashboard.jsp");
				}

			}

		} else {
			Message msg = new Message("Something Went wrong", "error", "alert-danger");
			session.setAttribute("msg", msg);

			response.sendRedirect("dashboard.jsp");
		}

	}

}
