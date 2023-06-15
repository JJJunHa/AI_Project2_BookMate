package com.human.springboot.PaymentController;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;



@Mapper
public interface PaymentDAO {
	PaymentDTO selectShip(String id);
	ArrayList<PaymentDTO> load_singleCart(String id);
	void delete_singleCart(int cart_num);
	void Alldelete_singleCart(String id);
	void singleInsert_cart(String m_id, int qty, int book_num);
	void insertOrderCart(int cart_num, int qty, String id, int book_num);
	void insertPayment(int cart_num, String id, String coment,String payWay,String address,String mobile,String name,String price);
}
