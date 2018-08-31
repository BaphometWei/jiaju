package com.jiaju.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiaju.pojo.Product;
import com.jiaju.service.OrderDetailsService;
import com.jiaju.service.ProductService;
import com.jiaju.util.Page;

@Controller
@RequestMapping("")
public class ProductController {
	@Autowired
	ProductService productService;
	@Autowired
	OrderDetailsService orderDetailsService;

	@RequestMapping(value = "pjiazai", produces = "text/html;charset=UTF-8")
	public void jiazai(HttpServletResponse response) throws IOException {
		List<Product> ps = productService.list();
		ObjectMapper mapper = new ObjectMapper();
		String result = mapper.writeValueAsString(ps);
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().print(result);
	}

	@RequestMapping("allproduct")
	public ModelAndView allProduct(Page page, HttpServletResponse response) throws IOException {
		ModelAndView mav = new ModelAndView();
		PageHelper.offsetPage(page.getStart(), 12);
		mav.addObject("style", "所有");
		mav.addObject("function", "所有");
		mav.addObject("material", "所有");
		List<Product> ps = productService.allProduct();
		int total = (int) new PageInfo<>(ps).getTotal();
		page.caculateLast(total);
		mav.addObject("total", total);
		mav.addObject("ps", ps);
		mav.setViewName("productlist");
		return mav;
	}

	@RequestMapping("searchproduct")
	public ModelAndView searchProduct(Page page, Product p, HttpServletResponse response) throws IOException {
		ModelAndView mav = new ModelAndView();
		PageHelper.offsetPage(page.getStart(), 12);
		System.out.println("===========000");
		System.out.println(p.getPname());
		if (p.getPname() == "")
			p.setPname(null);
		mav.addObject("style", "所有");
		mav.addObject("function", "所有");
		mav.addObject("material", "所有");
		mav.addObject("search", p.getPname());
		List<Product> ps = productService.searchProduct(p);
		int total = (int) new PageInfo<>(ps).getTotal();
		page.caculateLast(total);
		mav.addObject("total", total);
		mav.addObject("ps", ps);
		mav.setViewName("productlist");
		return mav;
	}

	@RequestMapping("productlist")
	public ModelAndView productList(Page page, String style, String function, String material, String search,
			HttpServletResponse response) throws IOException {
		Map<String, Object> params = new HashMap<>();
		if (search.equals(""))
			params.put("pname", null);
		else
			params.put("pname", search);
		ModelAndView mav = new ModelAndView();
		System.out.println("------------123-------------");
		if (!(style.equals("所有") || style.equals("")))
			params.put("style", style);
		else {
			params.put("style", null);
			style = "所有";
		}
		if (!(function.equals("所有") || function.equals("")))
			params.put("function", function);
		else {
			params.put("function", null);
			function = "所有";
		}
		if (!(material.equals("所有") || material.equals("")))
			params.put("material", material);
		else {
			params.put("material", null);
			material = "所有";
		}
		Set<String> get = params.keySet();
		for (String test : get) {
			System.out.println(test + "," + params.get(test));
		}
		PageHelper.offsetPage(page.getStart(), 3);
		mav.addObject("search", search);
		mav.addObject("style", style);
		mav.addObject("function", function);
		mav.addObject("material", material);
		List<Product> ps = productService.listProduct(params);
		int total = (int) new PageInfo<>(ps).getTotal();
		page.caculateLast(total);
		mav.addObject("total", total);
		mav.addObject("ps", ps);
		mav.setViewName("productlist");
		return mav;
	}

	@RequestMapping("product")
	public ModelAndView product(int id) {
		int length = 0, i = 0;
		ModelAndView modelAndView = new ModelAndView("product");
		Product product = productService.productdetail(id);
		List<Product> products = productService.allProduct();
		for (Product p : products) {
			length++;
		}
		int[] sum = new int[length];
		for (Product p : products) {
			sum[i] = 0;
			for (int j = 0; j < 30; j++) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date date1 = new Date();
				Calendar calendar = Calendar.getInstance();
				calendar.setTime(date1);
				calendar.add(Calendar.DAY_OF_MONTH, 0 - j);
				date1 = calendar.getTime();
				java.sql.Date date2 = new java.sql.Date(date1.getTime());
				sum[i] += orderDetailsService.tjxiaoliang(p.getId(), date2);
			}
			i++;
		}
		for (int m = 0; m < products.size(); m++) { // 冒泡
			for (int n = m + 1; n < products.size(); n++) {
				if (sum[m] < sum[n]) {
					int temp = sum[m];
					sum[m] = sum[n];
					sum[n] = temp;
					Product p1 = products.get(m);
					products.set(m, products.get(n));
					products.set(n, p1);
				}
			}
		}
		List<Product> products2 = new ArrayList<Product>();
		for (int k = 0; k < 5; k++) {
			products2.add(k, products.get(k));
		}
		modelAndView.addObject("products", products2);
		modelAndView.addObject("product", product);
		return modelAndView;
	}
}
