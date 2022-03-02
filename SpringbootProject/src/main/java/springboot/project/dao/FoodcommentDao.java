package springboot.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import springboot.project.dto.FoodcommentDto;

@Mapper
public interface FoodcommentDao {
	
	int fcommentInsert(FoodcommentDto fcommdto);
	List<FoodcommentDto>fviewcomment(int no);
	int fcdelete(int fcno);
	int avgscore(int storeid);
	int updatefcomm(Map<String, Object> m);
	FoodcommentDto fcommone(int fcno);
}
