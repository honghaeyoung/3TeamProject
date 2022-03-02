package springboot.project.dto;

import java.util.Date;

import lombok.Data;

@Data
public class FscommDto {
	private int fscno;
	private String memberid;	
	private String fsccontent;
	private Date regdate;
	private int fsno;
}
