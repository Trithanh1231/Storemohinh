package edu.poly.shop.controller.admin;

import java.io.File;





import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;

import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import edu.poly.shop.domain.cartitem;
import edu.poly.shop.domain.product;
import edu.poly.shop.model.ProductDAO;
import edu.poly.shop.model.productDto;
import edu.poly.shop.service.CartService;
import edu.poly.shop.service.CategoryService;
import edu.poly.shop.service.ParamService;
import edu.poly.shop.service.ProductService;
import edu.poly.shop.service.ShoppingCartService;
import edu.poly.shop.service.StorageService;

@Controller
@RequestMapping("admin/products")
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	StorageService storageService;
	
	@Autowired
	ParamService param;
	
	@Autowired
	CartService cart;
	
	@Autowired
	ProductDAO dao;

	
	@Autowired
	HttpServletRequest reques;
	
	
	@Autowired
	private ServletContext application;
	
	@GetMapping("add")
	public String add(Model modeml) {
		modeml.addAttribute("product", new productDto());
		return "admin/products/AddOrEdit";
	}

	@PostMapping("add")
	public String add(@ModelAttribute("product") product product, ModelMap model) {
		productService.save(product);
		model.addAttribute("message", "Them Thanh Cong");
		return "forward:/admin/products";
	}
	
	

	@GetMapping("/edit/{productid}")
	public ModelAndView edit(ModelMap model, @PathVariable("productid") Long productid) {

		Optional<product> opt = productService.findById(productid);

		productDto dto = new productDto();

		if (opt.isPresent()) {
			product entity = opt.get();
			BeanUtils.copyProperties(entity, dto);
			dto.setIsEdit(true);
			model.addAttribute("product", dto);
			return new ModelAndView("admin/products/AddOrEdit", model);
		}
		model.addAttribute("message", "product is not existed");
		return new ModelAndView("forward:/admin/products", model);
	}

	@GetMapping("/delete/{productid}")
	public ModelAndView delete(ModelMap model, @PathVariable("productid") Long productid) {
		productService.deleteById(productid);
		model.addAttribute("mess", "Xoa Thanh Cong");
		return new ModelAndView("forward:/admin/products", model);
	}
//	@GetMapping("/delete/{productid}")
//	public ModelAndView delete(ModelMap model, @PathVariable("productid") Long productid) {
//		Optional<product> opt = productService.findById(productid);
//		if(opt.isPresent()) {
//			productService.delete(opt.get());
//			model.addAttribute("message", "xóa thành công");
//		}else {
//			model.addAttribute("message", "xóa Thất bại");
//		}
//		
//		return new ModelAndView("forward:/admin/products", model);
//	}

	@PostMapping("saveOrUpdate")
	public String saveOrUpdate(@Validated @ModelAttribute("product") productDto dto) {
		System.out.println(dto);
		if (dto.getImageFile() != null) {
			String path = application.getRealPath("/");
			System.out.println("" + path);
			try {
				dto.setImageURL(dto.getImageFile().getOriginalFilename());
				// thu muc chua anh
				String filePath = path + "/images/" + dto.getImageURL();
				File file = new File(filePath);
				dto.getImageFile().transferTo(file);
				dto.setImageFile(null);
				
				product product = new product();
				product.setProductid(dto.getProductid());
				product.setName(dto.getName());
				product.setUnitprice(dto.getUnitprice());
				product.setDescription(dto.getDescription());
				product.setEntereddate(null);
				product.setImage(dto.getImageURL());
				productService.save(product);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return "redirect:/admin/products/home";
	}
	
	
	
	

	
	@RequestMapping("")
	public String list(ModelMap model) {
		List<product> list = productService.findAll();
		model.addAttribute("products", list);
		
		return "admin/products/list";
	}
	@GetMapping("search")
	public String search(ModelMap model, @RequestParam(name = "name", required = false) String name) {
		List<product> list = null;
		if (StringUtils.hasText(name)) {
			list = productService.findByNameContaining(name);
			model.addAttribute("message", "Category Can Tim");
		} else {
			list = productService.findAll();
			model.addAttribute("message", "Danh sach Category ");
		}
		model.addAttribute("products", list);
		list = null;
		return "admin/products/search";
	}

	@GetMapping("home")
	public String search(ModelMap model, @RequestParam(name = "name", required = false) String name,
			@RequestParam("page") Optional<Integer> page, 
			@RequestParam("size") Optional<Integer> size) {
		int currentPage = page.orElse(1);
		int pageSize = size.orElse(6);
		
		if(currentPage<=0) {
			currentPage = 1;
		}
		Pageable pageable = PageRequest.of(currentPage-1, pageSize);
		Page<product> resultPage = null;
		
		if (StringUtils.hasText(name)) {
			resultPage = productService.findByNameContaining(name,pageable);
			model.addAttribute("name", name);
		} else {
			resultPage = (Page<product>) productService.findAll(pageable);
		}
		int totalPages = resultPage.getTotalPages();
		if(totalPages>0) {
			int star = Math.max(1, currentPage -2);
			int end = Math.min(currentPage+2, totalPages);
			
			if(totalPages>5) {
				if(end == totalPages) star = end -5;
				else if(star ==1) end = star +5;
			}
			List<product> list = productService.findAll();
			model.addAttribute("products", list);
			
			List<Integer> pageNumbers = IntStream.rangeClosed(star, end).boxed().collect(Collectors.toList());
			model.addAttribute("pageNumbers", pageNumbers);
		}
		
		
		model.addAttribute("productpage", resultPage);
		return "admin/products/list";
	}
	
	@RequestMapping("/search1")
	public String search(Model model, @RequestParam("min") Optional<Double> min, @RequestParam("max") Optional<Double> max) {
		double minPrice = min.orElse(Double.MIN_VALUE);
		double maxPrice = max.orElse(Double.MAX_VALUE);
		List<product> items = dao.findByPriceBetween(minPrice, maxPrice);
		model.addAttribute("items", items);
		return "admin/products/list2"; 
	}
	
	@PostMapping("/search1")
	public String searchmoney(Model model, @RequestParam("min") double min, @RequestParam("max") Optional<Double> max) {
		double minPrice ;
		double maxPrice ;
		if(min ==1) {
			minPrice = 1.0;
			maxPrice = 100;
			List<product> items = dao.findByPriceBetween(minPrice, maxPrice);
			model.addAttribute("items", items);
		}
		else if(min ==2) {
			minPrice = 100;
			maxPrice = 200;
			List<product> items = dao.findByPriceBetween(minPrice, maxPrice);
			model.addAttribute("items", items);
		}
		else if(min ==3) {
			minPrice = 200;
			maxPrice = 300;
			List<product> items = dao.findByPriceBetween(minPrice, maxPrice);
			model.addAttribute("items", items);
		}
		else if(min ==4) {
			minPrice = 500;
			maxPrice = 1000000000;
			List<product> items = dao.findByPriceBetween(minPrice, maxPrice);
			model.addAttribute("items", items);
		}
		else if(min ==5) {
			minPrice = 1.0;
			maxPrice = 100;
			List<product> items = dao.findByPriceBetween(minPrice, maxPrice);
			model.addAttribute("items", items);
		}else {
			minPrice = 0;
			maxPrice = max.orElse(Double.MAX_VALUE);
			List<product> items = dao.findByPriceBetween(minPrice, maxPrice);
			model.addAttribute("items", items);
		}
		List<product> list = productService.findAll();
		model.addAttribute("products", list);
		
		return "admin/products/list2"; 
	}
	@GetMapping("/cartview")
	public String view(ModelMap model) {
		List<cartitem> list = cart.findAll();
		model.addAttribute("cart", list);
		return "admin/cart/index";
	}
	
	@GetMapping("/addcart/{id}")
	public String add(@PathVariable("id") Long id) {
		 cart.add(id);
		return "redirect:/admin/products/home";
	}
	@GetMapping("/addcart2/{id}")
	public String add2(@PathVariable("id") Long id) {
		 cart.add(id);
		return "redirect:/admin/products/cartview";
	}
	
	@RequestMapping("/cartupdate")
	public String update() {
		Long id = (long) param.getInt("id", 0);
		Integer quality = param.getInt("quality", 0);
		cart.update(id, quality);
		return "redirect:/admin/products/cartview";
	}
	@RequestMapping("/cartremove/{id}")
	public String remove(@PathVariable("id") Long id) {
		cart.remove(id);
		return "redirect:/admin/products/cartview";
	}
	@RequestMapping("/cartclear")
	public String clear() {
		cart.clear();
		return "redirect:/admin/products/cartview";
	}
	
}
