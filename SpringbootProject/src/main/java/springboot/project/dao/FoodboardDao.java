package springboot.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import springboot.project.dto.FoodboardDto;

@Mapper
public interface FoodboardDao {
	
	List<FoodboardDto> FoodList(Map<String, Object> m);
	int count();
	FoodboardDto foodlistone(int no);
	List<FoodboardDto> foodstoresearch(Map<String, Object>m);
	int countSearch(Map<String, Object> m);
}
