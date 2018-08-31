package com.jiaju.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jiaju.pojo.Order;
import com.jiaju.pojo.OrderDetails;
import com.jiaju.pojo.Product;
import com.jiaju.pojo.ShoppingCart;
import com.jiaju.pojo.ShouHou;
import com.jiaju.pojo.User;
import com.jiaju.service.OrderDetailsService;
import com.jiaju.service.OrderService;
import com.jiaju.service.ProductService;
import com.jiaju.service.ShoppingCartService;
import com.jiaju.service.UserService;

@Controller
@RequestMapping("")
public class InformationController {
	@Autowired
	UserService userService;
	@Autowired
	ProductService productService;
	@Autowired
	ShoppingCartService shoppingCartService;
	@Autowired
	OrderService oderService;
	@Autowired
	OrderDetailsService orderDetaillsService;

	// 获取用户资料
	@RequestMapping("huoqu")
	public ModelAndView huoqu(HttpServletRequest request) {
		ModelAndView mAndView = new ModelAndView("information");
		String name = (String) request.getSession().getAttribute("Login");
		User user = new User();
		user.setUsername(name);
		User user2 = userService.huoqu(user);
		mAndView.addObject("id", user2.getId());
		mAndView.addObject("username", user2.getUsername());
		mAndView.addObject("pwd", user2.getPwd());
		mAndView.addObject("sex", user2.getSex());
		mAndView.addObject("phone", user2.getPhone());
		mAndView.addObject("add", user2.getAddress());
		mAndView.addObject("rstime", user2.getRstime());
		return mAndView;
	}

	// 判断用户地址和联系电话
	@RequestMapping("judgeap")
	public void judgeap(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name = (String) request.getSession().getAttribute("Login");
		User user = new User();
		user.setUsername(name);
		User user2 = userService.huoqu(user);
		if (user2.getAddress().equals("") || user2.getPhone().equals("")) {
			response.getWriter().print("0");
			System.out.println("=========================111111111111111");
		} else {
			System.out.println("------------13-----------");
			System.out.println(user2.getAddress());
			response.getWriter().print("1");
		}
	}

	// 更新用户资料
	@RequestMapping("updateuser")
	public String updateuser(String leixing, String value, HttpServletRequest request) {
		System.out.println(leixing);
		System.out.println(value);
		String name = (String) request.getSession().getAttribute("Login");
		Map<String, Object> map = new HashMap<>();
		map.put("username", "'" + name + "'");
		map.put("canshu", leixing);
		map.put("value", "'" + value + "'");
		userService.udi(map);
		return "redirect:huoqu";
	}

	// 获取当前用户的购物车
	@RequestMapping("getsc")
	public ModelAndView getsc(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("shoppingcarts");
		String shixiao = "0";
		String username = (String) request.getSession().getAttribute("Login");
		List<User> users = userService.getsc(username);
		int i = users.size();
		users = backtrack(users);
		if (i > users.size())
			shixiao = "1";
		modelAndView.addObject("shixiao", shixiao);
		modelAndView.addObject("users", users);
		return modelAndView;
	}

	public List<User> backtrack(List<User> users) {
		for (int i = 0; i < users.size(); i++) {
			if (users.get(i).getShoppingCarts().get(0).getProduct().getNum() <= 0) {
				users.remove(i);
				break;
			}
		}
		for (User u : users) {
			if (u.getShoppingCarts().get(0).getProduct().getNum() <= 0) {
				backtrack(users);
				break;
			}
		}
		return users;
	}

	@RequestMapping("getsxsc")
	public ModelAndView getsxsc(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("sxsc");
		String username = (String) request.getSession().getAttribute("Login");
		List<User> users = userService.getsc(username);
		users = backtrack1(users);
		modelAndView.addObject("users", users);
		return modelAndView;
	}

	public List<User> backtrack1(List<User> users) {
		for (int i = 0; i < users.size(); i++) {
			if (users.get(i).getShoppingCarts().get(0).getProduct().getNum() > 0) {
				users.remove(i);
				break;
			}
		}
		for (User u : users) {
			if (u.getShoppingCarts().get(0).getProduct().getNum() > 0) {
				backtrack1(users);
				break;
			}
		}
		return users;
	}

	// checkbox选中的购物车
	@RequestMapping("selectsc")
	public void selectsc(String[] checks, String[] nums, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		int sum = 0;
		String username = (String) request.getSession().getAttribute("Login");
		sum = shoppingCartService.selectsc(username, checks, nums);
		response.getWriter().print(sum);
	}

	// 更新购物车商品数量
	@RequestMapping("updatenum2")
	public void updatenum(String pid, String num, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String username = (String) request.getSession().getAttribute("Login");
		System.out.println(pid);
		System.out.println(num);
		shoppingCartService.updatenum(username, pid, num);
		response.getWriter().print("1");
	}

	@RequestMapping("getscnum")
	public void getscnum(String pid, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String username = (String) request.getSession().getAttribute("Login");
		int num = shoppingCartService.selectscnum(username, pid);
		response.getWriter().print(num);
	}

	// 删除购物车某个商品
	@RequestMapping("deletesc")
	public void deletesc(String pid, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String username = (String) request.getSession().getAttribute("Login");
		shoppingCartService.deletesc(username, pid);
		response.getWriter().print("1");
	}

	@RequestMapping("getsc1")
	public void getsc1(String[] checks, String[] nums, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		int sum = 0;
		String username = (String) request.getSession().getAttribute("Login");
		sum = shoppingCartService.selectsc(username, checks, nums);
		response.getWriter().print(sum);
	}

	@RequestMapping("addOrder")
	public String addOrder(String pid, String num, String price, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Product product = productService.productdetail(Integer.parseInt(pid));
		int k = product.getNum() - Integer.parseInt(num);
		product.setNum(k);
		productService.updatenum(product);
		Order order = new Order();
		String username = (String) request.getSession().getAttribute("Login");
		User user = new User();
		user.setUsername(username);
		user = userService.huoqu(user);
		order.setUid(user.getId());
		order.setAddress(user.getAddress());
		order.setPhone(user.getPhone());
		order.setSum(Integer.parseInt(num) * Integer.parseInt(price));
		Date date = new Date();
		java.sql.Date date1 = new java.sql.Date(date.getTime());
		order.setAddtime(date1);
		oderService.addOrder(order);
		int oid = order.getId();
		OrderDetails oDetails = new OrderDetails();
		oDetails.setOid(oid);
		oDetails.setProduct_id(Integer.parseInt(pid));
		System.out.println(oDetails.getProduct_id());
		oDetails.setNum(Integer.parseInt(num));
		oDetails.setAddtime(date1);
		orderDetaillsService.addOrderDetails(oDetails);
		return "redirect:deletesc?pid=" + pid;
	}

	@RequestMapping("jiesuan")
	public void jiesuan(String[] ids, String[] nums, String price, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Order order = new Order();
		String username = (String) request.getSession().getAttribute("Login");
		User user = new User();
		user.setUsername(username);
		user = userService.huoqu(user);
		order.setUid(user.getId());
		order.setAddress(user.getAddress());
		order.setPhone(user.getPhone());
		order.setSum(Integer.parseInt(price));
		Date date = new Date();
		java.sql.Date date1 = new java.sql.Date(date.getTime());
		order.setAddtime(date1);
		oderService.addOrder(order);
		int oid = order.getId();
		for (int i = 0; i < ids.length; i++) {
			Product product = productService.productdetail(Integer.parseInt(ids[i]));
			int k = product.getNum() - Integer.parseInt(nums[i]);
			product.setNum(k);
			productService.updatenum(product);
			OrderDetails oDetails = new OrderDetails();
			oDetails.setOid(oid);
			oDetails.setProduct_id(Integer.parseInt(ids[i]));
			System.out.println(oDetails.getProduct_id());
			oDetails.setNum(Integer.parseInt(nums[i]));
			oDetails.setAddtime(date1);
			orderDetaillsService.addOrderDetails(oDetails);
			shoppingCartService.deletesc(username, ids[i]);
		}
		response.getWriter().print("1");
	}

	@RequestMapping("deletesc1")
	public void deletesc1(String[] ids, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String username = (String) request.getSession().getAttribute("Login");
		for (String id : ids)
			shoppingCartService.deletesc(username, id);
		response.getWriter().print("1");
	}

	@RequestMapping("addsc")
	public void addsc(String pid, HttpServletRequest request, HttpServletResponse response) throws IOException {
		Boolean boolean1 = true;
		String username = (String) request.getSession().getAttribute("Login");
		User user = new User();
		user.setUsername(username);
		user = userService.huoqu(user);
		int uid = user.getId();
		List<User> users = userService.getsc(username);
		for (User o : users)
			for (ShoppingCart s : o.getShoppingCarts())
				if (s.getProduct().getId() == Integer.parseInt(pid))
					boolean1 = false;
		if (boolean1) {
			shoppingCartService.addsc(uid, Integer.parseInt(pid), 1);
			response.getWriter().print("1");
		} else
			response.getWriter().print("0");
	}

	@RequestMapping("ddinfo")
	public ModelAndView ddinfo(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("ddinfo");
		String username = (String) request.getSession().getAttribute("Login");
		User user = new User();
		user.setUsername(username);
		user = userService.huoqu(user);
		int uid = user.getId();
		System.out.println(uid);
		List<Order> os = oderService.ddinfo(uid);
		for (Order o : os) {
			if (o.getWuliu().equals("0"))
				o.setWuliu("待发货");
			if (o.getWuliu().equals("1"))
				o.setWuliu("已发货");
			if (o.getWuliu().equals("2"))
				o.setWuliu("已收货");
			if (o.getWuliu().equals("3"))
				o.setWuliu("申请售后中");
			if (o.getWuliu().equals("4"))
				o.setWuliu("退货中");
			if (o.getWuliu().equals("5"))
				o.setWuliu("退货退款成功");
			if (o.getWuliu().equals("6"))
				o.setWuliu("已取消");
		}
		modelAndView.addObject("os", os);
		return modelAndView;
	}

	@RequestMapping("odd")
	public ModelAndView odd(String oid) {
		List<Order> orders = orderDetaillsService.odd(Integer.parseInt(oid));
		ModelAndView modelAndView = new ModelAndView("dddetails");
		Order order = oderService.selectorder(Integer.parseInt(oid));
		modelAndView.addObject("os1", orders);
		modelAndView.addObject("oid", order);
		return modelAndView;
	}

	@RequestMapping("quxiao")
	public String quxiao(String oid) {
		oderService.shouhou(Integer.parseInt(oid), "6");
		return "redirect:ddinfo";
	}

	@RequestMapping("shouhou")
	public void shouhou(String oid, String reason, HttpServletResponse response) throws IOException {
		oderService.shouhou(Integer.parseInt(oid), "3");
		Order order = oderService.selectorder(Integer.parseInt(oid));
		ShouHou shouHou = new ShouHou();
		shouHou.setOid(order.getId());
		shouHou.setAddress(order.getAddress());
		shouHou.setPhone(order.getPhone());
		shouHou.setReason(reason);
		shouHou.setUid(order.getUid());
		shouHou.setSum(order.getSum());
		shouHou.setWuliu("申请售后中");
		Date date = new Date();
		java.sql.Date date1 = new java.sql.Date(date.getTime());
		shouHou.setAddtime(date1);
		System.out.println(date1);
		oderService.tjshouhou(shouHou);
		response.getWriter().print("1");
	}

	@RequestMapping("shouhuo")
	public void shouhuo(String oid, HttpServletResponse response) throws IOException {
		oderService.shouhou(Integer.parseInt(oid), "2");
		response.getWriter().print("1");
	}

	@RequestMapping("fahuo")
	public void fahuo(String oid, HttpServletResponse response) throws IOException {
		oderService.shouhou(Integer.parseInt(oid), "1");
		response.getWriter().print("1");
	}

	@RequestMapping("agreeshouhou")
	public void agreeshouhou(String oid, HttpServletResponse response) throws IOException {
		oderService.shouhou(Integer.parseInt(oid), "4");
		oderService.deleteshouhou(Integer.parseInt(oid));
		response.getWriter().print("1");
	}

	@RequestMapping("tuihuoss")
	public void tuihuoss(String oid, HttpServletResponse response) throws IOException {
		oderService.shouhou(Integer.parseInt(oid), "5");
		response.getWriter().print("1");
	}

	@RequestMapping("getpnum")
	public void getpnum(String pid, HttpServletResponse response) throws IOException {
		Product product = productService.productdetail(Integer.parseInt(pid));
		response.getWriter().print(product.getNum());
	}
}