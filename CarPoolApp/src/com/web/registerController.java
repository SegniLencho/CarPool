package com.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.User;

/**
 * Servlet implementation class registerController
 */
@WebServlet("/registerController")
public class registerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public registerController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fname = request.getParameter("firstname");
		String lname = request.getParameter("lastname");
		String gender = request.getParameter("gender");
		
		
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String street = request.getParameter("street");
		String city = request.getParameter("city");
		
		String state = request.getParameter("state");
		
		int bdate=0,zipcode=0;
		try{
			String bdTemp = request.getParameter("bdate");
			String zipTemp = request.getParameter("zipcode");
			 bdate = Integer.parseInt(bdTemp);
			 zipcode = Integer.parseInt(zipTemp);

			
		}catch(NumberFormatException e){
			e.printStackTrace();
		}
		
		
		
		User user = new User();
		user.register(fname, lname, gender, bdate,email, city, state, street, zipcode, password, username);
		
		user = user.getUserData(username);
		
		HttpSession session = request.getSession();
		session.setAttribute("userData", user);
		response.sendRedirect("homePage.jsp");
	}

}
