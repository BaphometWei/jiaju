package com.jiaju.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jiaju.pojo.Order;
import com.jiaju.pojo.Product;
import com.jiaju.pojo.ShouHou;
import com.jiaju.pojo.User;
import com.jiaju.pojo.shangpin;
import com.jiaju.service.OrderDetailsService;
import com.jiaju.service.OrderService;
import com.jiaju.service.ProductService;
import com.jiaju.service.ShoppingCartService;
import com.jiaju.service.UserService;
import com.jiaju.util.UploadedImageFile;

@Controller
@RequestMapping("")
public class houtaiController {
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

	@RequestMapping("userguanli")
	public ModelAndView ddinfo(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("userguanli");
		List<User> users = userService.allUsers();
		for (User user2 : users) {
			if (user2.getType().equals("2")) {
				user2.setType("会员");
			} else
				user2.setType("管理员");
		}
		modelAndView.addObject("users", users);
		return modelAndView;
	}

	@RequestMapping("editusers")
	public void editusers(String username, HttpServletResponse response) throws IOException {
		User user = new User();
		user.setUsername(username);
		User user2 = userService.huoqu(user);
		if (user2.getType().equals("2")) {
			user2.setType("会员");
		} else
			user2.setType("管理员");
		ObjectMapper mapper = new ObjectMapper();
		String result = mapper.writeValueAsString(user2);
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().print(result);
	}

	@RequestMapping("gengxin")
	public String updateuser(User user) {
		userService.updateuser(user);
		return "redirect:userguanli";
	}

	@RequestMapping("tianjia")
	public String tianjia(User user) {
		if (user.getType().equals("会员"))
			user.setType("2");
		else
			user.setType("1");
		Date date = new Date();
		java.sql.Date date1 = new java.sql.Date(date.getTime());
		user.setRstime(date1);
		userService.tianjia(user);
		return "redirect:userguanli";
	}

	@RequestMapping("deleteuser")
	public String deleteuser(String username) {
		userService.deleteuser(username);
		return "redirect:userguanli";
	}

	@RequestMapping("allorder")
	public ModelAndView allorder() {
		ModelAndView modelAndView = new ModelAndView("allorder");
		List<Order> orders = oderService.allorder();
		for (Order o : orders) {
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
		modelAndView.addObject("os", orders);
		return modelAndView;
	}

	@RequestMapping("getid")
	public void getid(HttpServletResponse response, String id) throws IOException {
		User user = userService.getid(Integer.parseInt(id));
		ObjectMapper mapper = new ObjectMapper();
		String result = mapper.writeValueAsString(user);
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().print(result);
	}

	@RequestMapping("getoid")
	public void getoid(HttpServletResponse response, String oid) throws IOException {
		List<Order> orders = orderDetaillsService.odd(Integer.parseInt(oid));
		for (Order o : orders) {
			System.out.println(o.getId());
			System.out.println(o.getOrderDetails().get(0).getId());
		}
		ObjectMapper mapper = new ObjectMapper();
		String result = mapper.writeValueAsString(orders);
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().print(result);
	}

	@RequestMapping("weifahuo")
	public ModelAndView weifahuo() {
		ModelAndView modelAndView = new ModelAndView("weifahuo");
		List<Order> orders = oderService.weifahuo("0");
		for (Order o : orders) {
			o.setWuliu("待发货");
		}
		modelAndView.addObject("os", orders);
		return modelAndView;
	}

	@RequestMapping("selectoid")
	public void selectoid(HttpServletResponse response, String oid) throws IOException {
		Order order = oderService.selectorder(Integer.parseInt(oid));
		ObjectMapper mapper = new ObjectMapper();
		String result = mapper.writeValueAsString(order);
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().print(result);
	}

	@RequestMapping("updateorder")
	public String updateorder(HttpServletResponse response, Order order) throws IOException {
		oderService.updateorder(order);
		return "redirect:weifahuo";
	}

	@RequestMapping("shouhouorder")
	public ModelAndView shouhouorder() {
		ModelAndView modelAndView = new ModelAndView("shouhou");
		List<ShouHou> orders = oderService.getshouhou();
		modelAndView.addObject("os", orders);
		return modelAndView;
	}

	@RequestMapping("tuihuo")
	public ModelAndView tuihuo() {
		ModelAndView modelAndView = new ModelAndView("tuihuo");
		List<Order> orders = oderService.weifahuo("4");
		for (Order o : orders) {
			if (o.getWuliu().equals("4"))
				o.setWuliu("退货中");
		}
		modelAndView.addObject("os", orders);
		return modelAndView;
	}

	@RequestMapping("shouhoumessage")
	public void shouhoumessage(HttpServletResponse response) throws IOException {
		int i = 0;
		List<Order> orders = oderService.weifahuo("3");
		for (Order o : orders) {
			i += 1;
		}
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().print(i);
	}

	@RequestMapping("productguanli")
	public ModelAndView productguanli() {
		int length = 0;
		ModelAndView modelAndView = new ModelAndView("productguanli");
		List<Product> ps = productService.allProduct();
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
				sum[i] += orderDetaillsService.tjxiaoliang(p.getId(), date2);
			}
			System.out.println(sum[i]);
			i++;
		}
		modelAndView.addObject("sum", sum);
		modelAndView.addObject("ps", ps);
		return modelAndView;
	}

	@RequestMapping("getproduct")
	public void getproduct(String id, HttpServletResponse response) throws IOException {
		Product product = productService.productdetail(Integer.parseInt(id));
		shangpin sp = new shangpin();
		sp.setId(product.getId());
		sp.setFun(product.getFunction());
		sp.setImagename(product.getImagename());
		sp.setImagename1(product.getImagename1());
		sp.setImagename2(product.getImagename2());
		sp.setMaterial(product.getMaterial());
		sp.setStyle(product.getStyle());
		sp.setMiaoshu(product.getMiaoshu());
		sp.setPname(product.getPname());
		sp.setPrice(product.getPrice());
		sp.setNum(product.getNum());
		ObjectMapper mapper = new ObjectMapper();
		String result = mapper.writeValueAsString(sp);
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().print(result);

	}

	@RequestMapping("updateproduct")
	public String updateproduct(Product p) {
		productService.updatenum(p);
		return "redirect:productguanli";
	}

	@RequestMapping("uploadImage")
	public String upload(HttpServletRequest request, UploadedImageFile file, Product p)
			throws IllegalStateException, IOException {
		String name = RandomStringUtils.randomAlphanumeric(10);
		String newFileName = name + ".jpg";
		File newFile = new File("F:/eclipse/java/jiaju/WebContent/images", newFileName);
		newFile.getParentFile().mkdirs();
		file.getImage().transferTo(newFile);
		Map<String, Object> map = new HashMap<>();
		map.put("id", "'" + p.getId() + "'");
		map.put("canshu", "imagename");
		map.put("value", "'" + name + "'");
		productService.updateimage(map);
		return "redirect:productguanli";
	}

	@RequestMapping("uploadImage1")
	public String upload1(HttpServletRequest request, UploadedImageFile file, Product p)
			throws IllegalStateException, IOException {
		String name = RandomStringUtils.randomAlphanumeric(10);
		String newFileName = name + ".jpg";
		File newFile = new File("F:/eclipse/java/jiaju/WebContent/images", newFileName);
		newFile.getParentFile().mkdirs();
		file.getImage().transferTo(newFile);
		Map<String, Object> map = new HashMap<>();
		map.put("id", "'" + p.getId() + "'");
		map.put("canshu", "imagename1");
		map.put("value", "'" + name + "'");
		productService.updateimage(map);
		return "redirect:productguanli";
	}

	@RequestMapping("uploadImage2")
	public String upload2(HttpServletRequest request, UploadedImageFile file, Product p)
			throws IllegalStateException, IOException {
		String name = RandomStringUtils.randomAlphanumeric(10);
		String newFileName = name + ".jpg";
		File newFile = new File("F:/eclipse/java/jiaju/WebContent/images", newFileName);
		newFile.getParentFile().mkdirs();
		file.getImage().transferTo(newFile);
		Map<String, Object> map = new HashMap<>();
		map.put("id", "'" + p.getId() + "'");
		map.put("canshu", "imagename2");
		map.put("value", "'" + name + "'");
		productService.updateimage(map);
		return "redirect:productguanli";
	}

	@RequestMapping("addproduct")
	public ModelAndView addproduct(Product p) {
		ModelAndView mav = new ModelAndView("addproduct");
		return mav;
	}

	@RequestMapping("upload")
	public String upload(@RequestParam("file") MultipartFile[] file, Product p, HttpServletRequest request)
			throws IllegalStateException, IOException {
		String imagename[] = new String[3];
		for (int i = 0; i < file.length; i++) {
			String name = RandomStringUtils.randomAlphanumeric(10);
			imagename[i] = name;
			String newFileName = name + ".jpg";
			File newFile = new File("F:/eclipse/java/jiaju/WebContent/images", newFileName);
			newFile.getParentFile().mkdirs();
			file[i].transferTo(newFile);
			System.out.println(i);
		}
		p.setImagename(imagename[0]);
		p.setImagename1(imagename[1]);
		p.setImagename2(imagename[2]);
		productService.addproduct(p);
		return "redirect:addproduct";
	}

}