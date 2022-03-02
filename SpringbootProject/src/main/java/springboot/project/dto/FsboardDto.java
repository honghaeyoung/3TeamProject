package springboot.project.dto;

import java.util.Date;

import lombok.Data;

@Data
public class FsboardDto {
	private int fsno;
	private String memberid;
	private String fstitle;
	private String fscontent; 
	private Date regdate;
	private int fsreadcount;
	private int fsrecommend;
}
