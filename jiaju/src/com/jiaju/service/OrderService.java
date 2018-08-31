package com.jiaju.service;

import java.sql.Date;
import java.util.List;

import com.jiaju.pojo.Order;
import com.jiaju.pojo.ShouHou;

public interface OrderService {
	void addOrder(Order order);

	void tjshouhou(ShouHou shouHou);

	List<Order> ddinfo(int id);

	Order selectorder(int id);

	void deleteorder(int id);

	void deleteshouhou(int id);

	int daysum(Date addtime);

	int dayorder(Date addtime);

	int monthorder(String date);

	int monthsum(String date);

	List<Order> reorder();

	void shouhou(int id, String wuliu);

	List<Order> allorder();

	List<Order> weifahuo(String wuliu);

	List<ShouHou> getshouhou();

	void updateorder(Order order);
}
