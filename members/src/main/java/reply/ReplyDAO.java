package reply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCUtil;

//댓글을 추가, 수정, 삭제, 검색하는 클래스
public class ReplyDAO {
	Connection conn = null;         //db 연결 및 종료
	PreparedStatement pstmt = null; //sql 처리
	ResultSet rs = null;            //검색한 데이터셋
	
	//댓글 목록
	public List<Reply> getReplyList(int bno){
		List<Reply> replyList = new ArrayList<>();
		try {
			conn = JDBCUtil.getConnection();
			String sql = "SELECT * FROM reply WHERE bno = ? "
					+ "ORDER BY rdate";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			//sql 처리
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Reply r = new Reply();
				r.setRno(rs.getInt("rno"));
				r.setBno(rs.getInt("bno"));
				r.setRcontent(rs.getString("rcontent"));
				r.setReplyer(rs.getString("replyer"));
				r.setRdate(rs.getTimestamp("rdate"));
				r.setRupdate(rs.getTimestamp("rupdate"));
				
				replyList.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return replyList;
	}
	
	//댓글 등록
	public void insertreply(Reply r) {
		try {
			conn = JDBCUtil.getConnection();
			String sql = "INSERT INTO reply(rno, bno, rcontent, replyer) "
					+ "VALUES (seq_rno.NEXTVAL, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r.getBno());
			pstmt.setString(2, r.getRcontent());
			pstmt.setString(3, r.getReplyer());
			//sql 처리
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
	//댓글 삭제 - 댓글 번호로 검색
	public void deletereply(int rno) {
		try {
			conn = JDBCUtil.getConnection();
			String sql = "DELETE FROM reply WHERE rno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			//sql 처리
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
}//replyDAO 닫기