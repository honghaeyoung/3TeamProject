package springboot.project.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class RoomDto {
	private int roomno;
	private String roomtitle;
	private String roomaddress;
	private String roomcontent;
	private String memberid;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date roomregdate;
	private String roomperiod;
	private String roomphone;
	private int roomcno;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date roomdate;
	private int roomstate;
}
