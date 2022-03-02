package springboot.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springboot.project.dao.FoodboardDao;
import springboot.project.dto.FoodboardDto;

@Service
public class Foodboardservice {

	@Autowired
	FoodboardDao dao;
	
	//음식점 리스트 
	public List<FoodboardDto> FoodList(int start, int end){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("end", end);
		
		return dao.FoodList(m);
		
	}
	//게시물 있는지 여부
	public int count() {
		return dao.count();
	}
	//상세보기
	public FoodboardDto foodlistone(int no) {
		return dao.foodlistone(no);
	}
	
	//검색창
	public List<FoodboardDto> foodstoresearch(int searchn, String search,int start, int end){
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("end", end);
		
		return dao.foodstoresearch(m);
	}
	
	//검색글 개수
	public int countSearch(int searchn, String search) {
		System.out.println(searchn+search);
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		return dao.countSearch(m);
	}
}
