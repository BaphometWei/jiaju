package com.jiaju.mapper;

import java.util.List;

import com.jiaju.pojo.User;

public interface ShoppingCartMapper {
	public List<User> selectsc(String name, int id);

	public void updatenum(int num, int id, String name);

	public void deletesc(String name, int id);

	public void addsc(int uid, int pid, int num);
}
