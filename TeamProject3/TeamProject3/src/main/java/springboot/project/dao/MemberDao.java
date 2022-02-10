package springboot.project.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import springboot.project.dto.MemberDto;

@Mapper
public interface MemberDao {
	
	int insertMember(MemberDto dto); //ȸ������
	String idChk(String memberid);//id�ߺ�üũ
	MemberDto login(Map<String, Object> map);//�α���
	String findId(String name, String email);//���̵�ã��
	int updateMember(MemberDto dto); //ȸ�� ���� ����

}
