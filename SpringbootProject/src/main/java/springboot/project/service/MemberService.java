package springboot.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import springboot.project.dao.BoardDao;
import springboot.project.dao.FsboardDao;
import springboot.project.dao.MemberDao;
import springboot.project.dao.PetcareDao;
import springboot.project.dao.RoomDao;
import springboot.project.dto.EmailVO;
import springboot.project.dto.MemberDto;
import springboot.project.dto.RoomDto;

@Service
public class MemberService {
	@Autowired
	MemberDao dao;
	
	@Autowired
	protected JavaMailSender mailSender;
	
	public int insertMember(MemberDto dto) {
		return dao.insertMember(dto);
	}
	
	public String idChk(String memberid) {
		return dao.idChk(memberid);
	}
	
	public boolean sendMail(EmailVO email) throws Exception {

		try {

			MimeMessage msg = mailSender.createMimeMessage();

			msg.setSubject(email.getSubject());

			
			msg.setText(email.getContent());

			
			msg.setRecipient(RecipientType.TO, new InternetAddress(email.getReceiver()));
			

			mailSender.send(msg);

			return true;

		} catch (Exception ex) {

			ex.printStackTrace();

		}

		return false;

	}
	
	public MemberDto login(String memberid,String memberpw) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("memberid", memberid);
		map.put("memberpw", memberpw);
		return dao.login(map);
	}
	
	public MemberDto findId(MemberDto dto) {
		return dao.findId(dto);
	}
	
	public MemberDto findPw(MemberDto dto) {
		return dao.findPw(dto);
	}
	
	public void updatePw(MemberDto dto) {
		dao.updatePw(dto);
	}
	
	public int updateMember(MemberDto dto) {
		return dao.updateMember(dto);
	}
	
	public int deleteMember(String memberpw, MemberDto dto) {
		String pw = dto.getMemberpw();
		String memberid = dto.getMemberid();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberid",memberid);
		map.put("memberpw",pw);
		return dao.deleteMember(map);
	}
	
	public List<BoardDao> cBoard(String memberid){
		return dao.cBoard(memberid);
	}
	public List<FsboardDao> fBoard(String memberid){
		return dao.fBoard(memberid);
	}
	public List<PetcareDao> pBoard(String memberid){
		return dao.pBoard(memberid);
	}
	public List<RoomDao> rBoard(String memberid){
		return dao.rBoard(memberid);
	}

}
