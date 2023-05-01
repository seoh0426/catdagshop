package com.springmvc.service;

import java.util.List;

import com.springmvc.domain.cartDTO;

public interface cartService {
   //장바구니 상품 추가
   void setNewCart(String productId, String name, int quantity);
   //장바구니 전체 리스트
   public List<cartDTO> getAllCartList(String name);
   // 같은 name 목록 찾아서 반환
   public cartDTO getMemberByNmae(String m_name);
   // 장바구니 목록 개별 삭제
   void setDeleteCart(String productname);
   // 장바구니 목록 전체 삭제
   void setAllDeleteCart(String name);
   // 장바구니에서 수량변경
   void setUpdateQnt(String productname, int quantity);
   
}