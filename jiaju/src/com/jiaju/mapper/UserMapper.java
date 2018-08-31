package com.jiaju.mapper;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.jiaju.pojo.User;

public interface UserMapper {
	public User login(User user);

	public void register(User user);

	public User huoqu(User user);

	public void udi(Map<String, Object> map);

	public List<User> getsc(String name);

	public int usernum(Date rstime);

	public List<User> allUsers();

	public void updateuser(User user);

	public void tianjia(User user);

	public void deleteuser(String username);

	public int usertongji(String date);

	public User getid(int id);
}
