package springboot.project.controller;



import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import springboot.project.dao.BoardDao;
import springboot.project.dao.FsboardDao;
import springboot.project.dao.PetcareDao;
import springboot.project.dao.RoomDao;
import springboot.project.dto.MemberDto;
import springboot.project.dto.RoomDto;
import springboot.project.service.MemberService;
import springboot.project.service.RoomService;

@Controller
@SessionAttributes("user")
public class MainController {
	@Autowired
	MemberService service;
	@Autowired
	RoomService rs;
	
	@ModelAttribute("user")
	public MemberDto getMemberDto() {
		return new MemberDto();
	}
	
	//메인페이지 
	@GetMapping("/")
	public String main(@ModelAttribute("user") MemberDto dto, Model m) {
		m.addAttribute("roomlist", rs.mainRomm());
		
		return "index";
	}
	
	//회원가입 약관동의 페이지
	@GetMapping("/joinform")
	public String joinForm() {
		return "member/joinform";
	}
	
	//회원가입 페이지
	@GetMapping("/insertform")
	public String insertForm() {
		return "member/insertform";
	}
	
	//회원가입 
	@PostMapping("/insert")
	public String insertMember(MemberDto dto) {
		service.insertMember(dto);
		return "redirect:/loginform";
	}
	
	//id중복체크
	@GetMapping("/idchk")
	@ResponseBody
	public String idChk(String memberid) {
		String chkid = service.idChk(memberid);
			
		return chkid;
			
		}
	
	
	//로그인페이지
	@GetMapping("/loginform")
	public String loginForm(@ModelAttribute("user") MemberDto dto) {
		if(dto.getMemberid() != null) {
			return "index";
		}
		return "member/loginform";		
	}
	//로그인
	@PostMapping("/login")
	public String login(@ModelAttribute("user") @Valid MemberDto dto, BindingResult error, Model m) {
		String memberid = dto.getMemberid();
		String memberpw = dto.getMemberpw();
		
		MemberDto resultDto = service.login(memberid,memberpw);
		if(resultDto == null) {
			error.reject("nocode", "로그인 실패: 아이디나 비밀번호가 틀립니다");	
			return "member/loginform";
		}else {
			m.addAttribute("user", resultDto);
		}
		return "index";
		//return "member/loginComplete";
	}
	
	//아이디 찾기 페이지
	@GetMapping("/findidform")
	public String findIdForm() {
		return "member/findidform";
	}
	
	//아이디 찾기
	@PostMapping("/findid")
	public String findId(MemberDto dto, Model model) {
		MemberDto user = service.findId(dto);
		
		if(user == null) {
			model.addAttribute("check", 1);
		}else {
			model.addAttribute("check", 0);
			model.addAttribute("memberid", user.getMemberid());
		}
		return "member/findidform";
	}
	
	//비밀번호 찾기 페이지
	@GetMapping("/findpwform")
	public String findPw() {
		return "member/findpwform";
	}
	
	//비밀번호 찾기
	@PostMapping("/findpw")
	public String findPw(MemberDto dto, Model model) {
		MemberDto user = service.findPw(dto);
		
		if(user == null) {
			model.addAttribute("check", 1);
		}else {
			model.addAttribute("check", 0);
			model.addAttribute("updateid", user.getMemberid());
		}
		return "member/findpwform";
	}
	//비밀번호 변경 성공시 성공페이지로 이동
	@PostMapping("/updatepw")
	public String updatePw(@RequestParam(value="updateid", defaultValue="", required=false) String id, MemberDto dto) {
		dto.setMemberid(id);
		
		service.updatePw(dto);
		return "member/updatepw";
	}
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/";
	}
	
	//마이페이지
	@GetMapping("/mypage")
	public String myPage(@ModelAttribute("user") MemberDto dto, Model m,String memberid) {
		m.addAttribute("user", dto);
		List<BoardDao> cboard = service.cBoard(dto.getMemberid());
		List<FsboardDao> fboard = service.fBoard(dto.getMemberid());
		List<PetcareDao> pboard = service.pBoard(dto.getMemberid());
		List<RoomDao> rboard = service.rBoard(dto.getMemberid());
		if(dto.getMemberid().equals(memberid)) {
			m.addAttribute("clist", cboard);
			m.addAttribute("flist", fboard);
			m.addAttribute("plist", pboard);
			m.addAttribute("rlist", rboard);
		}
		return "member/mypage";
	}
	
	//회원정보변경 페이지
	@GetMapping("/updateform")
	public String updateForm(@ModelAttribute("user") MemberDto dto) {
		return "member/updateform";
	}
	
	//회원정보수정
	@PostMapping("/update")
	public String update(@ModelAttribute("user") MemberDto dto) {
		service.updateMember(dto);
		return "member/mypage";
	}
	
	//회원탈퇴 성공
	@GetMapping("/deletecomplate")
	public String deleteComplate() {
		return "member/deletecomplate";
	}
	
	//회원 탈퇴 페이지
	@GetMapping("deleteform")
	public String deleteForm(@ModelAttribute("user") MemberDto dto) {
		return "member/deleteform";
	}
	
	//회원탈퇴
	@PostMapping("/deletemember")
	public String deleteMember(String memberpw, @ModelAttribute("user") @Valid MemberDto dto, BindingResult error, SessionStatus status) {
		int i = service.deleteMember(memberpw, dto);
		if(i == 0) {
			error.reject("nocode","비밀번호가 틀립니다.");
			return "member/deleteform";
		}else {
			status.setComplete();
		return "member/deletecomplate";
		}
	}
	
	
	


}
