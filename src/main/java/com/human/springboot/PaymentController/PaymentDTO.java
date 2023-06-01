package com.human.springboot.PaymentController;

import lombok.Data;

@Data
public class PaymentDTO {
	int order_num;
	String order_date;
	int cart_num;
	String id;
}
