package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDAOImpl;
import com.db.DBConnect;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		 * After data is sent to the /register endpoint, getting the data one by one
		 */
		try {
			String name = req.getParameter("fname"); 
			String email = req.getParameter("email"); 
			String phno = req.getParameter("phno"); 
			String password = req.getParameter("password"); 
			String checkbox = req.getParameter("check"); 

			// System.out.println(name+" "+email+" "+phno+" "+password+" "+checkbox);

			/*
			 * Creating the User class object and passing the retrieved data into its fields
			 */
			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(password);

			HttpSession session = req.getSession();

			if (checkbox != null) {
				UserDAOImpl dao = new UserDAOImpl(DBConnect.getconn());
				boolean f1 = dao.checkUser(email);

				if (f1) { //if user registration is successful

					boolean f = dao.userRegister(us);

					if (f) { //if user registration is not successful
						session.setAttribute("succMsg", "Registration Successfully");
						resp.sendRedirect("register.jsp");
					} else {
						session.setAttribute("failedMsg", "Something wrong on the server");
						resp.sendRedirect("register.jsp");
					}

				} else {
					session.setAttribute("failedMsg", "User with this email already exist Try another Email");
					resp.sendRedirect("register.jsp");
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

