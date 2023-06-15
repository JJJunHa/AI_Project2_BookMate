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
	// mypage에서 cart에 있는지 찾기
	int MyPageCartFind(String id, int book_num);
	
	// mypage에서 cart로 insert 하기
	void MyPageAddCart(String id, int book_num, int qty);
	
	// 책 상품 
	ArrayList<orderedDTO> selectDelInfo(String x1);
	
	// 리뷰 관련 part
	orderedDTO compareRev(String x1, int x2);
	
	// 주문 목록 갯수 불러오기
	int count_order(String id);
	// 주문 목록 불러오기
	ArrayList<orderedDTO> load_order(String id);
	
	// mypage에서 배송상태 확인 하기
	String check_status(String id, int order_num);
	// mypage에서 cart_num 찾기
	int order_delete_cart(String id, int order_num);
	// mypage에서 주문 취소하기
	void order_delete(String id, int order_num);
	// ordered_cart 주문 취소하기
	void order_delete1(String o_id, int o_cart_num);
}
