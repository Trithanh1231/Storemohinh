package edu.poly.shop.service.impl;



import java.util.Collection;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import edu.poly.shop.domain.cartitem;
import edu.poly.shop.service.ShoppingCartService;


@SessionScope
@Service
public class ShoppingCartServiceImpl implements ShoppingCartService{
	Map<Long, cartitem> map = new HashMap<>();
	@Override
	public cartitem add(Long productid) {
		cartitem item = map.get(productid);
			item.setQuality(item.getQuality() + 1);
		return item;
	}
	@Override
	public void remove(Long id) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public cartitem update(Long id, int quality) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void clear() {
		// TODO Auto-generated method stub
		
	}
	@Override
	public Collection<cartitem> getItems() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public double getAmount() {
		// TODO Auto-generated method stub
		return 0;
	}
	
//	@Override
//	public void remove(Integer id) {
//		map.remove(id);
//	}
//	
//	@Override
//	public Item update(Integer id, int qty) {
//		Item item = map.get(id);
//		item.setQty(qty);
//		return item;
//	}
//	
//	@Override
//	public void clear() {
//		map.clear();
//	}
//	
//	@Override
//	public Collection<Item> getItems() {
//		return map.values();
//	}
//	
//	@Override
//	public int getCount() {
//		return map.values().stream()
//				.mapToInt(item -> item.getQty())
//				.sum();
//	}
//	
//	@Override
//	public double getAmount() {
//		return map.values().stream()
//				.mapToDouble(item -> item.getPrice()*item.getQty())
//				.sum();
//	}
//
//	@Override
//	public void remove(Long id) {
//		// TODO Auto-generated method stub
//		
//	}
//
//	@Override
//	public cartitem update(Long id, int quality) {
//		// TODO Auto-generated method stub
//		return null;
//	}
}