package edu.poly.shop.domain;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Entity
@Data
@Table(name = "account")
@AllArgsConstructor
@NoArgsConstructor
public class account implements Serializable {
	@Id
	private String username;
	private String password;
	private boolean admin;
}
