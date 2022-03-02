package springboot.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springboot.project.dao.PetcommentDao;
import springboot.project.dto.PetcommentDto;

@Service
public class PetcommentService {

	@Autowired
	PetcommentDao dao;
	
	public int pcommentInsert(PetcommentDto pcommdto) {
		return dao.pcommentInsert(pcommdto);
	}
	public List<PetcommentDto>pviewcomment(int no){
		return dao.pviewcomment(no);
	}
	
	public int updatepcomm(int pcno, String pccontent) {
		Map<String, Object> m = new HashMap<>();
		m.put("pcno", pcno);
		m.put("pccontent", pccontent);
		return dao.updatepcomm(m);
	}
	public PetcommentDto pcone(int pcno) {
		return dao.pcone(pcno);
	}
	
	public int pcdelete(int pcno) {
		return dao.pcdelete(pcno);
	}
}
