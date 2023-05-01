package com.springmvc.repository;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.cartDTO;
import com.springmvc.domain.productDTO;

@Repository
public class cartRepositoryImpl implements cartRepository {
   
   private JdbcTemplate template;
   private List<cartDTO> cartlist = new ArrayList<cartDTO>();
   
   @Autowired
   public void setJdbctemplate(DataSource dataSource) {
      this.template = new JdbcTemplate(dataSource);
   }
   
   // 상품 추가
   public void setNewCart(String productId, String name, int quantity)
   {
      String selectSql = "select * from product where p_id=?";
      productDTO product = template.queryForObject(selectSql, new productRowMapper(), productId);
      // 같은 상품 담을 경우 원래 담겨있는 값에 수량만 증가시킴
      String insertSql = "insert into cart (m_name, p_id, p_name, p_unitprice, ca_qnt, p_tfilename) values(?, ?, ?, ?, ?, ?) on duplicate key update m_name=?, p_id=?, p_name=?, p_unitprice=?, ca_qnt=ca_qnt+?, p_tfilename=?";
      template.update(insertSql, name, product.getProductId() , product.getName(), product.getUnitprice(), quantity, product.getTfilename(), name, product.getProductId() ,product.getName(), product.getUnitprice(), quantity, product.getTfilename());
   }
   
   //상품 전체 리스트
   public List<cartDTO> getAllCartList(String name){
      String SQL = "select * from cart where m_name=?";
      List<cartDTO> listOfcart = template.query(SQL, new cartRowMapper(), name);
      this.cartlist = listOfcart;
      return listOfcart;
   }
   
   //멤버 name과 일치하는 목록 반환
   public cartDTO getMemberByNmae(String name) {
      cartDTO MemberByName = null;
      for(int i = 0; i<cartlist.size(); i++) {
         cartDTO cart = cartlist.get(i);
         if(cart != null && cart.getName() != null && cart.getName().equals(name)) {
            MemberByName = cart;
            break;
         }
      }
      return MemberByName;
   }
   
   //장바구니 안에서 수량증가
   public void setUpdateQnt(String productname, int quantity) {
	   String updatesql = "update cart set ca_qnt=? where p_name=?";
	   template.update(updatesql, quantity, productname);
	   
   }
   
   // 상품개별삭제
   public void setDeleteCart(String productname) {
	   String sql = "delete from cart where p_name =?";
	   this.template.update(sql, productname);
   }
   
   // 상품 전체 삭제
   public void setAllDeleteCart(String name) {
	   String sql = "delete from cart where m_name =?";
	   this.template.update(sql, name);
   }
   
   
//   public cart read(String cartId) {
//      //장바구니 id 이용해서 장바구니에 등록된 모든 정보 가져와 반환
//      System.out.println("cartrepository - 카트 정보 반환하니?");
//      
//      return listOfCarts.get(cartId);
//   }
//   
   
//   public void update(String cartId, cart Cart) {
//      if (!listOfCarts.keySet().contains(cartId)) {
//         throw new IllegalArgumentException(String.format("장바구니 목록을 갱신할 수 없습니다. 장바구니 id(%)가 존재하지 않습니다.", cartId));
//         // 장바구니 id가 존재하지 않을 경우 예외처리
//      }
//      listOfCarts.put(cartId, Cart);
//   }
//   
//   public void delete(String cartId) {
//      if(!listOfCarts.keySet().contains(cartId)) {
//         //장바구니 id가 존재하지 않으면 예외처리
//         throw new IllegalArgumentException(String.format("장바구니 목록을 삭제할 수 없습니다. 장바구니 id(%)가 존재하지 않습니다", cartId));
//      }
//      listOfCarts.remove(cartId);
//   }
}