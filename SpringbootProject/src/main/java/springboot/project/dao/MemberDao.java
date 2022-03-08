package springboot.project.dao;


import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import springboot.project.dto.MemberDto;
import springboot.project.dto.MypageCommDto;
import springboot.project.dto.MypageDto;


@Mapper
public interface MemberDao {
		int insertMember(MemberDto dto); //ȸ������
		String idChk(String memberid);//id�ߺ�üũ
		MemberDto login(Map<String, Object> map);//�α���
		MemberDto findId(MemberDto dto);//���̵�ã��
		MemberDto findPw(MemberDto dto);//��й�ȣã��
		void updatePw(MemberDto dto);//��й�ȣ ����
		int updateMember(MemberDto dto); //ȸ�� ���� ����
		int deleteMember(Map<String, Object> map);//ȸ�� Ż��
		
		ArrayList<MypageDto> myBoard(String memberid);
		ArrayList<MypageCommDto> myComm(String memberid);
		
		
}
