package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.cartDTO;
import com.springmvc.repository.cartRepository;
@Service
public class cartServiceImpl implements cartService {
   @Autowired
   private cartRepository cr;
   
//   public void setNewCart(cartDTO cart) {
//      cr.setNewCart(cart);
//   };
   
   //장바구니 상품 추가
   public void setNewCart(String productId, String name, int quantity)
   {
      cr.setNewCart(productId, name, quantity);
   }
   
   //장바구니 전체 목록 리스트
   public List<cartDTO> getAllCartList(String name){
      return cr.getAllCartList(name);
   }
   
   // 같은 name 찾아서 목록 반환
   public cartDTO getMemberByNmae(String m_name) {
      cartDTO MemberByName = cr.getMemberByNmae(m_name);
      return MemberByName;
   }
   
   //장바구니 목록 개별 삭제
   public void setDeleteCart(String productname) {
	   cr.setDeleteCart(productname);
   }
   
   //장바구니 목록 전체 삭제
   public void setAllDeleteCart(String name) {
	   cr.setAllDeleteCart(name);
   }
   
   //장바구니에서 수량변경
   public void setUpdateQnt(String productname, int quantity) {
	  cr.setUpdateQnt(productname, quantity);
   }
   
}