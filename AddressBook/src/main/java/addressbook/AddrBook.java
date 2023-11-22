package addressbook;

import java.io.Serializable;

// 주소록 데이터 자료형 빈즈 클래스
public class AddrBook implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String username;
	private String tel;
	private String email;
	private String gender;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
}
