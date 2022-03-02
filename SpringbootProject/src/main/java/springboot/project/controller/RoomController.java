package springboot.project.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.swing.filechooser.FileSystemView;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import org.springframework.web.bind.annotation.PathVariable;

import springboot.project.dto.MemberDto;
import springboot.project.dto.RoomCommentDto;
import springboot.project.dto.RoomDto;
import springboot.project.dto.RoomFileDto;
import springboot.project.service.RoomService;

@SessionAttributes("user")
@Controller
public class RoomController {
	
	@Autowired
	RoomService service;
	
	@ModelAttribute("user")
	public MemberDto getDto() {
		return new MemberDto();
	}
	
	private String upload(MultipartFile file) {
		String origName = file.getOriginalFilename();
		int index = origName.lastIndexOf(".");
		String ext = origName.substring(index+1);//파일 확장자 저장
		
		Random r = new Random();
		String fileName= System.currentTimeMillis()+"_"+r.nextInt(50)+"."+ext;
	
		try {
			String path = ResourceUtils.getFile("classpath:static/upload/").toPath().toString();
			File f = new File(path,fileName);
			file.transferTo(f);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		} 
		return fileName;
	}
	
	private void deletefile(String fileName) {
		String path;
		try {
			path = ResourceUtils.getFile("classpath:static/upload/").toPath().toString();
			File f = new File(path,fileName);
			if(f.exists()) { // 파일이 존재하면 
				f.delete(); // 파일 삭제 
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@GetMapping("/room/list")
	public String list(Model m,@RequestParam(name="p",defaultValue ="1") int page) {
		int count = service.roomcount();
		if(count > 0) {
			int perPage = 10; //한 페이지에 보일 글의 갯수
			int startRow = (page-1) * perPage +1;
			int endRow = page * perPage;
			
			List<List<Object>> rooms = new ArrayList<List<Object>>();
			List<RoomDto> roomList = service.roomList(startRow, endRow);
			
			for (RoomDto room : roomList) {
				int roomno = room.getRoomno();
				List<RoomFileDto> roomfile = service.roomdata(roomno);
				List<Object> roomone = new ArrayList<Object>();
				roomone.add(room);
				roomone.add(roomfile.get(0));
				rooms.add(roomone);
			}
			
			m.addAttribute("rList",rooms);
		
			int pageNum = 5; //한번에 보일 페이지 수
			int totalPages = count/perPage + (count%perPage > 0 ? 1:0); //전체 페이지 수
			
			int begin = (page -1) / pageNum * pageNum +1;
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
		
		
		return "room/list";
	}
	
	@GetMapping("/room/write")
	public String write(@ModelAttribute("user") MemberDto user) {
		return "room/write";
	}
	
	
	
	@PostMapping("/room/write")
	public String roomwrite(RoomDto dto,@RequestParam("roompic") MultipartFile[] files) throws IllegalStateException, IOException {
		service.roomshareWrite(dto);

		for(MultipartFile file : files) {
			String fileName = upload(file);
			RoomFileDto filedto = new RoomFileDto();
			
			filedto.setRimgoriname(file.getOriginalFilename());
			filedto.setRimgpath(fileName);
			filedto.setRimgsize(file.getSize());
			
			service.uploadimg(filedto);
			
		}
		
		return "redirect:/room/list";
	}
	
	@GetMapping("/room/list/{roomno}")
	public String roomdetail(@PathVariable int roomno,Model m,@ModelAttribute("user") MemberDto user) {
		int a = service.countingRoom(roomno);
		RoomDto dto = service.roomdetail(roomno);
		List<RoomFileDto> images = service.roomdata(roomno);
		List<RoomCommentDto> comment = service.rcommlist(roomno);
		List<RoomCommentDto> recomment = service.recommlist(roomno);
		m.addAttribute("room",dto);
		m.addAttribute("images",images);
		m.addAttribute("comments",comment);
		m.addAttribute("recomments",recomment);
		return "room/detail";
	}
	
	@GetMapping("/room/quit/{roomno}")
	public String quitRoomshare(@PathVariable int roomno) {
		int a = service.quitRoomshare(roomno);
		return "redirect:/room/list/"+roomno;
	}

	@GetMapping("/room/delete/{roomno}")
	public String deleteRoomshare(@PathVariable int roomno) {
		int a = service.deleteRoomshare(roomno);
		return "redirect:/room/list";
	}
	
	@GetMapping("/room/update/{roomno}")
	public String updateRoomshare(@PathVariable int roomno,Model m) {
		RoomDto dto = service.roomdetail(roomno);
		List<RoomFileDto> images = service.roomdata(roomno);
		m.addAttribute("room",dto);
		m.addAttribute("images",images);
		return "room/update";
	}
	
	@PostMapping("/room/update")
	public String update(RoomDto dto,@RequestParam("roompic") MultipartFile[] files) {
		int a = service.updateRoomshare(dto);
		int roomno = dto.getRoomno();
		
		if(files[0].getSize() != 0) {
			List<RoomFileDto> images = service.roomdata(roomno);
			
			for(RoomFileDto image : images) {
				String fileName = image.getRimgpath();
				deletefile(fileName);
			}
			
			int b = service.deleteRoomFile(roomno);
			
			for(MultipartFile file : files) {
				String fileName = upload(file);
				RoomFileDto filedto = new RoomFileDto();
				
				filedto.setRoomno(roomno);
				filedto.setRimgoriname(file.getOriginalFilename());
				filedto.setRimgpath(fileName);
				filedto.setRimgsize(file.getSize());
				
				service.updatefile(filedto);
				
			}
		}
		
		return "redirect:/room/list/"+roomno;
	}
	
	@GetMapping("/room/list/search")
	public String search(int searchn,String search,Model m,@RequestParam(name="p",defaultValue ="1") int page) {
		
		int count = service.countSearch(search,searchn);
		if(count > 0) {
			int perPage = 10; //한 페이지에 보일 글의 갯수
			int startRow = (page-1) * perPage +1;
			int endRow = page * perPage;
			
			List<List<Object>> rooms = new ArrayList<List<Object>>();
			List<RoomDto> searchList = service.roomSearch(search, searchn,startRow,endRow);
			
			for (RoomDto room : searchList) {
				int roomno = room.getRoomno();
				List<RoomFileDto> roomfile = service.roomdata(roomno);
				List<Object> roomone = new ArrayList<Object>();
				roomone.add(room);
				roomone.add(roomfile.get(0));
				rooms.add(roomone);
			}
			
			m.addAttribute("sList",rooms);
		
			int pageNum = 5; //한번에 보일 페이지 수
			int totalPages = count/perPage + (count%perPage > 0 ? 1:0); //전체 페이지 수
			
			int begin = (page -1) / pageNum * pageNum +1;
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
		
		
		return "room/search";
	}
	
	@PostMapping("/room/list/{roomno}/rswrite")
	public String rcommWrite(RoomCommentDto dto,@PathVariable int roomno) {
		int a = service.rcommWrite(dto);
		return "redirect:/room/list/"+roomno;
	}
	
	@GetMapping("/room/rsdelete")
	@ResponseBody
	public String rcommdelete(int rsno) {
		int a = service.rcommdelete(rsno);
		return""+a;
	}
	
	@PostMapping("/room/commentone")
	@ResponseBody
	public RoomCommentDto commentOne(int rsno) {
		RoomCommentDto dto = service.commentOne(rsno);
		return dto;
	}
	
	@GetMapping("/room/rsupdate")
	@ResponseBody
	public String rcommupdate(int rsno ,String rscontent) {
		int a = service.rcommupdate(rscontent,rsno);
		return ""+a;
	}
	
	@GetMapping("/room/recommwrite")
	@ResponseBody
	public String recommwrite(String memberid, int rersno ,String rscontent, int roomno) {
		RoomCommentDto dto = new RoomCommentDto();
		dto.setMemberid(memberid);
		dto.setRersno(rersno);
		dto.setRscontent(rscontent);
		dto.setRoomno(roomno);
		int a = service.rcommWrite(dto);
		return ""+a;
	}
	
	
	
	
	
	
}
