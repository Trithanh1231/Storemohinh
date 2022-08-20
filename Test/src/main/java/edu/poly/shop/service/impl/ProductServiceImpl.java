package edu.poly.shop.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import edu.poly.shop.domain.category;
import edu.poly.shop.domain.product;
import edu.poly.shop.repository.Productrepository;
import edu.poly.shop.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private Productrepository productrepository;

	@Override
	public <S extends product> S save(S entity) {
		return productrepository.save(entity);
	}

	@Override
	public List<product> findAll() {
		return productrepository.findAll();
	}

	@Override
	public List<product> findAllById(Iterable<Long> ids) {
		return productrepository.findAllById(ids);
	}

	@Override
	public Optional<product> findById(Long id) {
		return productrepository.findById(id);
	}

	@Override
	public boolean existsById(Long id) {
		return productrepository.existsById(id);
	}

	@Override
	public <S extends product> long count(Example<S> example) {
		return productrepository.count(example);
	}

	@Override
	public long count() {
		return productrepository.count();
	}

	@Override
	public <S extends product> boolean exists(Example<S> example) {
		return productrepository.exists(example);
	}

	@Override
	public void deleteById(Long id) {
		productrepository.deleteById(id);
	}

	@Override
	public void delete(product entity) {
		productrepository.delete(entity);
	}

	@Override
	public product getOne(Long id) {
		return productrepository.getOne(id);
	}

	@Override
	public void deleteAll() {
		productrepository.deleteAll();
	}

	@Override
	public product getById(Long id) {
		return productrepository.getById(id);
	}

	@Override
	public List<product> findByNameContaining(String name) {
		
		return null;
	}

	

	@Override
	public Page<product> findByNameContaining(String name, Pageable pageable) {
		return productrepository.findByNameContaining(name, pageable);
	}

	@Override
	public Page<product> findAll(Pageable pageable) {
		return productrepository.findAll(pageable);
	}
	
	
}
