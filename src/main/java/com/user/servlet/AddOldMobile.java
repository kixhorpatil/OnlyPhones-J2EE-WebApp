package com.user.servlet;

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

@WebServlet("/add_old_mobile")
@MultipartConfig
public class AddOldMobile extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String mobileName = req.getParameter("mname");
			String brand = req.getParameter("brand");
			String price = req.getParameter("price");
			String categories = "Old";
			String status = "Active";
			Part part = req.getPart("mimg");
			String fileName = part.getSubmittedFileName();

			String useremail = req.getParameter("user");

			MobileDtls m = new MobileDtls(mobileName, brand, price, categories, status, fileName, useremail);
			MobileDAOImpl dao = new MobileDAOImpl(DBConnect.getconn());

			boolean f = dao.addMobiles(m);

			HttpSession session = req.getSession();
			if (f) {

				/*
				 * Setting the path of files to be stored on the server(servlet) path where it's
				 * running
				 */
				String path = getServletContext().getRealPath("") + "mobile";
                //System.out.println(path);

				File file = new File(path);
				part.write(path + File.separator + fileName);

				session.setAttribute("succMsg", "Mobile Added Successfully");
				resp.sendRedirect("sell_mobile.jsp");
			} else {
				session.setAttribute("failedMsg", "Something went wrong on the Server");
				resp.sendRedirect("sell_mobile.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();

		}
	}

}
