package com.jiaju.service.impl;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiaju.mapper.OrderDetailsMapper;
import com.jiaju.pojo.Order;
import com.jiaju.pojo.OrderDetails;
import com.jiaju.service.OrderDetailsService;

@Service
public class OrderDetailsServiceImpl implements OrderDetailsService {

	@Autowired
	OrderDetailsMapper orderDetailsMapper;

	public void addOrderDetails(OrderDetails orderDetails) {
		orderDetailsMapper.addOrderDetails(orderDetails);
	}

	public List<Order> odd(int id) {
		return orderDetailsMapper.odd(id);
	}

	public int tjxiaoliang(int id, Date addtime) {
		return orderDetailsMapper.tjxiaoliang(id, addtime);
	}
}
