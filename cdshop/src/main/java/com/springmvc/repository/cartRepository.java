package com.springmvc.repository;

import java.util.List;

import com.springmvc.domain.cartDTO;

public interface cartRepository {
   
	// 카드 테이블에 장바구니 목록 넣기
   void setNewCart(String productId, String name, int quantity);
   // cart안의 전체 상품 가져오기
   public List<cartDTO> getAllCartList(String name);
   // membername 과 일치하는지 확인
   public cartDTO getMemberByNmae(String m_name);
   // cart 하나씩 삭제
   void setDeleteCart(String productname);
   // 전체삭제 버튼 시 전체 삭제
   void setAllDeleteCart(String name);
   // 수량변경
   void setUpdateQnt(String productname, int quantity);
   
//   cart create(cart Cart);
//   cart read(String cartId);
//   void update(String cartId, cart Cart);

}