package com.dalip.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dalip.Model.User;
import com.dalip.dao.DB;

@WebServlet({ "/RegisterServlet", "/Register" })
public class RegisterServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 1. Fetch data from Request
		User user = new User();
//		user.name = request.getParameter("txtName");
		user.setName(request.getParameter("txtName"));
		user.gender = request.getParameter("gender");
		user.age = request.getParameter("txtAge");
		user.email = request.getParameter("txtEmail");
		user.password = request.getParameter("txtPassword");
		
		user.makePasswordSecure();
	
		System.out.println("[RegisterServlet] User data: "+user);
		
		// 2. Logical Processing 
		// Dump the data in MongoDB / FirebaseFireStore/ MySQL
		DB db = new DB();
		boolean result = db.registerUser(user);
		
		
		// 3. send Back some response
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		
		String html ="";
		HttpSession session = request.getSession();
		session.setAttribute("keyUser", user);
		if(result) {
			
			RequestDispatcher view = request.getRequestDispatcher("home.jsp");
			view.forward(request, response);
		
//			System.out.println("user id: "+user._id);
//			html = "<html><body><center>THANK YOU, "+user.email+"<br>Registration Successfull <br><br> "
//					+ "<a href='home.jsp'>Enter Home</a>"
//			 		+ "</center></body></html>";
			
//			RequestDispatcher view = request.getRequestDispatcher("Login");
//			view.forward(request, response);
			
		}else {
			 html = "<html><body><center>Something Went wrong, "+user.email+"<br>Please Try Again </center></body></html>";

		}
		
		out.println(html);
		
	}

}