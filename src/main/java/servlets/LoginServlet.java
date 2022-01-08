package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import entities.User;
import helper.ConnectionProvider;

@WebServlet("/LoginServlet")
@MultipartConfig
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		UserDao userDao = new UserDao(ConnectionProvider.getConnection());

		if (userDao.UserExist(email)) {

			User user = userDao.getUserByEmailAndPassword(email, password);
			if (user != null) {

				// session
				HttpSession session = request.getSession();
				session.setAttribute("currentUser", user);
				response.sendRedirect("dashboard.jsp");
				
			} else {
				out.println("notMatch");
			}

		} else {
			out.println("notExist");
		}

	}

}
