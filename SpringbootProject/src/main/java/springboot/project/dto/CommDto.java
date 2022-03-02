package springboot.project.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CommDto {
	private int cno;
	private String memberid;	
	private String ccontent;
	private Date regdate;
	private int no;
}
