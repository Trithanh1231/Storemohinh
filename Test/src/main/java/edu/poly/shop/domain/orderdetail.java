package edu.poly.shop.domain;

import java.io.Serializable;
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
@Table(name = "orderdetails")
@NoArgsConstructor
@AllArgsConstructor
public class orderdetail implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int orderdetailid;
//	private int orderid;
//	private int productid;
	private int quality;
	private double unitprice;
	
	@ManyToOne
	@JoinColumn(name = "productid")
	private product product;
 		
	@ManyToOne
	@JoinColumn(name = "orderid")
	private order order;
}
