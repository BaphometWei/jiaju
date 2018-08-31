package com.jiaju.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jiaju.pojo.User;
import com.jiaju.service.UserService;

@Controller
@RequestMapping("")
public class UserController {

	@Autowired
	UserService userService;

	@RequestMapping("login")
	public String login(User user, HttpServletRequest request) {
		System.out.println(user.getUsername());
		System.out.println(user.getPwd());
		User user2 = userService.login(user);
		request.getSession().setAttribute("Login", user2.getUsername());
		if (user2.getType().equals("会员"))
			return "redirect:shouye";
		else
			return "redirect:houtai";
	}

	@RequestMapping("login1")
	public ModelAndView login1(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("login");
		return modelAndView;
	}

	@RequestMapping("register")
	public ModelAndView register(User user, HttpServletRequest request) {
		user.setType("会员");
		Date date = new Date();
		java.sql.Date date1 = new java.sql.Date(date.getTime());
		user.setRstime(date1);
		userService.register(user);
		System.out.println(user.getUsername());
		System.out.println(user.getPwd());
		ModelAndView modelAndView = new ModelAndView("login");
		return modelAndView;
	}

	@RequestMapping("register1")
	public ModelAndView register1(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("register");
		return modelAndView;
	}

	@RequestMapping("register3")
	public void register2(String username, HttpServletResponse response) throws IOException {
		User user = new User();
		user.setUsername(username);
		User user2 = userService.huoqu(user);
		System.out.println("12345556");
		if (user2 == null)
			response.getWriter().print("1");
		else
			response.getWriter().print("0");
	}

	@RequestMapping("zhuxiao")
	public String zhuxiao(HttpServletRequest request) {
		request.getSession().removeAttribute("Login");
		return "redirect:shouye";
	}
}
