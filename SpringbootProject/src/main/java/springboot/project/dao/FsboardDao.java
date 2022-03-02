package springboot.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import springboot.project.dto.FsboardDto;

@Mapper
public interface FsboardDao {
	int insert(FsboardDto dto);
	List<FsboardDto> boardList(Map<String, Object> m);
	int count();//�쟾泥� 湲� 媛��닔
	FsboardDto boardOne(int fsno);
	int updateBoard(FsboardDto dto);
	int deleteBoard(int fsno);
	List<FsboardDto> boardListSearch(Map<String, Object> m);
	int countSearch(Map<String, Object> m);//�쟾泥� 湲� 媛��닔
	int addReadcount(int fsno);
	int addRecommend(int fsno);
}
