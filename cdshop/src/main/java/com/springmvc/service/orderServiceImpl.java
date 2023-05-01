package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.orderDTO;
import com.springmvc.repository.orderRepository;

@Service
public class orderServiceImpl implements orderService {
   @Autowired
   private orderRepository or;
   
   //주문목록 추가
   public void setNewOrder(String productname, String name, int totalPrice, orderDTO order, String onum) {
	   System.out.println("orderservice setNewOrder 들어왔댜"); 
	   System.out.println("orderservice - name :" + name);
       or.setNewOrder(productname, name, totalPrice, order, onum);
   }
   
   // 주문목록 전체 리스트
   public List<orderDTO> getAllOrderList(String name){
	   System.out.println("orderservice AllOrderList 들어왔댜"); 
       return or.getAllOrderList(name);
   }
   
   // 같은 이름인거 찾아서 반환
   public orderDTO getMemberByName(String name) {
	  System.out.println("orderservice MemberByName 들어왔댜"); 
      orderDTO MemberByName = or.getMemberByNmae(name);
      return MemberByName;
   }
   
   // 주문목록 상세보기 리스트
   public List<orderDTO> getOrderprolist(String onum){
	   return or.getOrderprolist(onum);
   }
   	
}