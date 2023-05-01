package com.springmvc.repository;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.cartDTO;
import com.springmvc.domain.orderDTO;

@Repository
public class orderRepositoryImpl implements orderRepository {

   private JdbcTemplate template;
   private List<orderDTO> orderlist = new ArrayList<orderDTO>();
   private List<orderDTO> orderprolist = new ArrayList<orderDTO>();
   
   @Autowired
   public void setJdbctemplate(DataSource dataSource) {
      this.template = new JdbcTemplate(dataSource);
   }
   
   //주문목록 추가
   public void setNewOrder(String productname, String name, int totalPrice, orderDTO order, String onum) {
      String selectsql = "select * from cart where p_name=?";
      cartDTO cart = template.queryForObject(selectsql, new cartRowMapper(), productname);
      String insertsql = "insert into buy (o_num, p_id, p_name, m_name, b_qnt, b_date, b_orderprice, p_tfilename, p_price) values(?,?,?,?,?,?,?,?,?) ";
      template.update(insertsql, order.getOnum(), cart.getProductId() ,productname, name, cart.getQuantity(), order.getOrderdate(), totalPrice, cart.getTfilename(), cart.getPrice());
      String deletesql = "delete from cart where p_id=? and m_name=?";
      template.update(deletesql, productname, name);
   }
   
   //주문목록 전체 리스트
   public List<orderDTO> getAllOrderList(String name){
      String SQL = "select * from buy where m_name=?";
      List<orderDTO> listOforder = template.query(SQL, new orderRowMapper(), name);
      this.orderlist = listOforder;
      return listOforder;
   }
   
   //member name과 일치하는 목록 가져옴
   public orderDTO getMemberByNmae(String name) {
         orderDTO MemberByName = null;
         for(int i = 0; i<orderlist.size(); i++) {
            orderDTO order = orderlist.get(i);
            if(order != null && order.getName() != null && order.getName().equals(name)) {
               MemberByName = order;
               break;
            }
         }
         return MemberByName;
      }
   
   // 주문목록 상세보기
   public List<orderDTO> getOrderprolist(String onum){
	   System.out.println("orderrepository orderprolist 들어와땨");
	   String sql = "select * from buy where o_num=?";
	   List<orderDTO> orderprolist = template.query(sql, new orderRowMapper(), onum);
	   this.orderprolist = orderprolist;
	   return orderprolist;
   }
}