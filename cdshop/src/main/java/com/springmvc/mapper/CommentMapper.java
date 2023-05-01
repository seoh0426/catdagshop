package com.springmvc.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.commentDTO;

public class CommentMapper implements RowMapper<commentDTO>{

	@Override
	public commentDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
		commentDTO comment = new commentDTO();
		comment.setNum(rs.getInt(1));
		comment.setName(rs.getString(2));
		comment.setBnum(rs.getInt(3));
		comment.setComment(rs.getString(4));
		comment.setRegist(rs.getString(5));
		comment.setParent_num(rs.getInt(6));
		comment.setDepth(rs.getInt(7));
		comment.setOrder(rs.getInt(8));
		return comment;
	}
	

}