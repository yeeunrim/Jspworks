package bean;

import java.io.Serializable;

public class LoginBean implements Serializable{

	private static final long serialVersionUID = 1L;

    // loginform.jsp의 name과 같게 해야한다.
	private String uid;
	private String upwd;
	
	final String _uid = "today"; // 상수
	final String _upwd = "1234"; // 상수
	
	// 로그인 체크 메서드
	public boolean checkUser() {
		if(uid.equals(_uid) && upwd.equals(_upwd)) {
			return true;
		} else {
			return false;
		}
	}

	// getter, setter
	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUpwd() {
		return upwd;
	}

	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}
	
}