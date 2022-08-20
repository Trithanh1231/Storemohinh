package edu.poly.shop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import edu.poly.shop.domain.cartitem;
import edu.poly.shop.domain.category;

public interface CartRepository  extends JpaRepository<cartitem, Long> {

}
