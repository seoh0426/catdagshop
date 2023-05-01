package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.orderDTO;

public class orderRowMapper implements RowMapper<orderDTO>{
   public orderDTO mapRow(ResultSet rs, int rowNum) throws SQLException{
      orderDTO order = new orderDTO();
      
      order.setNum(rs.getInt(1));
      order.setOnum(rs.getString(2));
      order.setProductId(rs.getString(3));
      order.setProductname(rs.getString(4));
      order.setName(rs.getString(5));
      order.setQuantity(rs.getInt(6));
      order.setOrderdate(rs.getString(7));
      order.setSumprice(rs.getInt(8));
      order.setTfilename(rs.getString(9));
      order.setPrice(rs.getInt(10));
      
      return order;
   }

}