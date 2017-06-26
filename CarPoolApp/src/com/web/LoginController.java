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
 * Servlet implementation class LoginController
 */
@WebServlet("/Login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		/*int userid = (int) session.getAttribute("userId");*/

		session.setAttribute("userId", "");
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username;
		String password;

		username = request.getParameter("username");
		password = request.getParameter("password");

		User user = new User();
		int userId = user.login(username, password);
		if (userId > 0) {
			HttpSession session = request.getSession();

			user = user.getUserData(userId);
			session.setAttribute("userData", user);
			session.setAttribute("userId", userId);

			response.sendRedirect("homePage.jsp");
		} else {
			request.setAttribute("displayError", "visible");
			response.sendRedirect("login.jsp");
		}

		System.out.println(username + "  " + password);

	}

}
