package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Mobile_Order;

public class MobileOrderImpl implements MobileOrderDAO {
	public Connection conn;

	public MobileOrderImpl(Connection conn) {
		super();
		this.conn = conn;
	}


	public boolean saveOrder(List<Mobile_Order> mlist) {
		boolean f = false;

		try {
			String sql = "insert into mobile_order(order_id,user_name,email,address,phno,mobile_name,brand,price,payment) values(?,?,?,?,?,?,?,?,?)";

			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);

			for (Mobile_Order m : mlist) {
				ps.setString(1, m.getOrderId());
				ps.setString(2, m.getUserName());
				ps.setString(3, m.getEmail());
				ps.setString(4, m.getFulladd());
				ps.setString(5, m.getPhno());
				ps.setString(6, m.getMobileName());
				ps.setString(7, m.getBrand());
				ps.setString(8, m.getPrice());
				ps.setString(9, m.getPaymentType());
				ps.addBatch();

			}

			int[] count = ps.executeBatch();
			conn.commit();
			f = true;
			conn.setAutoCommit(true);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Mobile_Order> getMobile(String email) {
		List<Mobile_Order> list = new ArrayList();
		Mobile_Order o = null;
		try {
			String sql = "select * from mobile_order where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				o= new Mobile_Order(); // Initialize the object here
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUserName(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFulladd(rs.getString(5));
				o.setPhno(rs.getString(6));
				o.setMobileName(rs.getString(7));
				o.setBrand(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPaymentType(rs.getString(10));
				list.add(o);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; // Return the list here

	}

	public List<Mobile_Order> getAllOrder() {
		List<Mobile_Order> list = new ArrayList<Mobile_Order>();
		Mobile_Order o = null;
		try {
			String sql = "select * from mobile_order";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				o= new Mobile_Order(); // Initialize the object here
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUserName(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFulladd(rs.getString(5));
				o.setPhno(rs.getString(6));
				o.setMobileName(rs.getString(7));
				o.setBrand(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPaymentType(rs.getString(10));
				list.add(o);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; 

	}
}
