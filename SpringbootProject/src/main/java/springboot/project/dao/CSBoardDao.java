package springboot.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import springboot.project.dto.CSBoardDto;
import springboot.project.dto.CSCommDto;
@Mapper
public interface CSBoardDao {
	
	int insert(CSBoardDto dto);
	List<CSBoardDto> boardList(Map<String, Object> m);
	int count();
	CSBoardDto CSBoardOne(int csno);
	int updateCSBoard(CSBoardDto dto);
	int deleteCSBoard(int csno);
	List<CSBoardDto> boardListSearch(Map<String, Object> m);
	int countSearch(Map<String, Object> m);
	public List<CSCommDto> showComm(int csno);
	public int insertComm(CSCommDto cdto);
	public int deleteComm(int cscno);
	public int countComm(int csno);
	public CSCommDto commentOne(int cscno);
	public int updateComm(Map<String, Object> m);
}
