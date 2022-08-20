package edu.poly.shop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import edu.poly.shop.domain.account;

@Repository
public interface AccountRepository extends JpaRepository<account, String> {
	
}
