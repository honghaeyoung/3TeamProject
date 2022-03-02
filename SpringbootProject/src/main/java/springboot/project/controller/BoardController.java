package springboot.project.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import springboot.project.service.CommService;
import springboot.project.dto.CommDto;
import springboot.project.dto.MemberDto;
import springboot.project.dao.CommDao;
import springboot.project.dto.BoardDto;
import springboot.project.service.BoardService;

@SessionAttributes("user")
@Controller
public class BoardController {

	@Autowired
	BoardService service;
	@Autowired
	CommService c_service;
	
	@ModelAttribute("user")
	public MemberDto getDto() {
		return new MemberDto();
	}
	
	@RequestMapping("/board/main")
	public String main(@ModelAttribute("user") MemberDto dto) {
		return "mem/main";
	}
	
	@GetMapping("/board/write")
	public String writeForm(@ModelAttribute("user")MemberDto dto) {
		return "board/write";
	}
	
	@PostMapping("/board/write")
	public String write(BoardDto dto) {
		service.insert(dto);
		return "redirect:list";// 湲�紐⑸줉
	}
	//�슂泥� page 踰덊샇瑜� 諛쏆븘�꽌 �럹�씠吏��뿉 留욌뒗 湲��쓣 媛��닔�뿉 留욊쾶 爰쇰궡�샂
	//�쟾泥� 湲� 媛��닔�뿉 留욎떠 �럹�씠吏� 泥섎━
	@RequestMapping("/board/list")
	public String list(@RequestParam(name="p", defaultValue = "1") int page, Model m ) {
		
		//湲��씠 �엳�뒗吏� 泥댄겕
		int count = service.count();
		if(count > 0) {
		
		int perPage = 10; // �븳 �럹�씠吏��뿉 蹂댁씪 湲��쓽 媛��닔
		int startRow = (page - 1) * perPage + 1;
		int endRow = page * perPage;
		
		List<BoardDto> boardList = service.boardList(startRow, endRow);
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
		return "board/list";
	}
	
	@GetMapping("board/content/{no}")
	public String content(@ModelAttribute("user")MemberDto user, @PathVariable int no, Model m) {
		BoardDto dto = service.boardOne(no);
		m.addAttribute("dto", dto);
		List<CommDto> cList = c_service.selectComm(no);
		m.addAttribute("cList", cList);
		return "board/content";
	}
	
	@GetMapping("/board/update/{no}")
	public String updateForm(@PathVariable int no, Model m) {
		BoardDto dto = service.boardOne(no);
		m.addAttribute("dto", dto);
		return "board/updateForm";
	}
	
	@PostMapping("/board/update")
	public String update(BoardDto dto) {
		service.updateBoard(dto);
		return "redirect:list";
	}
	
	@DeleteMapping("/board/delete")
	@ResponseBody
	public String delete(int no) {
		int i = service.deleteBoard(no); 
		return ""+i;
	}
	
	@GetMapping("/board/search")
	public String search(int searchn, String search,@RequestParam(name="p", defaultValue = "1") int page, Model m) {
		int count = service.countSearch(searchn,search);
		if(count > 0) {
		
		int perPage = 10; // �븳 �럹�씠吏��뿉 蹂댁씪 湲��쓽 媛��닔
		int startRow = (page - 1) * perPage + 1;
		int endRow = page * perPage;
		
		List<BoardDto> boardList = service.boardListSearch(searchn,search,startRow, endRow);
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
		
		return "board/search";
	}
	
	@GetMapping("/board/content/{no}/recommend")
	public String recommend(@RequestParam int no) {
		service.Recommend(no);
		return "board/content";
	}
	
	@RequestMapping("/board/bestBoard")
	public String bBlist(@RequestParam(name="p", defaultValue = "1") int page, Model m ) {
		
		//湲��씠 �엳�뒗吏� 泥댄겕
		int count = service.bBcount();
		if(count > 0) {
		
		int perPage = 10; // �븳 �럹�씠吏��뿉 蹂댁씪 湲��쓽 媛��닔
		int startRow = (page - 1) * perPage + 1;
		int endRow = page * perPage;
		
		List<BoardDto> bestBoard = service.bBList(startRow, endRow);
		m.addAttribute("bBList", bestBoard);

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
		return "board/bestBoard";
	}
	
	@GetMapping("/board/bBsearch")
	public String bBsearch(int searchn, String search,@RequestParam(name="p", defaultValue = "1") int page, Model m) {
		int count = service.bBcountSearch(searchn,search);
		if(count > 0) {
		
		int perPage = 10; // �븳 �럹�씠吏��뿉 蹂댁씪 湲��쓽 媛��닔
		int startRow = (page - 1) * perPage + 1;
		int endRow = page * perPage;
		
		List<BoardDto> bestBoard = service.bBListSearch(searchn,search,startRow, endRow);
		m.addAttribute("bBList", bestBoard);

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
		
		return "board/bBsearch";
	}
}








