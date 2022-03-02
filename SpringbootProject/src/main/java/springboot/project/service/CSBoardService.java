package springboot.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springboot.project.dao.CSBoardDao;
import springboot.project.dto.CSBoardDto;
import springboot.project.dto.CSCommDto;

@Service
public class CSBoardService {
	
	@Autowired
	CSBoardDao dao;
	
	public int insert(CSBoardDto dto) {
		return dao.insert(dto);
	}
	
	public List<CSBoardDto> boardList(int start, int end) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("end", end);
		return dao.boardList(m);
	}
	
	public int count() {
		return dao.count();
	}
	
	public CSBoardDto CSBoardOne(int csno) {
		return dao.CSBoardOne(csno);
	}
	
	public int updateCSBoard(CSBoardDto dto) {
		return dao.updateCSBoard(dto);
	}
	
	public int deleteCSBoard(int csno) {
		return dao.deleteCSBoard(csno);
	}
	
	public List<CSBoardDto> boardListSearch(int searchn, String search,int start, int end){
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("end", end);
		
		return dao.boardListSearch(m);
	}
	public int countSearch(int searchn, String search) {
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		return dao.countSearch(m);
	}
	
	public List<CSCommDto> showComm(int csno){
		return dao.showComm(csno);
	}
	
	public int insertComm(CSCommDto cdto) {
		return dao.insertComm(cdto);
	}
	
	public int deleteComm(int cscno) {
		return dao.deleteComm(cscno);
	}
	
	public int countComm(int csno) {
		return dao.countComm(csno);
	}
	public CSCommDto commentOne(int cscno) {
		return dao.commentOne(cscno);
	}
	public int updateComm(int cscno, String csccontent) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("cscno", cscno);
		m.put("csccontent", csccontent);
		return dao.updateComm(m);
	}
	
}
