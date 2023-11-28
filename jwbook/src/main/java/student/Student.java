package student;

import java.io.Serializable;

// 데이터를 처리하기 위한 자료형 (VO)
public class Student implements Serializable{

	private static final long serialVersionUID = 100L;
	
	private int sid;
	private String username;
	private String univ;
	private String birth;
	private String email;
	
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getUniv() {
		return univ;
	}
	public void setUniv(String univ) {
		this.univ = univ;
	}
	
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

}