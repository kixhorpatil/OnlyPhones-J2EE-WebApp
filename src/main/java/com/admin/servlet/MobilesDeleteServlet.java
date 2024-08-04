package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.MobileDAOImpl;
import com.db.DBConnect;

@WebServlet("/delete")
public class MobilesDeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			MobileDAOImpl dao = new MobileDAOImpl(DBConnect.getconn());
			boolean f = dao.deleteMobiles(id);

			HttpSession session = req.getSession();
			if (f) {
				session.setAttribute("succMsg", "Mobile Deleted Successfully");
				resp.sendRedirect("admin/all_mobiles.jsp");

			} else {
				session.setAttribute("failedMsg", "Something went wrong on Server");
				resp.sendRedirect("admin/all_mobiles.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
