package edu.poly.shop.service.impl;

import java.util.List;

import java.util.Optional;
import java.util.function.Function;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery.FetchableFluentQuery;
import org.springframework.stereotype.Service;

import edu.poly.shop.domain.category;
import edu.poly.shop.repository.Categoryrepository;
import edu.poly.shop.service.CategoryService;

@Service
public class CatogeryServiceImpl implements CategoryService {
	Categoryrepository categoryrepository;

	public CatogeryServiceImpl(Categoryrepository categoryrepository) {
		this.categoryrepository = categoryrepository;
	}
	
	
	@Override
	public Page<category> findByNameContaining(String name, Pageable pageable) {
		return categoryrepository.findByNameContaining(name, pageable);
	}


	@Override
	public List<category> findByNameContaining(String name) {
		return categoryrepository.findByNameContaining(name);
	}

	public void deleteById(Long id) {
		categoryrepository.deleteById(id);
	}

	@Override
	public <S extends category> S save(S entity) {
		return categoryrepository.save(entity);
	}

	@Override
	public <S extends category> Optional<S> findOne(Example<S> example) {
		return categoryrepository.findOne(example);
	}

	@Override
	public List<category> findAll() {
		return categoryrepository.findAll();
	}

	@Override
	public Page<category> findAll(Pageable pageable) {
		return categoryrepository.findAll(pageable);
	}

	@Override
	public List<category> findAll(Sort sort) {
		return categoryrepository.findAll(sort);
	}

	
	@Override
	public <S extends category> List<S> saveAll(Iterable<S> entities) {
		return categoryrepository.saveAll(entities);
	}

	@Override
	public void flush() {
		categoryrepository.flush();
	}

	@Override
	public <S extends category> S saveAndFlush(S entity) {
		return categoryrepository.saveAndFlush(entity);
	}

	

	@Override
	public <S extends category> List<S> saveAllAndFlush(Iterable<S> entities) {
		return categoryrepository.saveAllAndFlush(entities);
	}

	@Override
	public void deleteAllInBatch(Iterable<category> entities) {
		categoryrepository.deleteAllInBatch(entities);
	}

	@Override
	public long count() {
		return categoryrepository.count();
	}

	@Override
	public <S extends category> boolean exists(Example<S> example) {
		return categoryrepository.exists(example);
	}

	

	

	@Override
	public void delete(category entity) {
		categoryrepository.delete(entity);
	}

	@Override
	public <S extends category, R> R findBy(Example<S> example, Function<FetchableFluentQuery<S>, R> queryFunction) {
		return categoryrepository.findBy(example, queryFunction);
	}

	

	@Override
	public void deleteAllInBatch() {
		categoryrepository.deleteAllInBatch();
	}
	@Override
	public void deleteAll(Iterable<? extends category> entities) {
		categoryrepository.deleteAll(entities);
	}

	@Override
	public void deleteAll() {
		categoryrepository.deleteAll();
	}

	

	

	@Override
	public Optional<category> findById(Long categoryid) {
		return categoryrepository.findById(categoryid);
	}

	@Override
	public List<category> findAllById(Iterable<Long> ids) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public category getById(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteAllById(Iterable<? extends Long> ids) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteAllByIdInBatch(Iterable<Long> ids) {
		// TODO Auto-generated method stub
		
	}

	

	@Override
	public boolean existsById(Long id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void deleteById1(Integer id) {
		// TODO Auto-generated method stub
		
	}


	

	@Override
	public Optional<category> findById(Integer categoryid) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
