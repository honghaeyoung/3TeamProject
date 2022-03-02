package springboot.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import springboot.project.dto.AdminDto;

@Mapper
public interface AdminDao {
	int count();

	List<AdminDto> memberAll(Map<String, Object> m);

	List<AdminDto> membersearch(Map<String, Object> m);

	int countSearch(Map<String, Object> m);

	int updatemember(AdminDto dto);

	AdminDto updatemem(String id);

	int deletemember(String memberid);

	// ±×·¡ÇÁ
	
	  String selectgender ();
	 
}
