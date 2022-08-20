package edu.poly.shop.model;



import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class productDto {
	private Long productid;
	private String name;
	private double unitprice;
	private String image;
	private MultipartFile imageFile;
	private String description;
	private Date entereddate;
	private Long categoryid;

	
	private String imageURL;
	private Boolean isEdit = false; 
}
