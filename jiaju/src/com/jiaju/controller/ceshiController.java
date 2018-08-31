package com.jiaju.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jiaju.pojo.User;
import com.jiaju.service.UserService;

// 告诉spring mvc这是一个控制器类
@Controller
@RequestMapping("")
public class ceshiController {

	@Autowired
	UserService userService;

	@RequestMapping("panduan")
	public void panduan(String username, String pwd, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		User user = new User();
		user.setUsername(username);
		user.setPwd(pwd);
		User user2 = userService.login(user);
		if (user2 == null) {
			response.getWriter().print("0");
		} else {
			response.getWriter().print("1");
		}
	}

	@RequestMapping("shouye")
	public ModelAndView shouye() {
		ModelAndView modelAndView = new ModelAndView("index");
		return modelAndView;
	}

}