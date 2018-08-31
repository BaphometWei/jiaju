package com.jiaju.service.impl;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiaju.mapper.UserMapper;
import com.jiaju.pojo.User;
import com.jiaju.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserMapper userMapper;

	public User login(User user) {
		return userMapper.login(user);
	}

	public void register(User user) {
		userMapper.register(user);
	}

	public User huoqu(User user) {
		return userMapper.huoqu(user);
	}

	public void udi(Map<String, Object> map) {
		userMapper.udi(map);
	}

	public List<User> getsc(String name) {
		return userMapper.getsc(name);
	}

	public int usernum(Date rstime) {
		return userMapper.usernum(rstime);
	}

	public List<User> allUsers() {
		return userMapper.allUsers();
	}

	public void updateuser(User user) {
		userMapper.updateuser(user);
	}

	public void tianjia(User user) {
		userMapper.tianjia(user);
	}

	public void deleteuser(String username) {
		userMapper.deleteuser(username);
	}

	public int usertongji(String date) {
		return userMapper.usertongji(date);
	}

	public User getid(int id) {
		return userMapper.getid(id);
	}
}
