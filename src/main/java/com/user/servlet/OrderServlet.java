package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CartDAOImpl;
import com.dao.MobileOrderImpl;
import com.db.DBConnect;
import com.entity.Cart;
import com.entity.Mobile_Order;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			HttpSession session = req.getSession();

			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("username");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pincode");
			String paymentType = req.getParameter("payment");

			String fullAdd = address + "," + landmark + "," + city + "," + state + "," + pincode;
			// System.out.println(name + " " + email + " " + phno + " " + fullAdd + " " + paymentType);

			CartDAOImpl dao = new CartDAOImpl(DBConnect.getconn());
			List<Cart> mlist = dao.getMobileByUser(id);

			/*
			 * To check whether the Mobile added into cart are showing are not for 
			 * (Cart c : mlist) { System.out.println(m.getMobileName()); }
			 */

			if (mlist.isEmpty()) {
				session.setAttribute("failedMsg", "Add Item");

				resp.sendRedirect("checkout.jsp");

			} else {
				MobileOrderImpl dao2 = new MobileOrderImpl(DBConnect.getconn());
//				int i = dao2.getOrderNo();

				Mobile_Order o = null;

				ArrayList<Mobile_Order> orderList = new ArrayList<Mobile_Order>();
				Random r = new Random();
				for (Cart c : mlist) {
					o = new Mobile_Order();
					o.setOrderId("BOOK-ORD-OO" + r.nextInt(1000));
					o.setUserName(name);
					o.setEmail(email);
					o.setPhno(phno);
					o.setFulladd(fullAdd);
					o.setMobileName(c.getMobileName());
					o.setBrand(c.getBrand());
					o.setPrice(c.getPrice() + "");
					o.setPaymentType(paymentType);
					orderList.add(o);

					// to see the added mobile on the console
					// System.out.println(c.getMobileName()+" "+c.getBrand()+" "+c.getPrice());
				}

				if ("noselect".equals(paymentType)) {
					session.setAttribute("failedMsg", "Select Mode of Payment");
					resp.sendRedirect("checkout.jsp");
				} else {
					boolean f = dao2.saveOrder(orderList);
					if (f) {
						resp.sendRedirect("order_success.jsp");
					} else {
						System.out.println("Order Failed");
					}
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
