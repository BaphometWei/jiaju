package com.jiaju.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
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
import com.jiaju.pojo.Order;
import com.jiaju.pojo.Product;
import com.jiaju.service.OrderDetailsService;
import com.jiaju.service.OrderService;
import com.jiaju.service.ProductService;
import com.jiaju.service.UserService;
import com.jiaju.util.Page;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("")
public class tongjiController {
	@Autowired
	UserService userService;
	@Autowired
	OrderService orderService;
	@Autowired
	ProductService productService;
	@Autowired
	OrderDetailsService orderDetailsService;

	@RequestMapping("houtai")
	public ModelAndView login2() {
		ModelAndView modelAndView = new ModelAndView("houtai");
		return modelAndView;
	}

	@RequestMapping("TJ")
	public void TJ(HttpServletResponse response) throws IOException {
		String[] date = new String[7];
		int[] usernum = new int[7];
		int[] sum = new int[7];
		for (int i = 0; i < 7; i++) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date1 = new Date();
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date1);
			calendar.add(Calendar.DAY_OF_MONTH, 0 - i);
			date1 = calendar.getTime();
			date[6 - i] = sdf.format(date1);
			java.sql.Date date2 = new java.sql.Date(date1.getTime());
			usernum[6 - i] = userService.usernum(date2);
			sum[6 - i] = orderService.daysum(date2);
			System.out.println(date[i]);
			System.out.println(usernum[i]);
			System.out.println(sum[i]);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("date", date);
		map.put("usernum", usernum);
		map.put("sum", sum);
		JSONObject jsonobject = JSONObject.fromObject(map);
		response.getWriter().print(jsonobject);
	}

	@RequestMapping("reorder")
	public void reorder(HttpServletResponse response) throws IOException {
		List<Order> orders = orderService.reorder();
		for (Order o : orders) {
			if (o.getWuliu().equals("0"))
				o.setWuliu("未发货");
			else
				o.setWuliu("已发货");
		}
		ObjectMapper mapper = new ObjectMapper();
		String result = mapper.writeValueAsString(orders);
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().print(result);
	}

	@RequestMapping("sortxp")
	public ModelAndView productList(Page page, String style, String function, String material, String search,
			String xiaoliang, HttpServletResponse response) {
		int length = 0;
		ModelAndView modelAndView = new ModelAndView("productlist");
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
		if (!xiaoliang.equals("0")) {
			if (xiaoliang.equals("1") || xiaoliang.equals("2")) {
				PageHelper.offsetPage(page.getStart(), 12);
				List<Product> ps = xiaoliang(params, xiaoliang);
				int total = (int) new PageInfo<>(ps).getTotal();

				page.caculateLast(total);
				int[] sum = sum(params, xiaoliang);
				ModelAndView mav1 = new ModelAndView("productlist2");
				mav1.addObject("leixing", xiaoliang);
				mav1.addObject("style", style);
				mav1.addObject("function", function);
				mav1.addObject("material", material);
				mav1.addObject("search", search);
				mav1.addObject("sum", sum);
				mav1.addObject("total", total);
				mav1.addObject("ps", ps);
				return mav1;
			} else if (xiaoliang.equals("3")) {
				PageHelper.offsetPage(page.getStart(), 12);
				List<Product> ps1 = productService.upprice(params);
				int total = (int) new PageInfo<>(ps1).getTotal();
				page.caculateLast(total);
				modelAndView.addObject("leixing", xiaoliang);
				modelAndView.addObject("style", style);
				modelAndView.addObject("function", function);
				modelAndView.addObject("material", material);
				modelAndView.addObject("search", search);
				modelAndView.addObject("total", total);
				modelAndView.addObject("ps", ps1);
				return modelAndView;
			} else if (xiaoliang.equals("4")) {
				PageHelper.offsetPage(page.getStart(), 12);
				List<Product> ps2 = productService.downprice(params);
				int total = (int) new PageInfo<>(ps2).getTotal();
				page.caculateLast(total);
				modelAndView.addObject("style", style);
				modelAndView.addObject("function", function);
				modelAndView.addObject("material", material);
				modelAndView.addObject("search", search);
				modelAndView.addObject("leixing", xiaoliang);
				modelAndView.addObject("total", total);
				modelAndView.addObject("ps", ps2);
				return modelAndView;
			}
		}
		PageHelper.offsetPage(page.getStart(), 12);
		List<Product> ps3 = productService.listProduct(params);
		int total = (int) new PageInfo<>(ps3).getTotal();
		page.caculateLast(total);
		modelAndView.addObject("style", style);
		modelAndView.addObject("function", function);
		modelAndView.addObject("material", material);
		modelAndView.addObject("search", search);
		modelAndView.addObject("total", total);
		modelAndView.addObject("ps", ps3);
		return modelAndView;
	}

	public List<Product> xiaoliang(Map<String, Object> params, String xiaoliang) {
		int length = 0;
		List<Product> ps = productService.listProduct(params);
		for (Product p : ps) {
			length++;
		}
		int i = 0;
		int[] sum = new int[length];
		for (Product p : ps) {
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
			System.out.println(sum[i]);
			i++;
		}
		if (xiaoliang.equals("1")) {
			// ps = sort(ps, sum, 0, ps.size() - 1); //快排
			for (int m = 0; m < ps.size(); m++) { // 冒泡
				for (int n = m + 1; n < ps.size(); n++) {
					if (sum[m] < sum[n]) {
						int temp = sum[m];
						sum[m] = sum[n];
						sum[n] = temp;
						Product p1 = ps.get(m);
						Product p2 = ps.get(n);
						ps.set(m, p2);
						ps.set(n, p1);
					}
				}
			}
		} else {
			for (int m = 0; m < ps.size(); m++) {
				for (int n = m + 1; n < ps.size(); n++) {
					if (sum[m] > sum[n]) {
						int temp = sum[m];
						sum[m] = sum[n];
						sum[n] = temp;
						Product p1 = ps.get(m);
						Product p2 = ps.get(n);
						ps.set(m, p2);
						ps.set(n, p1);
					}
				}
			}
		}
		return ps;
	}

	public int[] sum(Map<String, Object> params, String xiaoliang) {
		int length = 0;
		List<Product> ps = productService.listProduct(params);
		for (Product p : ps) {
			length++;
		}
		int i = 0;
		int[] sum = new int[length];
		for (Product p : ps) {
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
			System.out.println(sum[i]);
			i++;
		}
		if (xiaoliang.equals("1")) {
			// ps = sort(ps, sum, 0, ps.size() - 1); //快排
			for (int m = 0; m < ps.size(); m++) { // 冒泡
				for (int n = m + 1; n < ps.size(); n++) {
					if (sum[m] < sum[n]) {
						int temp = sum[m];
						sum[m] = sum[n];
						sum[n] = temp;
						Product p1 = ps.get(m);
						Product p2 = ps.get(n);
						ps.set(m, p2);
						ps.set(n, p1);
					}
				}
			}
		} else {
			for (int m = 0; m < ps.size(); m++) {
				for (int n = m + 1; n < ps.size(); n++) {
					if (sum[m] > sum[n]) {
						int temp = sum[m];
						sum[m] = sum[n];
						sum[n] = temp;
						Product p1 = ps.get(m);
						Product p2 = ps.get(n);
						ps.set(m, p2);
						ps.set(n, p1);
					}
				}
			}
		}
		return sum;
	}

	public List<Product> sort(List<Product> ps, int[] sum, int l, int r) {
		if (l < r) {
			// Swap(s[l], s[(l + r) / 2]); //将中间的这个数和第一个数交换 参见注1
			int i = l, j = r, x = sum[l];
			Product p = ps.get(l);
			while (i < j) {
				while (i < j && sum[j] <= x) // 从右向左找第一个小于x的数
					j--;
				if (i < j) {
					sum[i] = sum[j];
					Product p1 = ps.get(j);
					ps.set(i, p1);
					i++;
				}
				while (i < j && sum[i] > x) // 从左向右找第一个大于等于x的数
					i++;
				if (i < j) {
					sum[j] = sum[i];
					Product p2 = ps.get(i);
					ps.set(j, p2);
					j--;
				}
			}
			sum[i] = x;
			ps.set(i, p);
			sort(ps, sum, l, i - 1); // 递归调用
			sort(ps, sum, i + 1, r);
		}
		return ps;
	}

	public List<Product> sort1(List<Product> ps, int[] sum, int l, int r) {
		if (l < r) {
			// Swap(s[l], s[(l + r) / 2]); //将中间的这个数和第一个数交换 参见注1
			int i = l, j = r, x = sum[l];
			Product p = ps.get(l);
			while (i < j) {
				while (i < j && sum[j] > x) // 从右向左找第一个小于x的数
					j--;
				if (i < j) {
					sum[i] = sum[j];
					Product p1 = ps.get(j);
					ps.set(i, p1);
					i++;
				}
				while (i < j && sum[i] <= x) // 从左向右找第一个大于等于x的数
					i++;
				if (i < j) {
					sum[j] = sum[i];
					Product p2 = ps.get(i);
					ps.set(j, p2);
					j--;
				}
			}
			sum[i] = x;
			ps.set(i, p);
			sort1(ps, sum, l, i - 1); // 递归调用
			sort1(ps, sum, i + 1, r);
		}
		return ps;
	}

	@RequestMapping("usertj")
	public ModelAndView usertj() {
		ModelAndView modelAndView = new ModelAndView("usertj");
		return modelAndView;
	}

	@RequestMapping("usertongji")
	public void userTJ(HttpServletResponse response) throws IOException {
		String[] date = new String[6];
		int[] sum = new int[6];
		for (int i = 0; i < 6; i++) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
			Date date1 = new Date();
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date1);
			calendar.add(Calendar.MONTH, 0 - i);
			date1 = calendar.getTime();
			System.out.println(sdf.format(date1));
			date[5 - i] = sdf.format(date1);
			sum[5 - i] = userService.usertongji(date[5 - i]);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("date", date);
		map.put("sum", sum);
		JSONObject jsonobject = JSONObject.fromObject(map);
		response.getWriter().print(jsonobject);
	}

	@RequestMapping("ordertj")
	public ModelAndView ordertj() {
		ModelAndView modelAndView = new ModelAndView("ordertj");
		return modelAndView;
	}

	@RequestMapping("ordertongji1")
	public void ordertongji1(HttpServletResponse response) throws IOException {
		String[] date = new String[7];
		int[] order = new int[7];
		int[] sum = new int[7];
		for (int i = 0; i < 7; i++) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date1 = new Date();
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date1);
			calendar.add(Calendar.DAY_OF_MONTH, 0 - i);
			date1 = calendar.getTime();
			date[6 - i] = sdf.format(date1);
			java.sql.Date date2 = new java.sql.Date(date1.getTime());
			order[6 - i] = orderService.dayorder(date2);
			sum[6 - i] = orderService.daysum(date2);
			System.out.println("88888888888888888888888888888888888888");
			System.out.println(date[6 - i]);
			System.out.println(order[6 - i]);
			System.out.println(sum[6 - i]);
			System.out.println("99999999999999999999999999999999999999");
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("date", date);
		map.put("order", order);
		map.put("sum", sum);
		JSONObject jsonobject = JSONObject.fromObject(map);
		response.getWriter().print(jsonobject);
	}

	@RequestMapping("ordertongji2")
	public void ordertongji2(HttpServletResponse response) throws IOException {
		String[] date = new String[6];
		int[] order = new int[6];
		int[] sum = new int[6];
		for (int i = 0; i < 6; i++) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
			Date date1 = new Date();
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date1);
			calendar.add(Calendar.MONTH, 0 - i);
			date1 = calendar.getTime();
			date[5 - i] = sdf.format(date1);
			order[5 - i] = orderService.monthorder(sdf.format(date1));
			sum[5 - i] = orderService.monthsum(sdf.format(date1));
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("date", date);
		map.put("order", order);
		map.put("sum", sum);
		JSONObject jsonobject = JSONObject.fromObject(map);
		response.getWriter().print(jsonobject);
	}
}
