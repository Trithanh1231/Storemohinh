package edu.poly.shop.model;



import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import edu.poly.shop.domain.product;



@Repository
public interface ProductDAO extends JpaRepository<product, Long>{
	@Query(value="SELECT o FROM product o WHERE o.unitprice BETWEEN ?1 AND ?2")
	List<product> findByPriceBetween(double minPrice, double maxPrice);
}
