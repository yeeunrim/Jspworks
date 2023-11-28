package student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCUtil;

// Student 자료형으로 추가, 목록을 보여줄 클래스 생성
public class StudentDAO {

	// db 연결 및 종료, sql 처리를 하는 메서드 생성
	Connection conn = null;
	PreparedStatement pstmt = null; // sql 처리 클래스
	ResultSet rs = null; // 데이터 검색할 때에만 사용
	
	// 학생 목록 보기
	public List<Student> getStudentList() {
		conn = JDBCUtil.getConnection();
		List<Student> students = new ArrayList<>();
		
		try {
			String sql = "SELECT * FROM student ORDER BY sid";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Student s = new Student();
				s.setSid(rs.getInt("sid"));
				s.setUsername(rs.getString("username"));
				s.setUniv(rs.getString("univ"));
				s.setBirth(rs.getString("birth"));
				s.setEmail(rs.getString("email"));
				
				// ArrayList에 객체(학생) 1명 저장
				students.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return students;
	} // getStudentList() 끝
	
	// 학생 추가 등록
	public void insertStudent(Student s) {
		
		conn = JDBCUtil.getConnection();
	
		try {
			String sql = "INSERT INTO student (username, univ, birth, email) "
					+ "VALUES (?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, s.getUsername());
			pstmt.setString(2, s.getUniv());
			pstmt.setString(3, s.getBirth());
			pstmt.setString(4, s.getEmail());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
				
	} // insertStudent() 끝
	
}