package edu.poly.shop.service.impl;

import java.util.HashMap;

import java.util.List;
import java.util.Map;
import java.util.function.BiFunction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import edu.poly.shop.domain.cartitem;
import edu.poly.shop.domain.product;
import edu.poly.shop.repository.CartRepository;
import edu.poly.shop.service.CartService;
import edu.poly.shop.service.ProductService;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	CartRepository cartRepository;

	@Autowired
	private ProductService productService;

	@Override
	public <S extends cartitem> S save(S entity) {
		return cartRepository.save(entity);
	}

	@Override
	public List<cartitem> findAll() {
		return cartRepository.findAll();
	}

	@Override
	public Page<cartitem> findAll(Pageable pageable) {
		return cartRepository.findAll(pageable);
	}

	@Override
	public <S extends cartitem> Page<S> findAll(Example<S> example, Pageable pageable) {
		return cartRepository.findAll(example, pageable);
	}

	@Override
	public void deleteById(Long id) {
		cartRepository.deleteById(id);
	}

	@Override
	public void delete(cartitem entity) {
		cartRepository.delete(entity);
	}

	@Override
	public void deleteAll() {
		cartRepository.deleteAll();
	}

	Map<Long, cartitem> map = new HashMap<>();

	@Override
	public cartitem add(Long id) {

		cartitem item = map.get(id);
		if (item == null) {
			item = new cartitem();
			product product = productService.getById(id);

			item.setImage(product.getImage());
			item.setName(product.getName());
			item.setPrice(product.getUnitprice());
			item.setProduct(productService.getById(product.getProductid()));
			item.setQuality(1);
			map.put(id, item);
		} else {
			item.setQuality(item.getQuality() + 1);
		}
		cartRepository.save(item);
		return item;
	}

	@Override
	public cartitem update(Long id, Integer quality) {
		cartitem item = cartRepository.getById(id);
		item.setQuality(quality);
		cartRepository.save(item);
		return item;
	}

	
	

	@Override
	public void clear() {
		cartRepository.deleteAll();
	}

	@Override
	public void remove(Long id) {
		cartRepository.deleteById(id);

	}

	@Override
	public void remove(Integer id) {
		// TODO Auto-generated method stub

	}

}
