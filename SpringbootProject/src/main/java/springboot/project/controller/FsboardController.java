package springboot.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import springboot.project.dto.FsboardDto;
import springboot.project.dto.CommDto;
import springboot.project.dto.MemberDto;
import springboot.project.service.FsboardService;
import springboot.project.service.CommService;

@Controller
public class FsboardController {
	@Autowired
	FsboardService service;
	@Autowired
	CommService c_service;
	
	@ModelAttribute("user")
	public MemberDto getDto() {
		return new MemberDto();
	}
	
	@RequestMapping("/fsboard/main")
	public String main(@ModelAttribute("user") MemberDto dto) {
		return "fsboard/main";
	}
	
	@GetMapping("/fsboard/write")
	public String writeForm(@ModelAttribute("user")MemberDto dto) {
		return "fsboard/write";
	}
	
	@PostMapping("/fsboard/write")
	public String write(FsboardDto dto) {
		service.insert(dto);
		return "redirect:list";// 湲�紐⑸줉
	}
	//�슂泥� page 踰덊샇瑜� 諛쏆븘�꽌 �럹�씠吏��뿉 留욌뒗 湲��쓣 媛��닔�뿉 留욊쾶 爰쇰궡�샂
	//�쟾泥� 湲� 媛��닔�뿉 留욎떠 �럹�씠吏� 泥섎━
	@RequestMapping("/fsboard/list")
	public String list(@RequestParam(name="p", defaultValue = "1") int page, Model m ) {
		
		//湲��씠 �엳�뒗吏� 泥댄겕
		int count = service.count();
		if(count > 0) {
		
		int perPage = 10; // �븳 �럹�씠吏��뿉 蹂댁씪 湲��쓽 媛��닔
		int startRow = (page - 1) * perPage + 1;
		int endRow = page * perPage;
		
		List<FsboardDto> boardList = service.boardList(startRow, endRow);
		m.addAttribute("bList", boardList);

		int pageNum = 5;
		int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); //�쟾泥� �럹�씠吏� �닔
		
		int begin = (page - 1) / pageNum * pageNum + 1;
		int end = begin + pageNum -1;
		if(end > totalPages) {
			end = totalPages;
		}
		 m.addAttribute("begin", begin);
		 m.addAttribute("end", end);
		 m.addAttribute("pageNum", pageNum);
		 m.addAttribute("totalPages", totalPages);
		
		}
		m.addAttribute("count", count);
		return "fsboard/list";
	}
	
	@GetMapping("fsboard/content/{fsno}")
	public String content(@ModelAttribute("user")MemberDto user, @PathVariable int fsno, Model m) {
		FsboardDto dto = service.boardOne(fsno);
		m.addAttribute("dto", dto);
		List<CommDto> cList = c_service.selectComm(fsno);
		m.addAttribute("cList", cList);
		return "fsboard/content";
	}
	
	@GetMapping("/fsboard/update/{fsno}")
	public String updateForm(@PathVariable int fsno, Model m) {
		FsboardDto dto = service.boardOne(fsno);
		m.addAttribute("dto", dto);
		return "fsboard/updateForm";
	}
	
	@PostMapping("/fsboard/update")
	public String update(FsboardDto dto) {
		service.updateBoard(dto);
		return "redirect:list";
	}
	
	@DeleteMapping("/fsboard/delete")
	@ResponseBody
	public String delete(int fsno) {
		int i = service.deleteBoard(fsno); 
		return ""+i;
	}
	
	@GetMapping("/fsboard/search")
	public String search(int searchn, String search,@RequestParam(name="p", defaultValue = "1") int page, Model m) {
		int count = service.countSearch(searchn,search);
		if(count > 0) {
		
		int perPage = 10; // �븳 �럹�씠吏��뿉 蹂댁씪 湲��쓽 媛��닔
		int startRow = (page - 1) * perPage + 1;
		int endRow = page * perPage;
		
		List<FsboardDto> boardList = service.boardListSearch(searchn,search,startRow, endRow);
		m.addAttribute("bList", boardList);

		int pageNum = 5;
		int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); //�쟾泥� �럹�씠吏� �닔
		
		int begin = (page - 1) / pageNum * pageNum + 1;
		int end = begin + pageNum -1;
		if(end > totalPages) {
			end = totalPages;
		}
		 m.addAttribute("begin", begin);
		 m.addAttribute("end", end);
		 m.addAttribute("pageNum", pageNum);
		 m.addAttribute("totalPages", totalPages);
		
		}
		m.addAttribute("count", count);
		m.addAttribute("searchn", searchn);
		m.addAttribute("search", search);
		
		return "fsboard/search";
	}
	
	@GetMapping("fsboard/content/{fsno}/recommend")
	public String recommend(@ModelAttribute("user")MemberDto user, @PathVariable int fsno, Model m) {
		FsboardDto dto = service.Recommend(fsno);
		m.addAttribute("dto", dto);
		return "fsboard/content/{fsno}";
	}
	
}