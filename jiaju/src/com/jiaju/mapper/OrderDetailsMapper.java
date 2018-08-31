package com.jiaju.mapper;

import java.sql.Date;
import java.util.List;

import com.jiaju.pojo.Order;
import com.jiaju.pojo.OrderDetails;

public interface OrderDetailsMapper {
	public void addOrderDetails(OrderDetails orderDetails);

	public List<Order> odd(int id);

	public int tjxiaoliang(int id, Date addtime);
}
