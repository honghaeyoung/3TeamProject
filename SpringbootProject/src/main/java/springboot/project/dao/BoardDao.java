package springboot.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import springboot.project.dto.BoardDto;

@Mapper
public interface BoardDao {
	int insert(BoardDto dto);
	List<BoardDto> boardList(Map<String, Object> m);
	int count();//�쟾泥� 湲� 媛��닔
	BoardDto boardOne(int no);
	int updateBoard(BoardDto dto);
	int deleteBoard(int no);
	List<BoardDto> boardListSearch(Map<String, Object> m);
	int countSearch(Map<String, Object> m);//�쟾泥� 湲� 媛��닔
	int addReadcount(int no);
	int addRecommend(int no);
	List<BoardDto> bBList(Map<String, Object> m);
	int bBcount();
	List<BoardDto> bBListSearch(Map<String, Object> m);
	int bBcountSearch(Map<String, Object> m);
}
