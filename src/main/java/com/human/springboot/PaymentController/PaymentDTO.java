package com.human.springboot.PaymentController;

import lombok.Data;

@Data
public class PaymentDTO {
	int order_num;
	String order_date;
	int cart_num;
	String id;
	String email;
	String zip_code;
	String address;
	String mobile;
	String address1;
	String address2;
	String address3;
	String name;
	String book_cover;
	String book_name;
	int book_price;
	int book_num;
	int qty;
}
