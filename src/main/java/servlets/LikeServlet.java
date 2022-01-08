package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.LikeDao;
import entities.Like;
import helper.ConnectionProvider;

@WebServlet("/LikeServlet")
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String operation = request.getParameter("operation");
		int pId = Integer.parseInt(request.getParameter("pid"));
		int uId = Integer.parseInt(request.getParameter("uid"));

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

//		out.println("data from server");
//		out.println(operation);
//		out.println(pId);
//		out.println(uId);

		LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection());

		if (operation.equals("like")) {
			Like like = new Like(pId, uId);
			if (likeDao.insertLike(like)) {
				out.println("liked");
			} else {
				out.println("error");
			}

		} else {
			if (likeDao.disLike(pId, uId)) {
				out.println("disliked");
			} else {
				out.println("error");
			}
		}

	}

}
