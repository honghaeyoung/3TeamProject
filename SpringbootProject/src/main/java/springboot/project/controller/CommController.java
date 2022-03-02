package springboot.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import springboot.project.dto.CommDto;
import springboot.project.service.CommService;

@Controller
public class CommController {
	@Autowired
	CommService service;
	
	@GetMapping("/comm/insert")
	@ResponseBody
	public String insertComm(CommDto dto) {
		int i = service.insertComm(dto);
		return i+"";
	}

	@GetMapping("/comm/delete/{cno}")
	@ResponseBody
	public String deleteComm(@PathVariable int cno) {
		int i = service.deleteComm(cno);
		return i+"";
	}
	
	//´ñ±Û ¼öÁ¤ POST
	@PostMapping("/comm/update")
	@ResponseBody
	public int updateComm(@RequestParam int cno, @RequestParam String ccontent) {
		CommDto dto = new CommDto();
		dto.setCno(cno);
		dto.setCcontent(ccontent);
	
		return service.updateComm(dto);
	}
}

