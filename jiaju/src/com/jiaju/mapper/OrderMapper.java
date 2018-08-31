package com.jiaju.mapper;

import java.sql.Date;
import java.util.List;

import com.jiaju.pojo.Order;
import com.jiaju.pojo.ShouHou;

public interface OrderMapper {
	public void addOrder(Order order);

	public void tjshouhou(ShouHou shouHou);

	public List<Order> ddinfo(int id);

	public Order selectorder(int id);

	public void deleteorder(int id);

	public void deleteshouhou(int oid);

	public int daysum(Date addtime);

	public int dayorder(Date addtime);

	public int monthorder(String date);

	public int monthsum(String date);

	public List<Order> reorder();

	public void shouhou(int id, String wuliu);

	public List<Order> allorder();

	public List<Order> weifahuo(String wuliu);

	public List<ShouHou> getshouhou();

	public void updateorder(Order order);
}
