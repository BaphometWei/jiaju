package com.jiaju.service;

public interface ShoppingCartService {
	int selectsc(String name, String[] checks, String[] nums);

	void updatenum(String name, String id, String num);

	void deletesc(String name, String id);

	void addsc(int uid, int pid, int num);

	int selectscnum(String name, String pid);
}
