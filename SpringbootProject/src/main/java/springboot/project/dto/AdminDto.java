package springboot.project.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class AdminDto {
	 private String memberid;   
	   private String memberpw;    
	   private String name;         
	   private String phone;       
	   private String address;     
	   private String gender;
	   @DateTimeFormat(pattern="yyyy-MM-dd")
	   private Date birthday;  
	   private String email;        
	   private String pet ;  
}
