package com.springmvc.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.fileDTO;

public class FileMapper implements RowMapper<fileDTO>{

	@Override
	public fileDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
		fileDTO file = new fileDTO();
		file.setPknum(rs.getInt(1));
		file.setBoardtype(rs.getString(2));
		file.setCbnum(rs.getInt(3));
		file.setQbnum(rs.getInt(4));
		file.setNbnum(rs.getInt(5));
		file.setEbnum(rs.getInt(6));
		file.setHvbnum(rs.getInt(7));
		file.setFilename(rs.getString(8));
		return file;
	}
	
}