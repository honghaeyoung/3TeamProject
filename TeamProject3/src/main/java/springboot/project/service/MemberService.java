package springboot.project.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springboot.project.dao.MemberDao;
import springboot.project.dto.MemberDto;

@Service
public class MemberService {
	@Autowired
	MemberDao dao;
	
	public MemberDto login(String memberid,String memberpw) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("memberid", memberid);
		map.put("memberpw", memberpw);
		return dao.login(map);
	}

}
