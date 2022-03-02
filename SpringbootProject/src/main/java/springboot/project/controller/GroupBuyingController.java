package springboot.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import springboot.project.dto.MemberDto;
import springboot.project.service.GroupBuyingService;

@SessionAttributes("user")
@Controller
public class GroupBuyingController {
	
	@Autowired
	GroupBuyingService service;
	
	@ModelAttribute("user")
	public MemberDto getDto() {
		return new MemberDto();
	}
}
