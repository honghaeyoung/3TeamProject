package springboot.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import springboot.project.dto.PetcareDto;


@Mapper
public interface PetcareDao {
	int count();
	List<PetcareDto>PetList(Map<String, Object> m);
	PetcareDto petlistone(int no);
	List<PetcareDto> petsearch(Map<String, Object>m);
	int countSearch(Map<String, Object> m);
	int pinsert(PetcareDto dto);
	int updatepboard(PetcareDto dto);
	int deletepboard(int pno);
	

}
