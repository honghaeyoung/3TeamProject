package springboot.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springboot.project.dao.CommDao;
import springboot.project.dto.CommDto;

@Service
public class CommService {
	@Autowired
	CommDao dao;
	
	public List<CommDto> selectComm(int no){
		return dao.selectComm(no);
	}
	public int insertComm(CommDto dto) {
		return dao.insertComm(dto);
	}
	public int deleteComm(int cno) {
		return dao.deleteComm(cno);
	}
	public int updateComm(CommDto dto) {
		return dao.updateComm(dto);
	}
}
