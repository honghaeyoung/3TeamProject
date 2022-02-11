package springboot.project.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import springboot.project.dto.MemberDto;

@Mapper
public interface MemberDao {
	
	int insertMember(MemberDto dto); //회원가입
	String idChk(String memberid);//id중복체크
	MemberDto login(Map<String, Object> map);//로그인
	MemberDto findId(MemberDto dto);//아이디찾기
	MemberDto findPw(MemberDto dto);//비밀번호찾기
	void updatePw(MemberDto dto);//비밀번호 변경
	int updateMember(MemberDto dto); //회원 정보 수정

}
