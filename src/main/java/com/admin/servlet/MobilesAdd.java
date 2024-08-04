package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.MobileDAOImpl;
import com.db.DBConnect;
import com.entity.MobileDtls;

@WebServlet("/add_mobiles")
@MultipartConfig
public class MobilesAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String mobileName = req.getParameter("mname");
			String brand = req.getParameter("brand");
			String price = req.getParameter("price");
			String categories = req.getParameter("mtype");
			String status = req.getParameter("mstatus");
			Part part = req.getPart("mimg");
			String fileName = part.getSubmittedFileName();

			MobileDtls m = new MobileDtls(mobileName, brand, price, categories, status, fileName, "admin");

			MobileDAOImpl dao = new MobileDAOImpl(DBConnect.getconn());
			boolean f = dao.addMobiles(m);

			HttpSession session = req.getSession();
			if (f) {
				String path = getServletContext().getRealPath("") + "mobile";
				File fileDir = new File(path);

				if (!fileDir.exists()) {
					fileDir.mkdirs(); // Create directory if it does not exist
				}

				part.write(path + File.separator + fileName);

				session.setAttribute("succMsg", "Mobile Added Successfully");
				resp.sendRedirect("admin/add_mobiles.jsp");
			} else {
				session.setAttribute("failedMsg", "Something went wrong on the Server");
				resp.sendRedirect("admin/add_mobiles.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
