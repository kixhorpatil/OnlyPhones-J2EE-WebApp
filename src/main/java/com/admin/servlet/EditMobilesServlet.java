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
import com.entity.MobileDtls;

@WebServlet("/edit_mobiles")
public class EditMobilesServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {

			int id = Integer.parseInt(req.getParameter("id"));
			String mobileName = req.getParameter("mname");
			String brand = req.getParameter("brand");
			String price = req.getParameter("price");
			String status = req.getParameter("mstatus");

			MobileDtls m= new MobileDtls();
			m.setMobileId(id);
			m.setMobileName(mobileName);
			m.setBrand(brand);
			m.setPrice(price);
			m.setStatus(status);

			MobileDAOImpl dao = new MobileDAOImpl(DBConnect.getconn());
			boolean f = dao.updateEditMobiles(m);

			HttpSession session = req.getSession();
			if (f) {
				session.setAttribute("succMsg", "Mobile Added Successfully");
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
