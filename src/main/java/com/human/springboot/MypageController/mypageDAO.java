package com.human.springboot.MypageController;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface mypageDAO {
	
	// 회원정보수정
	ArrayList<mypageDTO> selectMy(String x1);
	mypageDTO showAdr(String x1);
	mypageDTO showMob(String x1);
	mypageDTO showBir(String x1);
	void updateMy(String id, String id2, String pwd, String name, String email, String zip_code, String address,String mobile, String birth);
	
	
	
	// 나의 게시글 
	ArrayList<POSTDTO> selectPlist(String x1);
	POSTDTO showPlist(String x1);
	void Pread(String x1);
	POSTDTO QviewList(int x1);
	void Qread(int board_num);
	
	
	
	// 나의 댓글
	ArrayList<POSTDTO> myComment(String x1);	
	POSTDTO selectBordNum(String x1);
	
	
	
	// 나의 기부
	ArrayList<POSTDTO> myDonation(String x1);
	
	
	
	/// 주문 내역 ///
	// mypage에서 cart로 insert 하기
	void MyPageAddCart(String id, int book_num, int qty);
	
	// 책 상품 
	ArrayList<orderedDTO> selectDelInfo(String x1);
	
	// 리뷰 관련 part
	orderedDTO compareRev(String x1, int x2);
	
}
