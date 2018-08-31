package com.jiaju.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiaju.mapper.ProductMapper;
import com.jiaju.pojo.Product;
import com.jiaju.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	ProductMapper productMapper;

	public List<Product> list() {
		// TODO Auto-generated method stub
		return productMapper.list();
	}

	public List<Product> allProduct() {
		return productMapper.allProduct();
	}

	public List<Product> listProduct(Map<String, Object> map) {

		return productMapper.listProduct(map);
	}

	public List<Product> searchProduct(Product p) {
		return productMapper.searchProduct(p);
	}

	public List<Product> upprice(Map<String, Object> map) {

		return productMapper.upprice(map);
	}

	public List<Product> downprice(Map<String, Object> map) {

		return productMapper.downprice(map);
	}

	public Product productdetail(int id) {
		return productMapper.productdetail(id);
	}

	public void updatenum(Product product) {
		productMapper.updatenum(product);
	}

	public void updateproduct(Product p) {
		productMapper.updateproduct(p);
	}

	public void updateimage(Map<String, Object> map) {
		productMapper.updateimage(map);
	}

	public void addproduct(Product p) {
		productMapper.addproduct(p);
	}
}
