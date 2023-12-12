package model;

import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
	
	public List<String> list() {
		List<String> products = new ArrayList<>();
		
		products.add("김치 냉장고");
		products.add("notebook");
		products.add("AI 스피커");
		
		System.out.println("list 메서드가 실행됩니다.");
		
		return products;
	}
	
	public void addCart() {
		System.out.println("addCart 메서드가 실행됩니다.");
	}
	
}