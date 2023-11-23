package addressbook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCUtil;

// AddrBook 자료형을 이용하여 주소를 생성, 검색, 수정, 삭제
// CRUD 담당 클래스
public class AddrBookDAO {
	
	// JDBC 관련 변수
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null; // DB에 있는 자료 - 검색할때만 사용
	
	// 	주소 추가 - Create
	public void addAddrBook(AddrBook addrBook) {
	
		// db 연결
		conn = JDBCUtil.getConnection();
				
		try {
			// sql 처리
			String sql = "INSERT INTO addrbook(bnum, username, tel, email, gender) "
					+ "VALUES (seq_bnum.NEXTVAL, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			// 폼에 입력된 자료를 가져와서 DB에 저장
			pstmt.setString(1, addrBook.getUsername());
			pstmt.setString(2, addrBook.getTel());
			pstmt.setString(3, addrBook.getEmail());
			pstmt.setString(4, addrBook.getGender());
			
			// sql 실헹
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
		
	}
	
	// 주소 전체 목록 보기 - Research
	public List<AddrBook> getListAll(){
		
		// db 연결
		conn = JDBCUtil.getConnection();
		// DB 정보를 저장할 배열 생성
		List<AddrBook> addrList = new ArrayList<>(); 
		
		try {
			// sql 처리
			String sql = "SELECT * FROM addrbook ORDER BY bnum";
			pstmt = conn.prepareStatement(sql);
			
			// sql 실행
			rs = pstmt.executeQuery();
			while(rs.next()) { // DB에 있는 주소를 가져와서 주소 객체에 저장
				// 빈 객체 생성
				AddrBook addrBook = new AddrBook();
				
				addrBook.setBnum(rs.getInt("bnum"));
				addrBook.setUsername(rs.getString("username"));
				addrBook.setTel(rs.getString("tel"));
				addrBook.setEmail(rs.getString("email"));
				addrBook.setGender(rs.getString("gender"));
				addrBook.setDate(rs.getTimestamp("regdate"));
				
				// 리스트에 1개 객체를 배열에 저장 (순서에 따라)
				addrList.add(addrBook);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// sql 종료
			JDBCUtil.close(conn, pstmt, rs);
		}
		return addrList; // 저장한 내용을 내보내기
		
	}
	
	// 주소 특정 목록 보기 - Research
	public AddrBook getListAll(int bnum) {
		
		// db 연결
		conn = JDBCUtil.getConnection();
		
		// 빈 객체 생성
		AddrBook addrBook = new AddrBook();
		
		try {
			// sql 처리
			String sql = "SELECT * FROM addrbook WHERE bnum = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bnum);
		
			// bnum이 일치하는 1개의 주소 가져옴
			rs = pstmt.executeQuery();
			if(rs.next()) {
				addrBook.setBnum(rs.getInt("bnum"));
				addrBook.setUsername(rs.getString("username"));
				addrBook.setTel(rs.getString("tel"));
				addrBook.setEmail(rs.getString("email"));
				addrBook.setGender(rs.getString("gender"));
				addrBook.setDate(rs.getTimestamp("regdate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// sql 종료
			JDBCUtil.close(conn, pstmt, rs);
		}
		return addrBook;
		
	}
	
	// 로그인 체크
	public boolean checkLogin(String email) {
		
		conn = JDBCUtil.getConnection();
		
		try {
			String sql = "SELECT email FROM addrbook "
					+ "WHERE email = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) { // 검색한 이메일이 있으면
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return false;
		
	}
	
	
	
	

}
