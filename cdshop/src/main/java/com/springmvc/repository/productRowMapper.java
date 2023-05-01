package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.productDTO;

public class productRowMapper implements RowMapper<productDTO>{
	public productDTO mapRow(ResultSet rs, int rowNum) throws SQLException{
		productDTO product = new productDTO();

		product.setNum(rs.getInt(1));
		product.setProductId(rs.getString(2));
		product.setName(rs.getString(3));
		product.setCategory(rs.getString(4));
		product.setTitlement(rs.getString(5));
		product.setSimpledescription(rs.getString(6));
		product.setManufacturer(rs.getString(7));
		product.setUnitprice(rs.getInt(8));
		product.setUnitsinstock(rs.getLong(9));
		product.setDfilename(rs.getString(10));
		product.setTfilename(rs.getString(11));
		product.setHit(rs.getInt(12));

		return product;
	}

}
