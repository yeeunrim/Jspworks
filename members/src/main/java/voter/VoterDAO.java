package voter;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.JDBCUtil;

public class VoterDAO {
	
	Connection conn = null; // db 연결 및 종료
	PreparedStatement pstmt = null; // sql 처리
	ResultSet rs = null; // 검색한 데이터셋
	
	// 좋아요 추가
	public void insertVote(Voter voter) {
		conn = JDBCUtil.getConnection();
		String sql = "INSERT INTO voter(vno, bno, mid) VALUES (seq_vno.NEXTVAL, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, voter.getBno());
			pstmt.setString(2, voter.getMid());
			
			// sql 실행
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	} // insertVote() 끝

	// 해당 게시글의 좋아요 총 개수
	public int voteCount(int bno) {
		conn = JDBCUtil.getConnection();
		String sql = "SELECT COUNT(*) AS total FROM voter WHERE bno = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			// sql 실행
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				// 카운트한 값이 있으면 숫자 반환
				return rs.getInt("total");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		// 카운트한 값이 없으면 0을 반환
		return 0;
	}

	// 좋아요 저장 유무 확인 (체크) - 세션아이디, 글번호가 일치
	public int checkVoter(int bno, String id) {
		conn = JDBCUtil.getConnection();
		String sql = "SELECT COUNT(*) AS result FROM voter WHERE bno = ? AND mid = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			pstmt.setString(2, id);
			
			// sql 실행
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				// 카운트한 값이 있으면 숫자 반환
				return rs.getInt("result");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		// 카운트한 값이 없으면 0을 반환
		return 0;
	}

	// 좋아요 삭제
	public void deleteVote(Voter voter) {
		conn = JDBCUtil.getConnection();
		String sql = "DELETE FROM voter WHERE bno = ? AND mid = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, voter.getBno());
			pstmt.setString(2, voter.getMid());
			
			// sql 실행
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
	
	
	
	
	
	
	
	
	
	

}
