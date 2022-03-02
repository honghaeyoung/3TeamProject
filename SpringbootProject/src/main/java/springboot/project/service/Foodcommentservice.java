package springboot.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springboot.project.dao.FoodcommentDao;
import springboot.project.dto.FoodcommentDto;
@Service
public class Foodcommentservice {
	@Autowired
	FoodcommentDao dao;
	
	public int fcommentInsert(FoodcommentDto fcommdto) {
		return dao.fcommentInsert(fcommdto);
	}
	public List<FoodcommentDto>fviewcomment(int no){
		return dao.fviewcomment(no);
	}
	public int fcdelete(int fcno) {
		return dao.fcdelete(fcno);
	}
	public int avgscore(int storeid) {
		return dao.avgscore(storeid);
	}
	public int updatefcomm(int fcno, String fccontent, int fcscore ) {
		Map<String, Object> m = new HashMap<>();
		m.put("fcno", fcno);
		m.put("fccontent", fccontent);
		m.put("fcscore", fcscore);
		return dao.updatefcomm(m);
	}
	public FoodcommentDto fcommone(int fcno) {
		return dao.fcommone(fcno);
	}
}
