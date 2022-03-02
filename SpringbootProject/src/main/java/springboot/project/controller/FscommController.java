package springboot.project.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import springboot.project.dto.FscommDto;
import springboot.project.service.FscommService;

@Controller
public class FscommController {
	@Autowired
	FscommService service;
	
	@GetMapping("/fscomm/insert")
	@ResponseBody
	public String insertComm(FscommDto dto) {
		int i = service.insertComm(dto);
		return i+"";
	}
	
	@GetMapping("/fscomm/delete/{fscno}")
	@ResponseBody
	public String deleteComm(@PathVariable int fscno) {
		int i = service.deleteComm(fscno);
		return i+"";
	}
	
	@PostMapping("/fscomm/update/{fscno}/{fsccontent}")
	@ResponseBody
	public Map<String,Object> updateComm(@PathVariable int fscno, @PathVariable String fsccontent) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			FscommDto dto = new FscommDto();
			dto.setFscno(fscno);
			dto.setFsccontent(fsccontent);
			service.updateComm(fscno, fsccontent);
			
			map.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}
		return map;
	}
}

