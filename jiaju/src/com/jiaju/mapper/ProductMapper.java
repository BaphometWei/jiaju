package com.jiaju.mapper;

import java.util.List;
import java.util.Map;

import com.jiaju.pojo.Product;

public interface ProductMapper {
	public List<Product> list();

	public List<Product> allProduct();

	public List<Product> listProduct(Map<String, Object> map);

	public List<Product> searchProduct(Product p);

	public List<Product> upprice(Map<String, Object> map);

	public List<Product> downprice(Map<String, Object> map);

	public Product productdetail(int id);

	public void updatenum(Product product);

	public void updateproduct(Product p);

	public void updateimage(Map<String, Object> map);

	public void addproduct(Product p);
}
