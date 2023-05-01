package com.springmvc.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import com.springmvc.domain.productDTO;

public class JDBCTest {

	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testConnection() {
		try(Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/cdcdb?serverTimezone=Asia/Seoul","root","1234")) {
			System.out.println(con);
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
	
//	@Test
//	public List<productDTO> selectAllProducts(){
//		
//		List<productDTO> list = new ArrayList<productDTO>();
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		String sql;
//		try {
//			conn = com.springmvc.database.DBConnection.getConnection();
//			sql = "select * from product order by p_num desc";
//			pstmt = conn.prepareStatement(sql);
//			rs=pstmt.executeQuery();
//			while (rs.next()) {
//				productDTO dto = new productDTO();
//				dto.setNum(rs.getInt("p_num"));
//				dto.setManufacturer(rs.getString("p_manufacturer"));
//				dto.setName(rs.getString("p_name"));
//				dto.setUnitprice(rs.getInt("p_unitprice"));
//				list.add(dto);
//			}
//		}catch (Exception e) {
//			System.out.println("최근상품 먼저 출력하기 실패!" + e);
//		}finally {
//			try {
//				if(rs != null)
//					rs.close();
//				if(pstmt != null)
//					rs.close();
//				if(conn != null)
//					rs.close();
//			} catch (Exception e2) {
//				System.out.println("최근상품 close 실패 !" + e2);
//			}
//		}
//		System.out.println("최근상품 정렬 프로세스 실패");
//		return list;
//	}
}