package com.human.springboot.AdminController;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;





@Mapper
public interface AdminDAO {
	///상품
	ArrayList<AdminDTO> prolist();
	ArrayList<AdminDTO> book_nameCheck();
	void newProduct(String x1, int x2, String x3, String x4, String x5, String x6, int x7, String x8, String x9);
	//---
		void newUrl(String x1,String x2);
	//----
		void newUrlC(String x1,String x2);
		//--------------------
		AdminDTO viewPro(int x1);
		////---------------------------------------
		void updatePro(int x1, String x2, int x3, String x4, String x5, String x6, String x7, int x8, String x9, String x10);
		//---
			void updateUrl(String x1, int x2);
		//----
			void updateUrlC(String x1, int x2);
			//----
			void proDelete(int x1);
	////-------------------------
			ArrayList<AdminDTO> pSearch(String x1, String x2);
	//회원
			ArrayList<AdminDTO> memlist();
			///----------------
			void mcdel(String x1);
			void model(String x1);
			void mpdel(String x1);
			void mrdel(String x1);
			void mbdel(String x1);
			void mbcdel(String x1);
			void mdel(String x1);
			
			ArrayList<AdminDTO> mSearch(String x1, String x2);
	//리뷰
			ArrayList<AdminDTO> revlist();
			void reviewDel(int x1);
			ArrayList<AdminDTO> rSearch(String x1, String x2);
//-----------------------------------------------------------
	//주문
			ArrayList<AdminDTO> orlist();
			ArrayList<AdminDTO> dorder(String x1, String x2);
			void delivery(String x1, String x2, int x3);
			void oreviewDel(int x1, String x2);
			void ordered_cart(int x1, String x2);
			void payment(int x1, String x2);
			ArrayList<AdminDTO> oSearch(String x1, String x2);
}
