package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RecoverDao;
import entities.User;
import helper.ConnectionProvider;

@WebServlet("/RecoverServlet")
@MultipartConfig
public class RecoverServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("recover_name").trim().toLowerCase();
		String email = request.getParameter("recover_email").trim();
		String password = request.getParameter("recover_password").trim();

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		User user = new User(name, email, password);

		RecoverDao recover = new RecoverDao(ConnectionProvider.getConnection());

		// user exist ?
		if (recover.UserExist(email)) {

			// name and password match
			if (recover.userMatch(user)) {

				// update password
				if (recover.updatePassword(user)) {
					out.println("updated");
				} else {
					out.println("error");
				}

			} else {
				out.println("notMatch");
			}

		} else {
			out.println("notExist");
		}

	}

}
