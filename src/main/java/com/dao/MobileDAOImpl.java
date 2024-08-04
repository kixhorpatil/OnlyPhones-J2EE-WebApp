package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.MobileDtls;

public class MobileDAOImpl implements MobileDAO {

	private Connection conn;

	public MobileDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addMobiles(MobileDtls m) {
		boolean f = false;

		try {
			String sql = "INSERT INTO mobile_dtls (mobileName, brand, price, mobileCategory, status, photo, user_email) VALUES (?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, m.getMobileName());
			ps.setString(2, m.getBrand());
			ps.setString(3, m.getPrice());
			ps.setString(4, m.getMobileCategory());
			ps.setString(5, m.getStatus());
			ps.setString(6, m.getPhotoName());
			ps.setString(7, m.getEmail());

			int i = ps.executeUpdate();
			// If one row is affected by the update query, registration is successful
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	public List<MobileDtls> getAllMobiles() {

		List<MobileDtls> list = new ArrayList<MobileDtls>();
		MobileDtls m = null;

		try {
			String sql = "select * from mobile_dtls";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				m = new MobileDtls();
				m.setMobileId(rs.getInt(1));
				m.setMobileName(rs.getString(2));
				m.setBrand(rs.getString(3));
				m.setPrice(rs.getString(4));
				m.setMobileCategory(rs.getString(5));
				m.setStatus(rs.getString(6));
				m.setPhotoName(rs.getString(7));
				m.setEmail(rs.getString(8));

				list.add(m);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public MobileDtls getMobileById(int id) {
		MobileDtls b = null;
		try {
			String sql = "select * from mobile_dtls where mobileId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new MobileDtls();
				b.setMobileId(rs.getInt(1));
				b.setMobileName(rs.getString(2));
				b.setBrand(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setMobileCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return b;
	}

	
	public boolean updateEditMobiles(MobileDtls m) {
		boolean f = false;
		try {
			String sql = "UPDATE mobile_dtls SET mobileName=?, brand=?, price=?, status=? WHERE mobileId=?";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, m.getMobileName());
			ps.setString(2, m.getBrand());
			ps.setString(3, m.getPrice());
			ps.setString(4, m.getStatus());
			ps.setInt(5, m.getMobileId());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean deleteMobiles(int id) {
		Boolean f = false;
		try {
			String sql = "delete from mobile_dtls where mobileId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<MobileDtls> getNewMobile() {
		List<MobileDtls> list = new ArrayList<MobileDtls>();
		MobileDtls m = null;
		try {
			String sql = "select * from mobile_dtls where  mobileCategory=? and status=? order by mobileId DESC ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				m = new MobileDtls();
				m.setMobileId(rs.getInt(1));
				m.setMobileName(rs.getString(2));
				m.setBrand(rs.getString(3));
				m.setPrice(rs.getString(4));
				m.setMobileCategory(rs.getString(5));
				m.setStatus(rs.getString(6));
				m.setPhotoName(rs.getString(7));
				m.setEmail(rs.getString(8));
				list.add(m);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<MobileDtls> getOldMobile() {
		List<MobileDtls> list = new ArrayList<MobileDtls>();
		MobileDtls m = null;
		try {
			String sql = "select * from mobile_dtls where  mobileCategory=? and status=? order by mobileId DESC ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				m = new MobileDtls();
				m.setMobileId(rs.getInt(1));
				m.setMobileName(rs.getString(2));
				m.setBrand(rs.getString(3));
				m.setPrice(rs.getString(4));
				m.setMobileCategory(rs.getString(5));
				m.setStatus(rs.getString(6));
				m.setPhotoName(rs.getString(7));
				m.setEmail(rs.getString(8));
				list.add(m);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public List<MobileDtls> getAllNewMobile() {
		List<MobileDtls> list = new ArrayList<MobileDtls>();
		MobileDtls m = null;
		try {
			String sql = "select * from mobile_dtls where  mobileCategory=? and status=? order by mobileId DESC ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				m = new MobileDtls();
				m.setMobileId(0);
				m.setMobileName(rs.getString(2));
				m.setBrand(rs.getString(3));
				m.setPrice(rs.getString(4));
				m.setMobileCategory(rs.getString(5));
				m.setStatus(rs.getString(6));
				m.setPhotoName(rs.getString(7));
				m.setEmail(rs.getString(8));
				list.add(m);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<MobileDtls> getAllOldMobile() {
		List<MobileDtls> list = new ArrayList<MobileDtls>();
		MobileDtls m = null;
		try {
			String sql = "select * from mobile_dtls where  mobileCategory=? and status=? order by mobileId DESC ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
//			int i = 1;
			while (rs.next()) {
				m = new MobileDtls();
				m.setMobileId(rs.getInt(1));
				m.setMobileName(rs.getString(2));
				m.setBrand(rs.getString(3));
				m.setPrice(rs.getString(4));
				m.setMobileCategory(rs.getString(5));
				m.setStatus(rs.getString(6));
				m.setPhotoName(rs.getString(7));
				m.setEmail(rs.getString(8));
				list.add(m);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<MobileDtls> getMobileByOld(String email, String cate) {
		List<MobileDtls> list = new ArrayList<MobileDtls>();
		MobileDtls m = null;
		try {
			String sql = "select * from mobile_dtls where mobileCategory=? and user_email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, cate);
			ps.setString(2, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				m = new MobileDtls();
				m.setMobileId(rs.getInt(1));
				m.setMobileName(rs.getString(2));
				m.setBrand(rs.getString(3));
				m.setPrice(rs.getString(4));
				m.setMobileCategory(rs.getString(5));
				m.setStatus(rs.getString(6));
				m.setPhotoName(rs.getString(7));
				m.setEmail(rs.getString(8));
				list.add(m);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean oldMobileDelete(String email, String cat, int id) {

		boolean f = false;

		try {
			String sql = "delete from mobile_dtls where mobileCategory=? and user_email=? and mobileId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, cat);
			ps.setString(2, email);
			ps.setInt(3, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<MobileDtls> getMobileBySearch(String ch) {
		List<MobileDtls> list = new ArrayList<MobileDtls>();
		MobileDtls m = null;
		try {
			String sql = "SELECT * FROM mobile_dtls WHERE (mobileName LIKE ? OR brand LIKE ? OR mobileCategory mIKE ?) AND status = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + ch + "%");
			ps.setString(2, "%" + ch + "%");
			ps.setString(3, "%" + ch + "%");
			ps.setString(4, "Active");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				m = new MobileDtls();
				m.setMobileId(rs.getInt(1));
				m.setMobileName(rs.getString(2));
				m.setBrand(rs.getString(3));
				m.setPrice(rs.getString(4));
				m.setMobileCategory(rs.getString(5));
				m.setStatus(rs.getString(6));
				m.setPhotoName(rs.getString(7));
				m.setEmail(rs.getString(8));
				list.add(m);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
