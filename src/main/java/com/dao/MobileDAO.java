package com.dao;

import java.util.List;

import com.entity.MobileDtls;

public interface MobileDAO {
	public boolean addMobiles(MobileDtls m);

	public List<MobileDtls> getAllMobiles();

	public MobileDtls getMobileById(int id); //return type is bookDtls

	public boolean updateEditMobiles(MobileDtls m);

	public boolean deleteMobiles(int id);

	public List<MobileDtls> getNewMobile();

	public List<MobileDtls> getOldMobile();

	public List<MobileDtls> getAllNewMobile();

	public List<MobileDtls> getAllOldMobile();
	
	public List<MobileDtls> getMobileByOld(String email, String cate);
	
	public boolean oldMobileDelete(String email, String cat, int id);
	
	public List<MobileDtls> getMobileBySearch(String ch);

}
