package springboot.project.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class PetcareDto {
	
	private int pno;
	private String memberid;
	private String pkind;
	private String pperiod;
	private String pprice;
	private String pcontent;
	private Date pregdate;
	private String paddress;
	private int pcount;
	private String pphone;
	private String ptitle;
	private String pfilename;
	private String pfilepath;
	private long pfilesize;
	
}
