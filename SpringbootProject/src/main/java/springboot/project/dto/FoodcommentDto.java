package springboot.project.dto;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class FoodcommentDto {

	private int storeid;
	private String memberid;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date fcregdate;
	private int fcno;
	private String fccontent;
	private int fcscore;
	
	
}
