package el;

import java.io.Serializable;

public class Member implements Serializable{

	private static final long serialVersionUID = 1L;

	private String uid;
	private String upwd;
	private String uname;
	
	//getter, setter
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
	
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}

}
