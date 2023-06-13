package com.human.springboot.PaymentController;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PaymentDAO {
	PaymentDTO selectShip(String id);
	void insertOrderCart(int cart_num, int qty, String id, int book_num);
	void insertPayment(int cart_num, String id, String coment,String payWay,String address,String mobile,String name,String price);
}
