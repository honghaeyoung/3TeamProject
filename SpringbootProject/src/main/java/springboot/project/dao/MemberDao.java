package springboot.project.dao;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import springboot.project.dto.BoardDto;
import springboot.project.dto.CommDto;
import springboot.project.dto.FoodboardDto;
import springboot.project.dto.FscommDto;
import springboot.project.dto.MemberDto;
import springboot.project.dto.MypageCommDto;
import springboot.project.dto.MypageDto;
import springboot.project.dto.PetcareDto;
import springboot.project.dto.PetcommentDto;
import springboot.project.dto.RoomCommentDto;
import springboot.project.dto.RoomDto;


@Mapper
public interface MemberDao {
		int insertMember(MemberDto dto); //회원가입
		String idChk(String memberid);//id중복체크
		MemberDto login(Map<String, Object> map);//로그인
		MemberDto findId(MemberDto dto);//아이디찾기
		MemberDto findPw(MemberDto dto);//비밀번호찾기
		void updatePw(MemberDto dto);//비밀번호 변경
		int updateMember(MemberDto dto); //회원 정보 수정
		int deleteMember(Map<String, Object> map);//회원 탈퇴
		
		ArrayList<MypageDto> myBoard(String memberid);
		ArrayList<MypageCommDto> myComm(String memberid);
		
		List<RoomDto> myRoomList(Map<String, Object> map);
		List<BoardDto> myBoardList(Map<String, Object> map);
		List<FoodboardDto> myFsboardList(Map<String, Object> map);
		List<PetcareDto> myPetList(Map<String, Object> map);
		
		List<RoomCommentDto> myRoomComm(String memberid);
		List<CommDto> myBoardComm(String memberid);
		List<FscommDto> myFsComm(String memberid);
		List<PetcommentDto> myPetComm(String memberid);
		
}
