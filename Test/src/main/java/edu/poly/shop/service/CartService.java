package edu.poly.shop.service;

import java.util.List;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import edu.poly.shop.domain.cartitem;
import edu.poly.shop.domain.product;

public interface CartService {

	void deleteAll();

	void delete(cartitem entity);

	void deleteById(Long id);

	<S extends cartitem> Page<S> findAll(Example<S> example, Pageable pageable);

	Page<cartitem> findAll(Pageable pageable);

	List<cartitem> findAll();

	<S extends cartitem> S save(S entity);

	cartitem add(Long id);

	

	void clear();

	void remove(Integer id);

	void remove(Long id);

	cartitem update(Long id, Integer quality);

	


}
