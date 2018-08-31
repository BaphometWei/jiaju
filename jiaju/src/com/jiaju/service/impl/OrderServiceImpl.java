package com.jiaju.service.impl;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiaju.mapper.OrderMapper;
import com.jiaju.pojo.Order;
import com.jiaju.pojo.ShouHou;
import com.jiaju.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	OrderMapper orderMapper;

	public void addOrder(Order order) {
		orderMapper.addOrder(order);
	}

	public void tjshouhou(ShouHou shouHou) {
		orderMapper.tjshouhou(shouHou);
	}

	public List<Order> ddinfo(int id) {
		return orderMapper.ddinfo(id);
	}

	public Order selectorder(int id) {
		return orderMapper.selectorder(id);
	}

	public void deleteorder(int id) {
		orderMapper.deleteorder(id);
	}

	public void deleteshouhou(int id) {
		orderMapper.deleteshouhou(id);
	}

	public int daysum(Date addtime) {
		return orderMapper.daysum(addtime);
	}

	public int dayorder(Date addtime) {
		return orderMapper.dayorder(addtime);
	}

	public int monthorder(String date) {
		return orderMapper.monthorder(date);
	}

	public int monthsum(String date) {
		return orderMapper.monthsum(date);
	}

	public List<Order> reorder() {
		return orderMapper.reorder();
	}

	public void shouhou(int id, String wuliu) {
		orderMapper.shouhou(id, wuliu);
	}

	public List<Order> allorder() {
		return orderMapper.allorder();
	}

	public List<Order> weifahuo(String wuliu) {
		return orderMapper.weifahuo(wuliu);
	}

	public List<ShouHou> getshouhou() {
		return orderMapper.getshouhou();
	}

	public void updateorder(Order order) {
		orderMapper.updateorder(order);
	}
}
