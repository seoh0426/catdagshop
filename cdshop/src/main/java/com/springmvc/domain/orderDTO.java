package com.springmvc.domain;

import java.util.List;

import com.springmvc.repository.orderprodutDTO;

public class orderDTO {
   
   private int num;
   private String onum;
   private String productId;
   private String productname;
   private String name;
   private int quantity;
   private int price;
   private String orderdate;
   private int sumprice;
   private String tfilename;
   private int totalprice;
   private List<orderprodutDTO> orderproduct;
   
   @Override
   public String toString() {
	   return "orderDTO [num=" + num + ", onum=" + onum + ", productId=" + productId + ", productname=" + productname + ", name=" 
			   + name + ". quantity=" + quantity + ", price=" + price + ", orderdate=" 
			   + orderdate + ", sumprice=" + sumprice + ", tfilename="  + tfilename + ", totalprice=" + totalprice + ", orderproduct=" + orderproduct + "]"; 
   }
   


   public int getNum() {
      return num;
   }
   public void setNum(int num) {
      this.num = num;
   }
   
   public String getOnum() {
	return onum;
   }
   public void setOnum(String onum) {
		this.onum = onum;
   }
   public String getProductId() {
	      return productId;
   }
   public void setProductId(String productId) {
      this.productId = productId;
   }
   public String getProductname() {
	   return productname;
   }
   public void setProductname(String produtname) {
	   this.productname = produtname;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public int getQuantity() {
      return quantity;
   }
   public void setQuantity(int quantity) {
      this.quantity = quantity;
   }
   public String getOrderdate() {
      return orderdate;
   }
   public void setOrderdate(String orderdate) {
      this.orderdate = orderdate;
   }
   public String getTfilename() {
      return tfilename;
   }
   public void setTfilename(String tfilename) {
      this.tfilename = tfilename;
   }
   public int getSumprice() {
      return sumprice;
   }
   public void setSumprice(int price) {
      this.sumprice = price;
   }
   public int getTotalprice() {
      return totalprice;
   }
   public void setTotalprice(int totalprice) {
      this.totalprice = totalprice;
   }
   public int getPrice() {
	return price;
   }
   public void setPrice(int price) {
	this.price = price;
   }
   public List<orderprodutDTO> getOrderproduct() {
	   return orderproduct;
   }
   public void setOrderproduct(List<orderprodutDTO> orderproduct) {
	   this.orderproduct = orderproduct;
   }
}