package edu.poly.shop.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@Table(name = "products")
@AllArgsConstructor
@NoArgsConstructor
public class product implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long productid;
	private String name;
	private double unitprice;
	private String image;
	private String description;
	private Date entereddate;
	
	@ManyToOne
	@JoinColumn(name="categoryid")
	private category category;
	
	@OneToMany(mappedBy = "product",cascade = CascadeType.REMOVE)
	private Set<orderdetail> orderdetails;
	
	@OneToMany(mappedBy = "product")
	private Set<cartitem> cartItems;
	
}
