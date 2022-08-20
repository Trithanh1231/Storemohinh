package edu.poly.shop.model;


import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdmiLoginDto {
	@NotEmpty
	private String username;
	@org.hibernate.validator.constraints.NotEmpty
	private String password;
	private boolean admin;
	private boolean remember = false;
}
