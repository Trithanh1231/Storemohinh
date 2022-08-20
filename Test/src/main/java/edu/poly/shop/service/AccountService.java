package edu.poly.shop.service;

import java.util.List;
import java.util.Optional;

import edu.poly.shop.domain.account;

public interface AccountService {

	account getById(String id);

	void deleteAll();

	void deleteById(String id);

	Optional<account> findById(String id);

	List<account> findAll();

	<S extends account> S save(S entity);

	account login(String username, String password);

	account register(String username, String password, String password2);

}
