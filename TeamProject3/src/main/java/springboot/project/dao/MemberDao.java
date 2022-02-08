package springboot.project.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import springboot.project.dto.MemberDto;

@Mapper
public interface MemberDao {
	
	MemberDto login(Map<String, Object> map);//로그인
	int updateMember(MemberDto dto); //회원 정보 수정

}
