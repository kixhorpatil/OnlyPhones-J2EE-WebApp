package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CartDAOImpl;
import com.dao.MobileDAOImpl;
import com.db.DBConnect;
import com.entity.Cart;
import com.entity.MobileDtls;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int mid = Integer.parseInt(req.getParameter("mid"));
			int uid = Integer.parseInt(req.getParameter("uid"));
			
			
			
			MobileDAOImpl dao = new MobileDAOImpl(DBConnect.getconn());
			MobileDtls b = dao.getMobileById(mid); 
			
			
			Cart c = new Cart();
			c.setMid(mid);
			c.setUid(uid);
			c.setMobileName(b.getMobileName());
			c.setBrand(b.getBrand());
			c.setPrice(Double.parseDouble(b.getPrice())); //converting String to the double
			c.setTotalPrice(Double.parseDouble(b.getPrice()));
				
			CartDAOImpl dao2 = new CartDAOImpl(DBConnect.getconn());
			boolean f = dao2.addCart(c);
			
			HttpSession session = req.getSession();
			
			if (f) {
				session.setAttribute("addCart", "Mobile Added to Cart");
				resp.sendRedirect("all_new_mobile.jsp");
                //System.out.println("Add Cart Succees");
			}else {
				session.setAttribute("failed", "Something wrong on server");
				resp.sendRedirect("all_new_mobile.jsp");
                //System.out.println("Not added to cart");
			}
			

		} catch (Exception e) {
			e.printStackTrace();

		}
	}

}


