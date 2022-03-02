package springboot.project.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CSBoardDto {

	private int csno;
	private String memberid;
	private String cstitle;
	private String cspw;
	private String cscontent;
	private Date csregdate;
	private String csfilename;
	private String csfilepath;
	private String csfilesize;
	
	
	
}
