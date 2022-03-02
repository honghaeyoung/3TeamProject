package springboot.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springboot.project.dao.FsboardDao;
import springboot.project.dto.FsboardDto;

@Service
public class FsboardService {
	
	@Autowired
	FsboardDao dao;
	
	public int count() {
		return dao.count();
	}
	
	public List<FsboardDto> boardList(int start, int end){
		
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("end", end);
		
		return dao.boardList(m);
	}
	
	public int insert(FsboardDto dto) {
		return dao.insert(dto);
	}
	public FsboardDto boardOne(int fsno) {
		dao.addReadcount(fsno);
		return dao.boardOne(fsno);
	}
	public int updateBoard(FsboardDto dto) {
		return dao.updateBoard(dto);
	}
	public int deleteBoard(int fsno) {
		return dao.deleteBoard(fsno);
	}
	
	public List<FsboardDto> boardListSearch(int searchn, String search,int start, int end){
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("end", end);
		
		return dao.boardListSearch(m);
	}
	public int countSearch(int searchn, String search) {
		System.out.println(searchn+search);
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		return dao.countSearch(m);
	}
	
	public FsboardDto Recommend(int fsno) {
		dao.addRecommend(fsno);
		return dao.boardOne(fsno);
	}
}