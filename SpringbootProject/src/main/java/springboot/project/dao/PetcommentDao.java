package springboot.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import springboot.project.dto.PetcommentDto;

@Mapper
public interface PetcommentDao {
	int pcommentInsert(PetcommentDto pcommdto);
	List<PetcommentDto>pviewcomment(int no);
	int updatepcomm(Map<String, Object> m);
	PetcommentDto pcone(int pcno);
	int pcdelete(int pcno);
	

}
