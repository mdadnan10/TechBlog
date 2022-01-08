package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.ContactDao;
import entities.Contact;
import helper.ConnectionProvider;
import helper.Helper;

@WebServlet("/ContactServlet")
@MultipartConfig
public class ContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("c_email");
		String title = request.getParameter("c_title");
		String desc = request.getParameter("c_desc");
		Part part = request.getPart("c_file");
		String file = part.getSubmittedFileName();
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		Contact contact = new Contact(email, title, desc, file);
		String path = "C:/Accenture/Projects/TechBlog/src/main/webapp/img/contact/" + file;
		
		ContactDao contactDao = new ContactDao(ConnectionProvider.getConnection());
		
		if (contactDao.Contacted(contact)) {
			if (Helper.saveFile(part.getInputStream(), path)) {
				out.println("contacted");
			} else {
				out.println("unable to save image");
			}
		} else {
			out.println("error");
		}
	
	}

}
