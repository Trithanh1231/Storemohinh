package edu.poly.shop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import edu.poly.shop.domain.product;

public interface ProductService {

	product getById(Long id);

	void deleteAll();

	product getOne(Long id);

	void delete(product entity);

	void deleteById(Long id);

	<S extends product> boolean exists(Example<S> example);

	long count();

	<S extends product> long count(Example<S> example);

	boolean existsById(Long id);

	Optional<product> findById(Long id);

	List<product> findAllById(Iterable<Long> ids);

	Page<product> findAll(Pageable pageable);

	<S extends product> S save(S entity);

	Page<product> findByNameContaining(String name, Pageable pageable);

	List<product> findByNameContaining(String name);

	List<product> findAll();
	
}
