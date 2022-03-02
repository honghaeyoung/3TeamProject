package springboot.project.dto;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class RoomCommentDto {
	private int roomno;
	private String memberid;
	private String rscontent;
	private int rsno;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date rsdate;
	private int rersno;
}
