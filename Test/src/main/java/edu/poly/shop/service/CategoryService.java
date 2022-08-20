package edu.poly.shop.service;

import java.util.List;
import java.util.Optional;
import java.util.function.Function;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery.FetchableFluentQuery;

import edu.poly.shop.domain.category;

public interface CategoryService {

	category getById(Long id);

	void deleteAll();

	void deleteAll(Iterable<? extends category> entities);

	void deleteAllInBatch();

	void deleteAllById(Iterable<? extends Long> ids);

	<S extends category, R> R findBy(Example<S> example, Function<FetchableFluentQuery<S>, R> queryFunction);

	void delete(category entity);

	void deleteAllByIdInBatch(Iterable<Long> ids);

	void deleteById(Long categoryid);

	<S extends category> boolean exists(Example<S> example);

	long count();

	void deleteAllInBatch(Iterable<category> entities);

	<S extends category> List<S> saveAllAndFlush(Iterable<S> entities);

	boolean existsById(Long id);

	<S extends category> S saveAndFlush(S entity);

	void flush();

	<S extends category> List<S> saveAll(Iterable<S> entities);

	Optional<category> findById(Integer categoryid);

	List<category> findAllById(Iterable<Long> ids);

	List<category> findAll(Sort sort);

	Page<category> findAll(Pageable pageable);

	List<category> findAll();

	<S extends category> Optional<S> findOne(Example<S> example);

	<S extends category> S save(S entity);

	List<category> findByNameContaining(String name);

	void deleteById1(Integer id);

	Page<category> findByNameContaining(String name, Pageable pageable);

	Optional<category> findById(Long categoryid);

	


}
