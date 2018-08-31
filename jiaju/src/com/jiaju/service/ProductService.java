package com.jiaju.service;

import java.util.List;
import java.util.Map;

import com.jiaju.pojo.Product;

public interface ProductService {
	List<Product> list();

	List<Product> allProduct();

	List<Product> listProduct(Map<String, Object> map);

	List<Product> searchProduct(Product p);

	List<Product> upprice(Map<String, Object> map);

	List<Product> downprice(Map<String, Object> map);

	Product productdetail(int id);

	void updatenum(Product product);

	void updateproduct(Product p);

	void updateimage(Map<String, Object> map);

	void addproduct(Product p);
}
