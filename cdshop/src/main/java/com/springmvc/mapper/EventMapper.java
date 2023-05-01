package com.springmvc.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.boardDTO;

public class EventMapper implements RowMapper<boardDTO> {

	@Override
	public boardDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
		boardDTO board = new boardDTO();
		board.setNum(rs.getInt(1));
		board.setName(rs.getString(2));
		board.setBoard_type(rs.getString(3));
		board.setTitle(rs.getString(4));
		board.setContent(rs.getString(5));
		board.setRegist_day(rs.getString(6));
		board.setHit(rs.getInt(7));
		board.setRecom(rs.getInt(8));
		return board;
	}
	
	

}