package com.jiaju.service;

import java.sql.Date;
import java.util.List;

import com.jiaju.pojo.Order;
import com.jiaju.pojo.OrderDetails;

public interface OrderDetailsService {
	void addOrderDetails(OrderDetails orderDetails);

	List<Order> odd(int id);

	int tjxiaoliang(int id, Date addtime);
}
