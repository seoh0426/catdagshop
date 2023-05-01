package com.springmvc.domain;


public class cartDTO {
   
   private int cartId;
   private String name;
   private String productId;
   private String productname;
   private int price;
   private int quantity;
   private String tfilename;
   
   public int getCartId() {
      return cartId;
   }
   public void setCartId(int cartId) {
      this.cartId = cartId;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
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
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public int getPrice() {
	      return price;
	}
   public void setPrice(int price) {
      this.price = price;
   }
   public int getQuantity() {
      return quantity;
   }
   public void setQuantity(int unitprice) {
      this.quantity = unitprice;
   }
   public String getTfilename() {
      return tfilename;
   }
   public void setTfilename(String tfilename) {
      this.tfilename = tfilename;
   }

   
   
      
   
   
}