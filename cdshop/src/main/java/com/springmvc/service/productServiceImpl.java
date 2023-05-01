package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.springmvc.domain.productDTO;
import com.springmvc.repository.productRepository;

@Service
public class productServiceImpl implements productService {
	@Autowired
	private productRepository productrepository;
	
	//전체상품 뿌리기
	public List<productDTO> getAllProductList(){
		return productrepository.getAllProductList();
	}
	

	
	//productid와 일치하는 상품 가져오기
	public productDTO getProductById(String productId) {
		System.out.println("야 서비스 넌 들어오냐 값?");
		productDTO productById = productrepository.getProductById(productId);
		System.out.println("productById 가져오냐??? : " + productById);
		return productById;
	}
	
	//상품 등록
	public void setNewProduct(productDTO product) {
		productrepository.setNewProduct(product);
	}
	
	//상품수정
	public void setUpdateProduct(productDTO product) {
		System.out.println("updateservice 들어오니?");
		productrepository.setUpdateProduct(product);
		
	}
	
	//상품삭제
	public void setDeleteProduct(String productId) {
		System.out.println("deleteservice 들어오니?");
		productrepository.setDeleteProduct(productId);
	}
	
//	//상품 전체 가져와서 모델에 담는 기능
//	public void getallproduct(Model model) {
//		List<productDTO> productlist = productrepository.getAllProductList();
//		model.addAttribute("productlist", productlist);
//	}
	
//	//상품 id와 일치하는 정보 모델에 담는 기능
//	public void getproductByid(String productId, Model model){
//		productDTO product = productrepository.getproductByid(productId);
//		model.addAttribute("product", product);
//	}
}