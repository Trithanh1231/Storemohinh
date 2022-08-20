package edu.poly.shop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import edu.poly.shop.domain.category;

@Repository
public interface Categoryrepository extends JpaRepository<category, Long> {
	List<category> findByNameContaining(String name);
	Page<category> findByNameContaining(String name, Pageable pageable);
}
