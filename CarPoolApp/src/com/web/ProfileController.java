package com.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.User;

/**
 * Servlet implementation class ProfileController
 */
@WebServlet("/ProfileController")
public class ProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		User user = new User();
	      //get the username and password from the session
		
		int userid= (int) session.getAttribute("userId");
		
		user= user.getUserData(userid);
		
		
		session.setAttribute("userData", user);
		
		RequestDispatcher view = request.getRequestDispatcher("profile.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
	 User user  = (User)session.getAttribute("userData");
	 int id=user.getUserId();
	 
	 
	    String fname = request.getParameter("fname");
	    System.out.println(fname);
		String lname = request.getParameter("lname");
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
			
		}
		
  user.updateProfile(id,fname, lname, gender, bdate, email, city, 
			 state, street, zipcode, password, username);
        
     response.sendRedirect("profile.jsp");
	}

}
