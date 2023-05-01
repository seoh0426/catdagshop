package com.springmvc.repository;

import java.util.List;

import com.springmvc.domain.orderDTO;

public interface orderRepository {
	//주문목록 추가
   void setNewOrder(String productname, String name, int totalPrice, orderDTO order, String onum);
   // 주문목록 전체 리스트
   public List<orderDTO> getAllOrderList(String name);
   // 같은 name 찾아서 반환
   public orderDTO getMemberByNmae(String name);
   //주문목록 상세보기
   public List<orderDTO> getOrderprolist(String onum);
}