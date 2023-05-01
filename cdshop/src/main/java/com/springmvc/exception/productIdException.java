package com.springmvc.exception;

@SuppressWarnings("serial")
public class productIdException extends RuntimeException {
	
	private String productId;
	
	public productIdException(String productId) {
		this.productId = productId;
	}
	
	public String getProductId(){
		return productId;
	}
}
