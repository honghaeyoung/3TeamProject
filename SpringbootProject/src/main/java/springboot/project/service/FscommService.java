package springboot.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springboot.project.dao.FscommDao;
import springboot.project.dto.FscommDto;

@Service
public class FscommService {
	@Autowired
	FscommDao dao;
	
	public List<FscommDto> selectComm(int fsno){
		return dao.selectComm(fsno);
	}
	public int insertComm(FscommDto dto) {
		return dao.insertComm(dto);
	}
	public int deleteComm(int fscno) {
		return dao.deleteComm(fscno);
	}
	public int updateComm(int fscno, String fsccontent) {
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("cno",fscno);
		m.put("ccontent", fsccontent);
		return dao.updateComm(m);
	}
}