package edu.poly.shop.controller;

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
import edu.poly.shop.model.AdmiLoginDto;
import edu.poly.shop.service.AccountService;

@Controller
public class SiteLoginController {
//	@Autowired
//	private AccountService accountService;
//
//	@Autowired
//	private HttpSession session;
//
//	@GetMapping("alogin")
//	public String login(ModelMap model) {
//		model.addAttribute("account", new AdmiLoginDto());
//		return "/admin/accounts/login";
//	}
//
//	@PostMapping("alogin")
//	public ModelAndView login(ModelMap model, @Valid @ModelAttribute("account") AdmiLoginDto dto,
//			BindingResult result) {
//		if (result.hasErrors()) {
//			return new ModelAndView("/admin/accounts/login", model);
//		}
//		account account = accountService.login(dto.getUsername(), dto.getPassword());
//		if (account == null) {
//			model.addAttribute("message", "sai ten hoac mat khau !!!");
//			return new ModelAndView("/admin/accounts/login", model);
//		}
//		session.setAttribute("username", account.getUsername());
//		Object ruri = session.getAttribute("redirect-uri");
//		if (ruri != null) {
//			session.removeAttribute("redirect-uri");
//			return new ModelAndView("redirect:" + ruri);
//		}
//
//		
//		return new ModelAndView("forward:/admin/products", model);
//	}
}
