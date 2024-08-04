package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.MobileDAOImpl;
import com.db.DBConnect;

@WebServlet("/delete_old_mobile")
public class DeleteOldMobile extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String em = req.getParameter("em");
			int id= Integer.parseInt(req.getParameter("id"));
			
			MobileDAOImpl dao = new MobileDAOImpl(DBConnect.getconn());

			boolean f = dao.oldMobileDelete(em, "old",id);
			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("succMsg", "Old Mobile Deleted Successfuly");
				resp.sendRedirect("old_mobile.jsp");
			} else {
				session.setAttribute("succMsg", "Something went wrong on the Server");
				resp.sendRedirect("old_mobile.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
