package springboot.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springboot.project.dao.PetcareDao;
import springboot.project.dto.PetcareDto;

@Service
public class Petcareservice {

	@Autowired
	PetcareDao dao;
	
	//게시글 여부
	public int count() {
		return dao.count();
	}
	//게시글 리스트
	public List<PetcareDto> PetList(int start, int end){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("end", end);
		
		return dao.PetList(m);
	}
	//게시글 상세보기
	public PetcareDto petlistone(int no) {
		return dao.petlistone(no);
	}
	//검색창 검색리스트 
	public List<PetcareDto> petsearch(int searchn, String search,int start, int end){
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("end", end);
		
		return dao.petsearch(m);
	}
	//검색결과 갯수
	public int countSearch(int searchn, String search) {
		System.out.println(searchn+search);
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		return dao.countSearch(m);
	}
	//글적기
	public int insert(PetcareDto dto) {
		return dao.pinsert(dto);
	}
	
	//글수정
	public int updatepboard(PetcareDto dto) {
		return dao.updatepboard(dto);
	}
	//글삭제
	public int deletepboard(int pno) {
		return dao.deletepboard(pno);
	}
}
