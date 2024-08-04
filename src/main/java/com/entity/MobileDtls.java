package com.entity;

public class MobileDtls {
	private int mobileId;
	private String mobileName;
	private String brand;
	private String price;
	private String mobileCategory;
	private String status;
	private String photoName;
	private String email;

	public MobileDtls() {
		super();
	}

	public MobileDtls(String mobileName, String brand, String price, String mobileCategory, String status,
			String photoName, String email) {
		super();
		this.mobileName = mobileName;
		this.brand = brand;
		this.price = price;
		this.mobileCategory = mobileCategory;
		this.status = status;
		this.photoName = photoName;
		this.email = email;
	}

	@Override
	public String toString() {
		return "MobileDtls [mobileId=" + mobileId + ", mobileName=" + mobileName + ", brand=" + brand + ", price="
				+ price + ", mobileCategory=" + mobileCategory + ", status=" + status + ", photoName=" + photoName
				+ ", email=" + email + "]";
	}

	public int getMobileId() {
		return mobileId;
	}

	public void setMobileId(int mobileId) {
		this.mobileId = mobileId;
	}

	public String getMobileName() {
		return mobileName;
	}

	public void setMobileName(String mobileName) {
		this.mobileName = mobileName;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getMobileCategory() {
		return mobileCategory;
	}

	public void setMobileCategory(String mobileCategory) {
		this.mobileCategory = mobileCategory;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPhotoName() {
		return photoName;
	}

	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
