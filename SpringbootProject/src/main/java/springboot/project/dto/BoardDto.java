package springboot.project.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardDto {
	private int no;
	private String memberid;
	private String title;
	private String content; 
	private Date regdate;
	private int readcount;
	private int recommend;
	private String cofilename;
	private String cofilepath;
	
	private MultipartFile upload;
}
