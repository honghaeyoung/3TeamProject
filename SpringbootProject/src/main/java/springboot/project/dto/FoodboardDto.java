package springboot.project.dto;

import lombok.Data;

@Data
public class FoodboardDto {

	private int storeid;
	private String storename;
	private String storeaddress;
	private String storephone;
	private String storecontent;
	private String storeprice;
	private String fcscore;
	private String storecomm;
}
