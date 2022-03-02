package springboot.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import springboot.project.dao.AdminDao;
import springboot.project.dto.AdminDto;

@Service
public class AdminService {
	@Autowired 
	AdminDao dao;
	
	public int count() {
		return dao.count();
	}
	
	public List <AdminDto> memberAll(int start, int end) {
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("start", start);
		m.put("end", end);
		return dao.memberAll(m);
	}
	//회원검색
	public List <AdminDto> membersearch (int msearchn,String msearch, int start, int end){
		Map<String, Object>m = new HashMap<String, Object>();
		m.put("msearchn",msearchn);
		m.put("msearch", msearch);
		m.put("start", start);
		m.put("end", end);
		return dao.membersearch(m);	
		}

	public int countSearch (int msearchn, String msearch) {
		Map<String, Object>m = new HashMap<String, Object>();
		m.put("msearchn",msearchn);
		m.put("msearch", msearch);
		return dao.countSearch(m);
	}
	public int updatemember (AdminDto dto) {
		return dao.updatemember(dto);
	}
	public AdminDto updatemem (String id) {
		return dao.updatemem(id);
	}
	public int deletemember (String id) {
		return dao.deletemember(id);
	}
	//그래프
	
	
	/*
	 * public String selectgender() { dao.selectgender(); }
	 */
	 
	
}
