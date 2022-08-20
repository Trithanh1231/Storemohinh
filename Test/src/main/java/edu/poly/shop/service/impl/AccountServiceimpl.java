package edu.poly.shop.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import edu.poly.shop.domain.account;
import edu.poly.shop.repository.AccountRepository;
import edu.poly.shop.service.AccountService;

@Service
public class AccountServiceimpl implements AccountService{
	@Autowired
	private AccountRepository accountRepository;

	@Override
	public account login(String username, String password) {
		Optional<account> optExist= findById(username);
		if(optExist.isPresent() && optExist.get().getPassword().equals(password)) {
			optExist.get().setPassword("");
			return optExist.get();
		}
		return null;
	}
	
	@Override
	public account register(String username, String password, String password2) {
		Optional<account> optExist= findById(username);
		if(!optExist.isPresent() && password.equals(password2)) {
			return optExist.get();
		}
		return null;
	}
	
	@Override
	public <S extends account> S save(S entity) {
		Optional<account> optExist = findById(entity.getUsername());
		if(optExist.isPresent()) {
			entity.setPassword(optExist.get().getPassword());
		}
		return accountRepository.save(entity);
	}

	@Override
	public List<account> findAll() {
		return accountRepository.findAll();
	}

	@Override
	public Optional<account> findById(String id) {
		return accountRepository.findById(id);
	}

	@Override
	public void deleteById(String id) {
		accountRepository.deleteById(id);
	}

	@Override
	public void deleteAll() {
		accountRepository.deleteAll();
	}

	@Override
	public account getById(String id) {
		return accountRepository.getById(id);
	}
	
	
}
