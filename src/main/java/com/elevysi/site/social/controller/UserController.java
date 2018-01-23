package com.elevysi.site.social.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.elevysi.site.social.entity.User;
import com.elevysi.site.social.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController extends AbstractController{
	
	
	private UserService userService;
	
	@Autowired
	public UserController(UserService userService){
		this.userService = userService;
	}
	
	@RequestMapping(value="/add", method=RequestMethod.GET)
	public String add(Model model){
		User user = new User();
		user.setUuid(User.generateStaticUUID());
		model.addAttribute("user", user);
		return "addUser";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String doAdd(Model model, @Valid @ModelAttribute("user")User user, BindingResult result, RedirectAttributes redirectAttributes){
//		if(result.hasErrors()){
//			return "addUser";
//		}
		userService.saveUser(user);
		
		return "addUser";
	}

}
