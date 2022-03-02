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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import springboot.project.dto.CSBoardDto;
import springboot.project.dto.CSCommDto;
import springboot.project.dto.MemberDto;
import springboot.project.service.CSBoardService;

@Controller
@SessionAttributes("user")
public class CSBoardController {

	@Autowired
	CSBoardService service;
	
	@ModelAttribute("user")
	public MemberDto getDto() {
		return new MemberDto();
	}
	
	@GetMapping("CSBoard/write")
	public String writeform(@ModelAttribute("user")MemberDto dto) {
		return "CSBoard/write";
	}
	@PostMapping("CSBoard/write")
	public String write(CSBoardDto dto) {
		service.insert(dto);
		return "redirect:list";
	}
	
	//요청 page 번호를 받아서 페이지에 맞는 글을 갯수에 맞게 꺼내옴
	//전체 글 갯수에 맞춰 페이징 처리
	@RequestMapping("CSBoard/list")
	public String list(@ModelAttribute("user") MemberDto dto, @RequestParam(name="p",defaultValue ="1") int page, Model m) {
		
		//회원 전용
		/*if(dto.getMemberid() == null) {
			return "redirect:/loginform";
		}*/
		
		//글이 있는지 체크
		int count = service.count();
		if(count > 0) {
			int perPage = 10; //한 페이지에 보일 글의 갯수
			int startRow = (page-1) * perPage +1;
			int endRow = page * perPage;
			List<CSBoardDto> boardList = service.boardList(startRow, endRow);
			m.addAttribute("bList", boardList);

			int pageNum = 10; // 5개씩 보여주겠다 true면 1,false면 0
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // 전체 페이지 갯수
			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum - 1;
			if (end > totalPages) {
				end = totalPages;
			}
			m.addAttribute("begin", begin);
			m.addAttribute("end", end);
			m.addAttribute("pageNum", pageNum);
			m.addAttribute("totalPages", totalPages);
			
		}
		m.addAttribute("count", count);
		
		return "CSBoard/list";
	}
	
	@GetMapping("CSBoard/content/{csno}")
	public String content(@ModelAttribute("user")MemberDto user, @PathVariable int csno, Model m) {
		CSBoardDto dto = service.CSBoardOne(csno);
		List<CSCommDto> cList = service.showComm(csno);
		int countComm = service.countComm(csno);
		m.addAttribute("dto", dto);
		m.addAttribute("cList", cList);
		m.addAttribute("count",countComm);
		return "CSBoard/content"; 
	}
	@GetMapping("CSBoard/update/{csno}")
	public String updateform(@PathVariable int csno, Model m) {
		CSBoardDto dto = service.CSBoardOne(csno);
		m.addAttribute("dto", dto);
		return "CSBoard/updateform";
	}
//	@PutMapping("/CSBoard/update") 405오류나서 변경함.
	@RequestMapping(value="/CSBoard/update",method= {RequestMethod.POST})
	public String update(CSBoardDto dto) {
		service.updateCSBoard(dto);
		return "redirect:list";
	}
	
	@DeleteMapping("CSBoard/delete")
	@ResponseBody
	public String delete(int csno) {
		int i = service.deleteCSBoard(csno);
		return ""+i;
	}
	
	@GetMapping("CSBoard/search")
	public String search(int searchn, String search,@RequestParam(name="p", defaultValue = "1") int page, Model m) {
		int count = service.countSearch(searchn,search);
		if(count > 0) {
		
		int perPage = 10; // 한 페이지에 보일 글의 갯수
		int startRow = (page - 1) * perPage + 1;
		int endRow = page * perPage;
		
		List<CSBoardDto> boardList = service.boardListSearch(searchn,search,startRow, endRow);
		m.addAttribute("bList", boardList);

		int pageNum = 5;
		int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); //전체 페이지 수
		
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
		
		return "CSBoard/search";
	}
	@GetMapping("/CSComm/insert")
	@ResponseBody
	public String insertComm(CSCommDto cdto) {
		int i = service.insertComm(cdto);
		return i+"";
	}
	
	@GetMapping("/CSComm/delete/{cscno}")
	@ResponseBody
	public String deleteComm(@PathVariable int cscno) {
		int i = service.deleteComm(cscno);
		return i+"";
	}  
	
	@PostMapping("/CSComm/commentOne")
	@ResponseBody
	public String commentOne(int cscno) {
		CSCommDto cdto = service.commentOne(cscno);
		String csccontent = cdto.getCsccontent();
		return csccontent;
	}
	
	@PostMapping("/CSComm/update")
	@ResponseBody
		public String updateComm(int cscno, String csccontent) {
		int i = service.updateComm(cscno,csccontent);
		return i+"";
	}
	
}
