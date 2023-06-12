package com.human.springboot.MypageController;

import lombok.Data;

@Data
public class POSTDTO {
	
	// 나의 게시글 부분
	int board_num; // board & board_comment 공용 변수
	String b_title;
	String b_content;
	String id; // board & board_comment & donation 공용 변수
	String b_create_date;
	String b_update_date;
	int b_rcount;
	
	
	
	// 나의 댓글 부분
	int bcontent_num;
//	String BC_writer;
	String BC_create_date;
	String BC_update_date;
	String BC_content;
	
	
	
	// 나의 기부 내역 부분
	int dona_num;
	String dona_name;
	int dona_qty;
	String dona_way;
	String dona_date;
}
