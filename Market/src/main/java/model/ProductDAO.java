package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCUtil;

public class ProductDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// 상품 목록 보기
	public List<Product> getProductList(){
		
		List<Product> productList = new ArrayList<>();
		
		try {
			// DB 연동
			conn = JDBCUtil.getConnection();
			
			if(conn != null) {
				// SQL 처리
				String sql = "select * from product";
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					Product p = new Product();
					
					p.setPno(rs.getInt("p_no"));
					p.setPid(rs.getString("p_id"));
					p.setPname(rs.getString("p_name"));
					p.setPrice(rs.getInt("p_price"));
					p.setDescription(rs.getString("p_description"));
					p.setCategory(rs.getString("p_category"));
					p.setPstock(rs.getLong("p_stock"));
					p.setCondition(rs.getString("p_condition"));
					p.setPimage(rs.getString("p_image"));
					p.setRegDate(rs.getTimestamp("regdate"));
					p.setUpdateDate(rs.getTimestamp("updatedate"));
					
					// 리스트에 객체 저장
					productList.add(p);
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// DB 종료
			JDBCUtil.close(conn, pstmt, rs);		
		}
		
		return productList;
		
	} // getProductList() 끝

	// 상품 등록 메서드
	public void insertproduct(Product p) {
		
		try {
			// DB 연동
			conn = JDBCUtil.getConnection();
			
			if(conn != null) {
				// SQL 처리
				String sql = "insert into product(p_id, p_name, p_price, p_description, "
						+ "p_category, p_stock, p_condition, p_image) "
						+ "values (?, ?, ?, ?, ?, ?, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, p.getPid());
				pstmt.setString(2, p.getPname());
				pstmt.setInt(3, p.getPrice());
				pstmt.setString(4, p.getDescription());
				pstmt.setString(5, p.getCategory());
				pstmt.setLong(6, p.getPstock());
				pstmt.setString(7, p.getCondition());
				pstmt.setString(8, p.getPimage());
				
				pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// DB 종료
			JDBCUtil.close(conn, pstmt);		
		}
		
	} // insertproduct() 끝

	// 상품 상세보기 메서드
	public Product getProduct(String pid) {
		
		Product p = new Product();
		
		try {
			// DB 연동
			conn = JDBCUtil.getConnection();
			
			if(conn != null) {
				// SQL 처리
				String sql = "select * from product where p_id = ?";
				pstmt = conn.prepareStatement(sql);
			
				pstmt.setString(1, pid);
				
				// sql 검색 처리
				rs = pstmt.executeQuery();
				
				// 레코드 추출
				if(rs.next()) {
					p.setPno(rs.getInt("p_no"));
					p.setPid(rs.getString("p_id"));
					p.setPname(rs.getString("p_name"));
					p.setPrice(rs.getInt("p_price"));
					p.setDescription(rs.getString("p_description"));
					p.setCategory(rs.getString("p_category"));
					p.setPstock(rs.getLong("p_stock"));
					p.setCondition(rs.getString("p_condition"));
					p.setPimage(rs.getString("p_image"));
					p.setRegDate(rs.getTimestamp("regdate"));
					p.setUpdateDate(rs.getTimestamp("updatedate"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// DB 종료
			JDBCUtil.close(conn, pstmt, rs);			
		}
		
		return p;
		
	} // getProduct() 끝
	
	public void deleteProduct(String pid) {
		
		try {
			// DB 연동
			conn = JDBCUtil.getConnection();
			
			if(conn != null) {
				// SQL 처리
				String sql = "delete from product where p_id = ?";
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, pid);
				
				pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// DB 종료
			JDBCUtil.close(conn, pstmt);			
		}
		
	} // deleteProduct() 끝

	// 이미지 파일이 있는 경우, 수정
	public void updateProduct(Product p) {
		
		try {
			// DB 연동
			conn = JDBCUtil.getConnection();
			
			if(conn != null) {
				// SQL 처리
				String sql = "update product set p_name = ?, p_price = ?, p_description = ?, p_category = ?, p_stock = ?, p_condition = ?, p_image = ? where p_id = ?";
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, p.getPname());
				pstmt.setInt(2, p.getPrice());
				pstmt.setString(3, p.getDescription());
				pstmt.setString(4, p.getCategory());
				pstmt.setLong(5, p.getPstock());
				pstmt.setString(6, p.getCondition());
				pstmt.setString(7, p.getPimage());
				pstmt.setString(8, p.getPid());
				
				pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// DB 종료
			JDBCUtil.close(conn, pstmt);			
		}
		
	} // updateProduct() 끝
	
	// 이미지 파일이 없는 경우, 수정
		public void updateProductNoImgae(Product p) {
			
			try {
				// DB 연동
				conn = JDBCUtil.getConnection();
				
				if(conn != null) {
					// SQL 처리
					String sql = "update product set p_name = ?, p_price = ?, p_description = ?, p_category = ?, p_stock = ?, p_condition = ? where p_id = ?";
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, p.getPname());
					pstmt.setInt(2, p.getPrice());
					pstmt.setString(3, p.getDescription());
					pstmt.setString(4, p.getCategory());
					pstmt.setLong(5, p.getPstock());
					pstmt.setString(6, p.getCondition());
					pstmt.setString(7, p.getPid());
					
					pstmt.executeUpdate();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				// DB 종료
				JDBCUtil.close(conn, pstmt);			
			}
			
		} // updateProductNoImage() 끝
	
}
