package springboot.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import springboot.project.dto.FscommDto;

@Mapper
public interface FscommDao {
	List<FscommDto> selectComm(int fsno);
	int insertComm(FscommDto dto);
	int deleteComm(int fscno);
	int updateComm(Map<String, Object> m);
}
