package edu.poly.shop.controller.admin;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collector;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import edu.poly.shop.domain.account;
import edu.poly.shop.model.AccountDto;
import edu.poly.shop.model.AccountDto;
import edu.poly.shop.service.AccountService;


@Controller
@RequestMapping("admin/accounts")
public class AccountController {
	@Autowired
	AccountService accountService;
	
	@Autowired
	HttpSession session;
	
	private @Autowired HttpServletRequest request;

	@GetMapping("add")
	public String add(Model modeml) {
		modeml.addAttribute("account", new AccountDto());
		return "admin/accounts/AddOrEdit";
	}

//	@PostMapping("add")
//	public String add(@ModelAttribute("account") account account, ModelMap model) {
//		accountService.save(account);
//		model.addAttribute("message", "Them Thanh Cong");
//		return "forward:/admin/accounts";
//	}

	@GetMapping("/edit/{username}")
	public ModelAndView edit(ModelMap model, @PathVariable("username") String username) {
		
		Optional<account> opt = accountService.findById(username);

		AccountDto dto = new AccountDto();

		if (opt.isPresent()) {
			account entity = opt.get();
			BeanUtils.copyProperties(entity, dto);
			dto.setPassword("");
			model.addAttribute("account", dto);
			return new ModelAndView("admin/accounts/AddOrEdit", model);
		}
		model.addAttribute("message", "catrgoty is not existed");
		return new ModelAndView("forward:/admin/accounts", model);
	}

	@GetMapping("/delete/{username}")
	public ModelAndView delete(ModelMap model, @PathVariable("username") String username) {
		accountService.deleteById(username);
		model.addAttribute("mess", "Xoa Thanh Cong");
		return new ModelAndView("forward:/admin/accounts", model);
	}

	@PostMapping("saveOrUpdate")
	public ModelAndView saveOrUpdate(ModelMap model, AccountDto dto,BindingResult result) {
		if(result.hasErrors()) {
			return new ModelAndView("admin/accounts/AddOrEdit");
		}
		account entity = new account();
		BeanUtils.copyProperties(dto, entity);
		accountService.save(entity);
		model.addAttribute("message", "account is save");
		return new ModelAndView("forward:/admin/accounts", model);
	}
	@RequestMapping("")
	public String list(ModelMap model) {
		List<account> list = accountService.findAll();
		model.addAttribute("accounts", list);
		return "admin/accounts/list";
	}
	
	@RequestMapping("dk")
	public String list1(ModelMap model) {
		session.setAttribute("message", "");
		return "admin/accounts/dangki";
	}
	
	@PostMapping("dk")
	public ModelAndView dk(ModelMap model, AccountDto dto,BindingResult result) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");
		try {
			Optional<account> account = accountService.findById(username);
			System.out.println(account);
			if(!account.isPresent()) {
				if(password.length()>3) {
					if(password.equals(password2)) {
						
							account entity = new account();
							entity.setUsername(dto.getUsername());
							entity.setPassword(dto.getPassword());
							entity.setAdmin(false);
							accountService.save(entity);
							session.setAttribute("message", "Đăng kí thành công");
							return new ModelAndView("forward:/admin/accounts", model);
						}else {
							session.setAttribute("message", "2 mật khẩu không giống nhau");
							return new ModelAndView("admin/accounts/dangki", model);
						}
				}else {
					session.setAttribute("message", "Mật khẩu phải ít nhất 3 kí tự");
					return new ModelAndView("admin/accounts/dangki", model);
				}
				
				
					
			}else {
				session.setAttribute("message", "Tài khoản đả tồn tại");
				
				
				return new ModelAndView("admin/accounts/dangki", model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ModelAndView("forward:/admin/accounts", model);
	}
	
	
//	@GetMapping("search")
//	public String search(ModelMap model, @RequestParam(name = "name", required = false) String name) {
//		List<account> list = null;
//		if (StringUtils.hasText(name)) {
//			list = accountService.findByNameContaining(name);
//			model.addAttribute("message", "account Can Tim");
//		} else {
//			list = accountService.findAll();
//			model.addAttribute("message", "Danh sach account ");
//		}
//		model.addAttribute("accounts", list);
//		list = null;
//		return "admin/accounts/search";
//	}
//
//	@GetMapping("searchpaginated")
//	public String search(ModelMap model, @RequestParam(name = "name", required = false) String name,
//			@RequestParam("page") Optional<Integer> page, 
//			@RequestParam("size") Optional<Integer> size) {
//		int currentPage = page.orElse(1);
//		int pageSize = size.orElse(5);
//		
//		if(currentPage<=0) {
//			currentPage = 1;
//		}
//		Pageable pageable = PageRequest.of(currentPage-1, pageSize);
//		Page<account> resultPage = null;
//		
//		if (StringUtils.hasText(name)) {
//			resultPage = accountService.findByNameContaining(name,pageable);
//			model.addAttribute("name", name);
//		} else {
//			resultPage = accountService.findAll(pageable);
//		}
//		int totalPages = resultPage.getTotalPages();
//		if(totalPages>0) {
//			int star = Math.max(1, currentPage -2);
//			int end = Math.min(currentPage+2, totalPages);
//			
//			if(totalPages>5) {
//				if(end == totalPages) star = end -5;
//				else if(star ==1) end = star +5;
//			}
//			List<Integer> pageNumbers = IntStream.rangeClosed(star, end).boxed().collect(Collectors.toList());
//			model.addAttribute("pageNumbers", pageNumbers);
//		}
//		model.addAttribute("categoryPage", resultPage);
//		return "admin/accounts/searchpaginated";
//	}
	
	
}
