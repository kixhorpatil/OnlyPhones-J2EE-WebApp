package com.dao;

import java.util.List;

import com.entity.Mobile_Order;


public interface MobileOrderDAO {
		
	public boolean saveOrder(List<Mobile_Order> m);
	
	public List<Mobile_Order> getMobile(String email);
	
	public List<Mobile_Order> getAllOrder();

}
