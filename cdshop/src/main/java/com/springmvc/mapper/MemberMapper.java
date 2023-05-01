package com.springmvc.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.memberDTO;

public class MemberMapper implements RowMapper<memberDTO>{

	@Override
	public memberDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
		memberDTO member = new memberDTO();
		member.setNum(rs.getInt(1));
		member.setEmail(rs.getString(2));
		member.setName(rs.getString(3));
		member.setPw(rs.getString(4));
		String phone = rs.getString(5);
		String[] phoneArr = phone.split("-");
		member.setPhone1(phoneArr[0]);
		member.setPhone2(phoneArr[1]);
		member.setPhone3(phoneArr[2]);
		member.setPost(rs.getString(6));
		member.setAddr1(rs.getString(7));
		member.setAddr2(rs.getString(8));
		member.setLevel(rs.getInt(9));
		
		return member;
	}
	
}