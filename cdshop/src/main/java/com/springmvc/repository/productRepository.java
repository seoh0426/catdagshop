package com.springmvc.repository;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.springmvc.domain.productDTO;

public interface productRepository {
	//전체상품리스트
	List<productDTO> getAllProductList(); 
	//상품id와 일치하는 상품 찾아오기
	productDTO getProductById(String productId);
	// 상품등록
	public void setNewProduct(productDTO product);
	//상품수정
	void setUpdateProduct(productDTO product);
	//상품삭제
	void setDeleteProduct(String productId);
	
	/* public productDTO getproductByid(String productId); */
}