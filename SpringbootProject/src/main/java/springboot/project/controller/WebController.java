package springboot.project.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.validation.Valid;

import org.apache.tomcat.util.http.fileupload.UploadContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import oracle.jdbc.proxy.annotation.Post;
import springboot.project.dto.FoodboardDto;
import springboot.project.dto.FoodcommentDto;
import springboot.project.dto.MemberDto;
import springboot.project.dto.PetcareDto;
import springboot.project.dto.PetcommentDto;
import springboot.project.service.Foodboardservice;
import springboot.project.service.Foodcommentservice;
import springboot.project.service.MemberService;
import springboot.project.service.Petcareservice;
import springboot.project.service.PetcommentService;

@SessionAttributes("user")
@Controller
public class WebController {

	@Autowired
	Foodboardservice f_service;
	@Autowired
	Petcareservice p_service;
	@Autowired
	MemberService m_service;
	@Autowired
	PetcommentService pc_service;
	@Autowired
	Foodcommentservice fc_service;

	@ModelAttribute("user")
	public MemberDto getDto() {
		return new MemberDto();
	}


	// �쓬�떇�젏 紐⑸줉
	@RequestMapping("/foodstore")
	public String foodlist(@RequestParam(name = "p", defaultValue = "1") int page, Model m) {

		// 湲��씠 �엳�뒗吏� 泥댄겕
		int count = f_service.count();
		if (count > 0) { // 寃뚯떆臾쇱씠 �엳�떎硫�

			int perPage = 10; // �븳 �럹�씠吏��뿉 蹂댁씪 湲��쓽 媛��닔
			int startRow = (page - 1) * perPage + 1; // �떆�옉以�.
			int endRow = page * perPage; // �걹 以�.
			List<FoodboardDto> F_list = f_service.FoodList(startRow, endRow);// �떆�옉遺��꽣 �걹源뚯��쓽 list.
			m.addAttribute("F_list", F_list);
			int pageNum = 5;
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // �쟾泥� �럹�씠吏� �닔

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
		return "foodstore";
	}

	// �렖耳��뼱 紐⑸줉
	@RequestMapping("/petcare")
	public String Petlist(@RequestParam(name = "p", defaultValue = "1") int page, Model m) {

		// 湲��씠 �엳�뒗吏� 泥댄겕
		int count = p_service.count();
		if (count > 0) { // 寃뚯떆臾쇱씠 �엳�떎硫�

			int perPage = 10; // �븳 �럹�씠吏��뿉 蹂댁씪 湲��쓽 媛��닔
			int startRow = (page - 1) * perPage + 1; // �떆�옉以�.
			int endRow = page * perPage; // �걹 以�.

			List<PetcareDto> P_list = p_service.PetList(startRow, endRow);// �떆�옉遺��꽣 �걹源뚯��쓽 list.
			m.addAttribute("P_list", P_list);

			int pageNum = 5;
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // �쟾泥� �럹�씠吏� �닔

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
		return "petcare";
	}

	// �렖耳��뼱 湲��벐湲� 蹂닿린
	@GetMapping("/petcare/write")
	public String petcarewriteform() {
		return "petwrite";
	}

	// �쓬�떇�젏 �긽�꽭蹂닿린 �궗�씠�듃
	@GetMapping("/foodstore/content/{no}")
	public String foodcontent(@ModelAttribute("user") MemberDto user, @PathVariable int no, Model m) {
		FoodboardDto dto = f_service.foodlistone(no);
		m.addAttribute("dto", dto);
		List<FoodcommentDto> fcomm = fc_service.fviewcomment(no);
		m.addAttribute("fcomm", fcomm);
		return "foodcontent";
	}

	// �렖耳��뼱 �긽�꽭蹂닿린 �궗�씠�듃
	@GetMapping("/petcare/content/{no}")
	public String petcontent(@ModelAttribute("user") MemberDto user, @PathVariable int no, Model m) {
		PetcareDto dto = p_service.petlistone(no);
		m.addAttribute("dto", dto);
		List<PetcommentDto> pcomm = pc_service.pviewcomment(no);
		m.addAttribute("pcomm", pcomm);
		return "petcontent";
	}

	// �렖耳��뼱 肄붾찘�듃 �벑濡�
	@RequestMapping("/pcommentinsert")
	@ResponseBody
	public int commentinsert(PetcommentDto pcomment, @ModelAttribute("user") MemberDto dto) throws Exception {
		pcomment.setMemberid(dto.getMemberid());
		return pc_service.pcommentInsert(pcomment);
	}

	// �뫖�뱶 肄붾찘�듃 �벑濡�
	@RequestMapping("/fcommentInsert")
	@ResponseBody
	public int fcommentInsert(FoodcommentDto fcommdto, @ModelAttribute("user") MemberDto dto) throws Exception {
		fcommdto.setMemberid(dto.getMemberid());
		return fc_service.fcommentInsert(fcommdto);
	}

	// �뫖�뱶 寃��깋李�
	@GetMapping("/fsearch")
	public String fsearch(int searchn, String search, @RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		int count = f_service.countSearch(searchn, search);
		if (count > 0) {

			int perPage = 10; // �븳 �럹�씠吏��뿉 蹂댁씪 湲��쓽 媛��닔
			int startRow = (page - 1) * perPage + 1;
			int endRow = page * perPage;

			List<FoodboardDto> FoodList = f_service.foodstoresearch(searchn, search, startRow, endRow);
			m.addAttribute("fList", FoodList);

			int pageNum = 5;
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // �쟾泥� �럹�씠吏� �닔

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
		m.addAttribute("searchn", searchn);
		m.addAttribute("search", search);

		return "foodsearch";
	}

	@GetMapping("/psearch")
	public String psearch(int searchn, String search, @RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		int count = p_service.countSearch(searchn, search);
		if (count > 0) {

			int perPage = 10; // �븳 �럹�씠吏��뿉 蹂댁씪 湲��쓽 媛��닔
			int startRow = (page - 1) * perPage + 1;
			int endRow = page * perPage;

			List<PetcareDto> PetList = p_service.petsearch(searchn, search, startRow, endRow);
			m.addAttribute("pList", PetList);

			int pageNum = 5;
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // �쟾泥� �럹�씠吏� �닔

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
		m.addAttribute("searchn", searchn);
		m.addAttribute("search", search);

		return "petsearch";
	}


	// �렖耳��뼱 �뙎湲� �궘�젣
	@PostMapping("/pcdelete") // �뙎湲� �궘�젣
	@ResponseBody
	public String pcdelete(int pcno) {
		int i = pc_service.pcdelete(pcno);
		return "" + i;
	}

	// �뫖�뱶 �뙎湲� �궘�젣
	@PostMapping("/fcdelete") // �뙎湲� �궘�젣
	@ResponseBody
	public String fcdelete( int fcno) {
		int i = fc_service.fcdelete(fcno);
		return "" + i;
	}
	// �렖耳��뼱 �뙎湲�1媛� 吏��젙
	@PostMapping("/pccommentone")
	@ResponseBody
	public String pccommentone(int pcno) {
		PetcommentDto dto = pc_service.pcone(pcno);
		String pccontent = dto.getPccontent();
		return pccontent;
	}

	// �렖耳��뼱 �뙎湲� �닔�젙
	@PostMapping("/updatepcomm")
	@ResponseBody
	public String updatepcomm(int pcno, String pccontent) {
		int i = pc_service.updatepcomm(pcno, pccontent);
		return "" + i;
	}
	
	//�뫖�뱶�뙎湲� 1媛쒖쓽 媛� 媛��졇�삤湲� 
	@PostMapping("/fcommone")
	@ResponseBody
	public String fcommone(int fcno) {
		FoodcommentDto dto = fc_service.fcommone(fcno);
		String fccontent = dto.getFccontent();
		return fccontent;
	}
	//�뫖�뱶 �뙎湲� �닔�젙
	@ResponseBody
	@PostMapping("/updatefcomm")
	public String updatefcomm(int fcno, String fccontent, int fcscore ){
	      int i = fc_service.updatefcomm(fcno, fccontent, fcscore);
	      return "" + i;
	}
	private String upload(MultipartFile file) {
		String origName = file.getOriginalFilename();
		int index = origName.lastIndexOf(".");
		String ext = origName.substring(index+1);//�뙆�씪 �솗�옣�옄 ���옣
		
		Random r = new Random();
		String filename= System.currentTimeMillis()+"_"+r.nextInt(50)+"."+ext;
	
		try {
			String path = ResourceUtils.getFile("classpath:static/upload/").toPath().toString();
			File f = new File(path,filename);
			file.transferTo(f);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		} 
		return filename;
	}		
	
	//�렖耳��뼱 湲��벐湲�
	@PostMapping("/petcare/write") //湲� �벖�떎�쓬 湲�紐⑸줉�쑝濡� �릺�룎�븘媛�.
	public String write(PetcareDto dto, MultipartFile file, Model m) {
		String pfilename = upload(file);
		PetcareDto petcaredto = new PetcareDto();
		petcaredto.setPfilename(file.getOriginalFilename());
		petcaredto.setPfilepath(pfilename);
		petcaredto.setPfilesize(file.getSize());
		
		p_service.insert(dto);
		
		m.addAttribute("dto", dto);
		return "redirect:/petcare";// 湲�紐⑸줉
	}
	//�렖耳��뼱 �닔�젙�솕硫�
	@GetMapping("/petcare/update/{pno}")
	public String updateForm(@PathVariable int pno, Model m, String memberid) {
		PetcareDto dto = p_service.petlistone(pno);
		m.addAttribute("dto", dto);
		return "petupdate";
	}
	
	//�렖耳��뼱 �닔�젙 �뾽濡쒕뱶 
	@PostMapping("/petcare/update")
	public String update(PetcareDto dto) {
		p_service.updatepboard(dto);
		return "redirect:/petcare";
	}
	
	//�렖耳��뼱 �궘�젣 
	@ResponseBody
	@DeleteMapping("/petcare/delete/{pno}")
	public String deletepboard(@PathVariable("pno") int pno) {
		int i = p_service.deletepboard(pno);
		return ""+i;
	}
}
