package bean;

import java.io.Serializable;

public class MemberBean implements Serializable{

	// 1. Serializable 인터페이스를 구현
	private static final long serialVersionUID = 1L;
	
	// 2. 기본 생성자로 사용(인수가 없는)
	
	// 3. 모든 멤버는 private 접근 제어자 사용
	private int id = 2023101;
	private String name = "임예은";
	
	// 4. getter/setter 메서드를 사용
	public void setId(int id) {
		this.id = id;
	}
	
	public int getId() {
		return id;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getName() {
		return name;
	}
	
}