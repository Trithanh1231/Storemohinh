package edu.poly.shop.controller.admin;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collector;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import edu.poly.shop.domain.category;
import edu.poly.shop.model.CategoryDto;
import edu.poly.shop.service.CategoryService;

@Controller
@RequestMapping("admin/categories")
public class categoryController {
	@Autowired
	CategoryService categoryService;

	@GetMapping("add")
	public String add(Model modeml) {
		modeml.addAttribute("category", new category());
		return "admin/categories/AddOrEdit";
	}

	@PostMapping("add")
	public String add(@ModelAttribute("category") category category, ModelMap model) {
		categoryService.save(category);
		model.addAttribute("message", "Them Thanh Cong");
		return "forward:/admin/categories";
	}

	@GetMapping("/edit/{categoryid}")
	public ModelAndView edit(ModelMap model, @PathVariable("categoryid") Long categoryid) {

		Optional<category> opt = categoryService.findById(categoryid);

		CategoryDto dto = new CategoryDto();

		if (opt.isPresent()) {
			category entity = opt.get();
			BeanUtils.copyProperties(entity, dto);
			dto.setIsEdit(true);
			model.addAttribute("category", dto);
			return new ModelAndView("admin/categories/AddOrEdit", model);
		}
		model.addAttribute("message", "catrgoty is not existed");
		return new ModelAndView("forward:/admin/categories", model);
	}

	@GetMapping("/delete/{categoryid}")
	public ModelAndView delete(ModelMap model, @PathVariable("categoryid") Long categoryid) {
		categoryService.deleteById(categoryid);
		model.addAttribute("mess", "Xoa Thanh Cong");
		return new ModelAndView("forward:/admin/categories/searchpaginated", model);
	}

	@PostMapping("saveOrUpdate")
	public ModelAndView saveOrUpdate(ModelMap model, CategoryDto dto) {
		category entity = new category();
		BeanUtils.copyProperties(dto, entity);
		categoryService.save(entity);
		model.addAttribute("message", "category is save");
		return new ModelAndView("forward:/admin/categories", model);
	}
	@RequestMapping("")
	public String list(ModelMap model) {
		List<category> list = categoryService.findAll();
		model.addAttribute("categories", list);
		return "admin/categories/list";
	}
	@GetMapping("search")
	public String search(ModelMap model, @RequestParam(name = "name", required = false) String name) {
		List<category> list = null;
		if (StringUtils.hasText(name)) {
			list = categoryService.findByNameContaining(name);
			model.addAttribute("message", "Category Can Tim");
		} else {
			list = categoryService.findAll();
			model.addAttribute("message", "Danh sach Category ");
		}
		model.addAttribute("categories", list);
		list = null;
		return "admin/categories/search";
	}

	@GetMapping("searchpaginated")
	public String search(ModelMap model, @RequestParam(name = "name", required = false) String name,
			@RequestParam("page") Optional<Integer> page, 
			@RequestParam("size") Optional<Integer> size) {
		int currentPage = page.orElse(1);
		int pageSize = size.orElse(5);
		
		if(currentPage<=0) {
			currentPage = 1;
		}
		Pageable pageable = PageRequest.of(currentPage-1, pageSize);
		Page<category> resultPage = null;
		
		if (StringUtils.hasText(name)) {
			resultPage = categoryService.findByNameContaining(name,pageable);
			model.addAttribute("name", name);
		} else {
			resultPage = categoryService.findAll(pageable);
		}
		int totalPages = resultPage.getTotalPages();
		if(totalPages>0) {
			int star = Math.max(1, currentPage -2);
			int end = Math.min(currentPage+2, totalPages);
			
			if(totalPages>5) {
				if(end == totalPages) star = end -5;
				else if(star ==1) end = star +5;
			}
			List<Integer> pageNumbers = IntStream.rangeClosed(star, end).boxed().collect(Collectors.toList());
			model.addAttribute("pageNumbers", pageNumbers);
		}
		model.addAttribute("categoryPage", resultPage);
		return "admin/categories/searchpaginated";
	}
	
	
}
