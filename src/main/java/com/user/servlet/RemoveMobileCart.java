package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CartDAOImpl;
import com.db.DBConnect;

@WebServlet("/remove_mobile")
public class RemoveMobileCart extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int mid = Integer.parseInt(req.getParameter("mid"));
		int uid = Integer.parseInt(req.getParameter("uid"));
		int cid = Integer.parseInt(req.getParameter("cid"));
		
		CartDAOImpl dao = new CartDAOImpl(DBConnect.getconn());
		boolean f = dao.deleteMobile(mid,uid,cid);
		HttpSession session = req.getSession();
		
		if (f) {
			session.setAttribute("succMsg", "Mobile Removed From the Cart");
			resp.sendRedirect("checkout.jsp");
		}
		else {
			session.setAttribute("failedMsg", "Something went wrong on the Server");
			resp.sendRedirect("checkout.jsp");
		}
		
	}

}
