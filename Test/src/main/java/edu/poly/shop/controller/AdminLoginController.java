package edu.poly.shop.controller;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import edu.poly.shop.domain.account;
import edu.poly.shop.model.AccountDto;
import edu.poly.shop.model.AdmiLoginDto;
import edu.poly.shop.service.AccountService;
import edu.poly.shop.utils.CookieUtils;


@Controller
public class AdminLoginController {
	@Autowired
	private AccountService accountService;

	@Autowired
	private HttpSession session;
	
	@Autowired
	private CookieUtils cookies;
	
	private @Autowired HttpServletRequest request;
	
	private @Autowired HttpServletResponse response;
	
	
	
	@GetMapping("alogin")
	public String login(ModelMap model) {
		model.addAttribute("account", new AdmiLoginDto());
		return "/admin/accounts/login";
	}

	@PostMapping("alogin")
	public ModelAndView login(ModelMap model, @Valid @ModelAttribute("account") AdmiLoginDto dto,
			BindingResult result) {
		Boolean remeber = Boolean.parseBoolean(request.getParameter("remember"));
		Optional<account> acc = accountService.findById(dto.getUsername());
		
		if (result.hasErrors()) {
			return new ModelAndView("/admin/accounts/login", model);
		}
		account account = accountService.login(dto.getUsername(),dto.getPassword());
		if (account == null) {
			model.addAttribute("message", "sai ten hoac mat khau !!!");
			return new ModelAndView("/admin/accounts/login", model);
		}
		session.setAttribute("username", account.getUsername());
		Object ruri = session.getAttribute("redirect-uri");
		if (ruri != null) {
			if(remeber == true) {
				cookies.add("username", dto.getUsername(), 10);
				cookies.add("password", dto.getPassword(),10);
			}else {
				cookies.remove("username");
				cookies.remove("password");
			}
			session.setAttribute("admin", acc.get().isAdmin());
			session.removeAttribute("redirect-uri");
			return new ModelAndView("redirect:" + ruri);
		}

		
		return new ModelAndView("forward:/admin/accounts", model);
	}
	@PostMapping("dk")
	public ModelAndView dk(ModelMap model, AccountDto dto,BindingResult result) {
		session.setAttribute("message", "");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");
		try {
			Optional<account> account = accountService.findById(username);
			System.out.println(account);
			if(!account.isPresent()) {
				if(username.length()>3) {
					if(password.length()>3) {
						if(password.equals(password2)) {
							
								account entity = new account();
								entity.setUsername(dto.getUsername());
								entity.setPassword(dto.getPassword());
								entity.setAdmin(false);
								accountService.save(entity);
								session.setAttribute("message", "????ng k?? th??nh c??ng");
								return new ModelAndView("/admin/accounts/login", model);
							}else {
								username = null;
								password="";
								password2="";
								session.setAttribute("message", "2 m???t kh???u kh??ng gi???ng nhau");
								return new ModelAndView("/admin/accounts/login", model);
							}
					}else {
						username ="";
						password="";
						session.setAttribute("message", "M???t kh???u ph???i ??t nh???t 3 k?? t???");
						return new ModelAndView("/admin/accounts/login", model);
					}
				}else {
					session.setAttribute("message", "Username ??t nh???t 3 k?? t???");
				}
				
				
				
					
			}else {
				username ="";
				password="";
				session.setAttribute("message", "T??i kho???n ????? t???n t???i");
				
				
				return new ModelAndView("/admin/accounts/login", model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ModelAndView("/admin/accounts/login", model);
	}
	
}
