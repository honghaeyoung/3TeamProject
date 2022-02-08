package springboot.project.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import springboot.project.dto.MemberDto;
import springboot.project.service.MemberService;

@Controller
@SessionAttributes("user")
public class MainController {
	@Autowired
	MemberService service;
	
	@ModelAttribute("user")
	public MemberDto getMemberDto() {
		return new MemberDto();
	}
	
	//로그인페이지
	@GetMapping("/loginform")
	public String loginForm(@ModelAttribute("user") MemberDto dto) {
		if(dto.getMemberid() != null) {
			return "member/checklogin";
		}
		return "member/loginform";		
	}
	//로그인
	@PostMapping("/login")
	public String login(@ModelAttribute("command") @Valid MemberDto dto, BindingResult error, Model m) {
		String memberid = dto.getMemberid();
		String memberpw = dto.getMemberpw();
		
		MemberDto resultDto = service.login(memberid,memberpw);
		if(resultDto == null) {
			error.reject("nocode", "로그인 실패: 아이디나 비밀번호가 틀립니다");	
			return "member/loginform";
		}else {
			m.addAttribute("user", resultDto);
		}
		return "member/loginComplete";
	}
	
	@GetMapping("/mypage")
	public String myPage(@ModelAttribute("user") MemberDto dto, Model m) {
		m.addAttribute("user", dto);
		return "member/mypage";
	}
	
	@GetMapping("/updateform")
	public String updateForm(@ModelAttribute("user") MemberDto dto) {
		return "member/updateform";
	}
	@PostMapping("/update")
	public String update(@ModelAttribute("user") MemberDto dto) {
		service.updateMember(dto);
		return "member/mypage";
	}
	
	@GetMapping("/roomshare")
	public String roomshare() {
		return "room/roomshare";
	}


}
