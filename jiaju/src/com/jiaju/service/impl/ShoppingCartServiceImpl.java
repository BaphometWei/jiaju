package com.jiaju.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiaju.mapper.ShoppingCartMapper;
import com.jiaju.pojo.User;
import com.jiaju.service.ShoppingCartService;

@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {
	@Autowired
	ShoppingCartMapper shoppingCartMapper;

	public int selectsc(String name, String[] checks, String[] nums) {
		int sum = 0;
		for (int i = 0; i < checks.length; i++) {
			List<User> users = shoppingCartMapper.selectsc(name, Integer.parseInt(checks[i]));
			for (User o : users) {
				sum += Integer.parseInt(nums[i]) * o.getShoppingCarts().get(0).getProduct().getPrice();
			}
		}
		return sum;
	}

	public int selectscnum(String name, String pid) {
		int sum = 0;
		List<User> users = shoppingCartMapper.selectsc(name, Integer.parseInt(pid));
		for (User o : users) {
			sum += o.getShoppingCarts().get(0).getNum();
		}
		return sum;
	}

	public void updatenum(String name, String id, String num) {
		System.out.println(id);
		System.out.println(num);
		shoppingCartMapper.updatenum(Integer.parseInt(num), Integer.parseInt(id), name);
	}

	public void deletesc(String name, String id) {
		shoppingCartMapper.deletesc(name, Integer.parseInt(id));
	}

	public void addsc(int uid, int pid, int num) {
		shoppingCartMapper.addsc(uid, pid, num);
	}

}
