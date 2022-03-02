package springboot.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import springboot.project.dto.AdminDto;
import springboot.project.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	AdminService service;
	
	@GetMapping("/member/memberAll")
	  public String memberAll(@RequestParam(name="p",defaultValue="1")int page,Model m) {
			int count = service.count();
			if (count >0){
			int perPage = 10; //���������� ���� ���� ����
			int startRow =(page-1) *perPage +1;
			int endRow = page *perPage;
			
			List<AdminDto> memberAll = service.memberAll(startRow, endRow);
			m.addAttribute("mList", memberAll);
				
			int pageNum= 10;
			int totalpages = count/perPage+(count%perPage >0 ? 1:0);
			
			int begin =(page-1)/pageNum * pageNum +1;
			int end = begin + pageNum -1;
			if (end >totalpages) {
				end =totalpages;
			}
			m.addAttribute("begin",begin);
			m.addAttribute("end",end);
			m.addAttribute("pageNum",pageNum);
			m.addAttribute("totalPages",totalpages);
			}
			m.addAttribute("count",count);
			return "member/memberAll";
		}
	  //ȸ���˻�
	  @GetMapping("/member/membersearch")
		public String membersearch(int msearchn, String msearch,@RequestParam(name="p", defaultValue = "1") int page, Model m) {
			int count = service.countSearch(msearchn,msearch);
			if(count > 0) {
			
			int perPage = 10; // �� �������� ���� ���� ����
			int startRow = (page - 1) * perPage + 1;
			int endRow = page * perPage;
			
			List<AdminDto> memberlist = service.membersearch(msearchn,msearch,startRow, endRow);
			m.addAttribute("mList", memberlist);

			int pageNum = 5;
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); //��ü ������ ��
			
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
			m.addAttribute("msearchn", msearchn);
			m.addAttribute("msearch", msearch);
			
			return "member/membersearch";
		}
	  //ȸ������������?
	  @GetMapping("/member/updatemember")
		public String updatememberform(String id, AdminDto dto, Model m){
		  //id�� select �ؿ� ��
		  dto = service.updatemem(id);
		  m.addAttribute("Member", dto);
		  return "member/updatemember";
		}
	  //ȸ����������
	  @PostMapping("/member/updatemember")
	  public String updatemember (AdminDto dto) {
		  service.updatemember(dto);
		  return "redirect:/member/memberAll";
	  }
	  //ȸ������
	  @GetMapping("/member/deletemember")
		public String deletemember (String id){
		  service.deletemember(id);
		  System.out.println("����");
		  return "redirect:/member/memberAll";
		}
	  //�׷���
	  @GetMapping("chart/gender")
	  public String selectgender () {
		  return "chart/gender";
	  }
}
