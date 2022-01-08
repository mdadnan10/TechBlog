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

import dao.PostDao;
import entities.Message;
import entities.Post;
import entities.User;
import helper.ConnectionProvider;
import helper.Helper;

@WebServlet("/AddPostServlet")
@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int categoryId = Integer.parseInt(request.getParameter("p_cid"));
		String title = request.getParameter("p_title");
		String link = request.getParameter("p_link");
		String content = request.getParameter("p_content");
		String code = request.getParameter("p_code");
		Part part = request.getPart("p_file");
		String pic = part.getSubmittedFileName();

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentUser");
		int userId = user.getId();

		Post post = new Post(title, content, code, link, pic, categoryId, userId);

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String path = "C:/Accenture/Projects/TechBlog/src/main/webapp/img/posts/" + File.separator + pic;

		PostDao postDao = new PostDao(ConnectionProvider.getConnection());

		if (postDao.savePost(post)) {

			if (Helper.saveFile(part.getInputStream(), path)) {
				out.println("complete");
			} else {
				out.println("posted");
			}

		} else {
			out.println("errro");
		}

	}

}
