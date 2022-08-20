package edu.poly.shop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import edu.poly.shop.domain.product;

@Repository
public interface Productrepository extends JpaRepository<product, Long> {
	List<product> findByNameContaining(String name);
	Page<product> findByNameContaining(String name, Pageable pageable);
}
