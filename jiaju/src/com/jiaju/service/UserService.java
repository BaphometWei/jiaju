package com.jiaju.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.jiaju.pojo.User;

public interface UserService {
	User login(User user);

	void register(User user);

	User huoqu(User user);

	void udi(Map<String, Object> map);

	List<User> getsc(String name);

	int usernum(Date rstime);

	List<User> allUsers();

	void updateuser(User user);

	void tianjia(User user);

	void deleteuser(String username);

	int usertongji(String date);

	User getid(int id);
}
