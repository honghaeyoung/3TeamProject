package springboot.project.dto;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class PetcommentDto {

	private int pno;
	private int pcno;
	private String memberid;
	private String pccontent;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date pcregdate;
}
