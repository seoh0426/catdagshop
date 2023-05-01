package com.springmvc.domain;

import java.io.Serializable;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class productDTO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String productId;
	private int num;
	private String name;
	private String category;
	private String titlement;
	private String simpledescription;
	private String manufacturer;
	private int unitprice;
	private long unitsinstock;
	private MultipartFile detailimage;
	private MultipartFile titleimage;
	private int hit;
	private String dfilename;
	private String tfilename;
	
	public productDTO() {
		super();
	} 

	
	
	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitlement() {
		return titlement;
	}

	public void setTitlement(String titlement) {
		this.titlement = titlement;
	}

	public String getSimpledescription() {
		return simpledescription;
	}

	public void setSimpledescription(String simpledescription) {
		this.simpledescription = simpledescription;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public int getUnitprice() {
		return unitprice;
	}

	public void setUnitprice(int unitprice) {
		this.unitprice = unitprice;
	}

	public long getUnitsinstock() {
		return unitsinstock;
	}

	public void setUnitsinstock(long unitsinstock) {
		this.unitsinstock = unitsinstock;
	}

	public MultipartFile getDetailimage() {
		return detailimage;
	}

	public void setDetailimage(MultipartFile detailfilename) {
		this.detailimage = detailfilename;
	}

	public MultipartFile getTitleimage() {
		return titleimage;
	}

	public void setTitleimage(MultipartFile titleimage) {
		this.titleimage = titleimage;
	}


	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}



	public String getDfilename() {
		return dfilename;
	}



	public void setDfilename(String dfilename) {
		this.dfilename = dfilename;
	}



	public String getTfilename() {
		return tfilename;
	}



	public void setTfilename(String tfilename) {
		this.tfilename = tfilename;
	}
	
	
}
