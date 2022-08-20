package edu.poly.shop.model;


import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AccountDto {
	@NotEmpty
	private String username;
	@org.hibernate.validator.constraints.NotEmpty
	@Length(min = 3)
	private String password;
	@NotEmpty
	private boolean admin;
}
