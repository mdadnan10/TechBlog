package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import entities.User;
import helper.ConnectionProvider;

@WebServlet("/SignUpServlet")
@MultipartConfig
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// fetch all form data
		String name = request.getParameter("user_name").trim();
		String email = request.getParameter("user_email").trim();
		String password = request.getParameter("user_password").trim();
		String about = request.getParameter("user_about").trim();
		String gender = request.getParameter("gender").trim();

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		User user = new User(name, email, password, about, gender);

		// create user dao object
		UserDao dao = new UserDao(ConnectionProvider.getConnection());

		if (!(dao.UserExist(email))) {
			if (dao.saveUser(user)) {
				out.println("registered");
			} else {
				out.println("error");
			}
		} else {
			out.println("exist");
		}

	}

}
