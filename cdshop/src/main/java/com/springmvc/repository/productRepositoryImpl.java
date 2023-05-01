package com.springmvc.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.database.DBConnection;
import com.springmvc.domain.productDTO;
import com.springmvc.exception.productIdException;
@Repository
public class productRepositoryImpl implements productRepository {
	
	private JdbcTemplate template;
	
	public List<productDTO> productlist = new ArrayList<productDTO>();
	
	@Autowired
	public void setJdbctemplate(DataSource dataSource) {
		this.template = new JdbcTemplate(dataSource);
	}
	
	private List<productDTO> listOfProduct = new ArrayList<productDTO>();
	
	// 전체 상품 목록 가져오기
	public List<productDTO> getAllProductList(){
		System.out.println("getAllProductList 들어와땨");
		String SQL = "select * from product";
		List<productDTO> listOfProduct = template.query(SQL, new productRowMapper());
		System.out.println("listOfProduct : "+listOfProduct);
		this.productlist = listOfProduct;
		System.out.println("ddddddd"+productlist);
		return listOfProduct;
	}
	
	
	
	// product 테이블의 레코드 개수
	public int getListCount(String items, String text) {
		Connection conn = null;
		System.out.println("conn : " + conn);
		PreparedStatement pstmt = null;
		System.out.println("pstmt : " + pstmt);
		ResultSet rs = null;
		System.out.println("rs" + rs);
		
		int x = 0;
		
		String sql;
		
		if (items == null && text == null) {
			sql = "select count(*) from product";
		}else
			sql = "select count(*) from product where" + items + " like '%" + text + "%'";
		try {
			conn = DBConnection.getConnection();
			System.out.println("conn1 : " + conn);
			pstmt = conn.prepareStatement(sql);
			System.out.println("pstmt1 : " + pstmt);
			rs = pstmt.executeQuery();
			System.out.println("rs1 : " + rs);
			
			if(rs.next())
				x = rs.getInt(1);
		}catch (Exception ex) {
			System.out.println("getListCount() 에러 : " + ex);
		}finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			}catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return x;
	}
	
	
	// productId와 일치하는 상품 가져오기
	public productDTO getProductById(String productId) {
		System.out.println("DAO ProductById 들어왔댜아아아아아");
		productDTO productById = null;
		System.out.println("들어오냐나아아아아아아아"+productlist);
		for(int i = 0; i<productlist.size(); i++) {
			
			productDTO product = productlist.get(i);
			System.out.println("너 product에 담기늬: " + product);
			if(product != null && product.getProductId() != null && product.getProductId().equals(productId)) {
				productById = product;
				System.out.println("productById 값 담기니? : " + productById);
				break;
			}
		}
		return productById;
	}
	
//	public productDTO getproductByid(String productId) {
//		productDTO productinfo = new productDTO();
//		String sql = "select * from product where p_id=?";
//		productlist = template.query(sql, new productRowMapper(), productId);
//		for(productDTO product : productlist) {
//			if(product.getProductId() == productId) {
//				productinfo = product;
//			}
//		}
//		return productinfo;
//	}
//	
	//상품등록하기
	public void setNewProduct(productDTO product) {
		String SQL = "insert into product (p_id, p_name, p_category, p_titlement, p_simpledescription, p_manufacturer, p_unitprice, p_unitsinstock, p_dfilename, p_tfilename, p_hit)" + "values(?,?,?,?,?,?,?,?,?,?,?)";
		template.update(SQL, product.getProductId(), product.getName(), product.getCategory(),product.getTitlement(), product.getSimpledescription(), product.getManufacturer(), product.getUnitprice(),product.getUnitsinstock(), product.getDfilename(), product.getTfilename(), product.getHit());
		System.out.println("들어갔니?" + SQL);
	}

	
	// 상품 수정
	public void setUpdateProduct(productDTO product) {
		System.out.println("updaterepository 들어왔니?");
		String SQL = "update product set p_num=? , p_name=?, p_category=?, p_titlement=?, p_simpledescription=?, p_manufacturer=?, p_unitprice=?, p_unitsinstock=?, p_hit=?, p_dfilename=?, p_tfilename=? where p_id=?";
		template.update(SQL, product.getNum(), product.getName(), product.getCategory(), product.getTitlement(), product.getSimpledescription(), product.getManufacturer(), product.getUnitprice(), product.getUnitsinstock(), product.getHit(), product.getDfilename(), product.getTfilename(), product.getProductId());
		System.out.println("값 들어왔니 ..?" + SQL);
	}
	
	//상품 삭제
	public void setDeleteProduct(String productId) {
		System.out.println("deleterepository 들어왔니?");
		String SQL = "delete from product where p_id=?";
		System.out.println("deleterepository-sql값 삭제했니?");
		this.template.update(SQL, productId);
	}
	

}