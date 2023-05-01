package com.springmvc.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.boardDTO;

public class AllBoardMapper implements RowMapper<boardDTO> {

	@Override
	public boardDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
		boardDTO board = new boardDTO();
		board.setCbnum(rs.getInt(1));
		board.setQbnum(rs.getInt(2));
		board.setName(rs.getString(3));
		board.setBoard_type(rs.getString(4));
		board.setTagsrc(rs.getString(5));
		board.setTagvalue(rs.getString(6));
		board.setTitle(rs.getString(7));
		board.setContent(rs.getString(8));
		board.setRegist_day(rs.getString(9));
		board.setHit(rs.getInt(10));
		board.setRecom(rs.getInt(11));
		return board;
	}
	
}
