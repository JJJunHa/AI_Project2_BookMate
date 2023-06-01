package com.human.springboot.AdminController;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface AdminDAO {
	ArrayList<AdminDTO> prolist();
	void newProduct(String x1, int x2, String x3, String x4, String x5, String x6, int x7, String x8, String x9);
	//---
		void newUrl(String x1,String x2);
	//----
		void newUrlC(String x1,String x2);
}
