package springboot.project.controller;


import javax.servlet.http.HttpSession;
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
	
	//ȸ������ ������� ������
	@GetMapping("/joinform")
	public String joinForm() {
		return "member/joinform";
	}
	
	//ȸ������ ������
	@GetMapping("/insertform")
	public String insertForm() {
		return "member/insertform";
	}
	
	//ȸ������ 
	@PostMapping("/insert")
	public String insertMember(MemberDto dto) {
		service.insertMember(dto);
		return "redirect:/loginform";
	}
	
	//id�ߺ�üũ
	@GetMapping("/idchk")
	@ResponseBody
	public String idChk(String memberid) {
		String chkid = service.idChk(memberid);
			
		return chkid;
			
		}
	
	
	//�α���������
	@GetMapping("/loginform")
	public String loginForm(@ModelAttribute("user") MemberDto dto) {
		if(dto.getMemberid() != null) {
			return "member/checklogin";
		}
		return "member/loginform";		
	}
	//�α���
	@PostMapping("/login")
	public String login(@ModelAttribute("command") @Valid MemberDto dto, BindingResult error, Model m) {
		String memberid = dto.getMemberid();
		String memberpw = dto.getMemberpw();
		
		MemberDto resultDto = service.login(memberid,memberpw);
		if(resultDto == null) {
			error.reject("nocode", "�α��� ����: ���̵� ��й�ȣ�� Ʋ���ϴ�");	
			return "member/loginform";
		}else {
			m.addAttribute("user", resultDto);
		}
		return "member/loginComplete";
	}
	
	//���̵� ã�� ������
	@GetMapping("/findidform")
	public String findIdForm() {
		return "member/findidform";
	}
	
	//���̵� ã��
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
	
	//��й�ȣ ã�� ������
	@GetMapping("/findpwform")
	public String findPw() {
		return "member/findpwform";
	}
	
	//��й�ȣ ã��
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
	
	@PostMapping("/updatepw")
	public String updatePw(@RequestParam(value="updateid", defaultValue="", required=false) String id, MemberDto dto) {
		dto.setMemberid(id);
		
		service.updatePw(dto);
		return "member/updatepw";
	}
	
    // ��й�ȣ �ٲٱ��� ��� ���� ������ �̵�
	@GetMapping(value="check_password_view")
	public String checkPasswordForModify(HttpSession session, Model model) {
		MemberDto loginUser = (MemberDto) session.getAttribute("loginUser");
		
		if(loginUser == null) {
			return "member/loginform";
		} else {
			return "mypage/checkformodify";
		}
	}

	
	//�α׾ƿ�
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/";
	}
	
	//����������
	@GetMapping("/mypage")
	public String myPage(@ModelAttribute("user") MemberDto dto, Model m) {
		m.addAttribute("user", dto);
		return "member/mypage";
	}
	
	//ȸ���������� ������
	@GetMapping("/updateform")
	public String updateForm(@ModelAttribute("user") MemberDto dto) {
		return "member/updateform";
	}
	
	//ȸ����������
	@PostMapping("/update")
	public String update(@ModelAttribute("user") MemberDto dto) {
		service.updateMember(dto);
		return "member/mypage";
	}
	
	


}
