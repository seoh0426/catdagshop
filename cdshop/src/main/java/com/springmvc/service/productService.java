package com.springmvc.service;

import java.util.List;

import org.springframework.ui.Model;

import com.springmvc.domain.productDTO;

public interface productService {
	//상품전체리스트
	List<productDTO> getAllProductList(); 
	//상품아이디와 일치하는 상품 반환
	productDTO getProductById(String productId);
	//상품추가
	void setNewProduct(productDTO product); 
	//상품수정
	void setUpdateProduct(productDTO product);
	//상품삭제
	void setDeleteProduct(String productId); 
	
//	public void getallproduct(Model model);
//	public void getproductByid(String productId, Model model);
}