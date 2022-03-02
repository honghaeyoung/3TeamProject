package springboot.project.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CSCommDto {
	
	private int csno;
	private int cscno;
	private String masterid;
	private String csccontent;
	private Date cscregdate;
	
}
