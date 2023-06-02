package com.human.springboot.MypageController;

import lombok.Data;

@Data
public class POSTDTO {
	
	String id;
	
	
	
	// 나의 게시글 부분
	int board_num;
	String btitle;
	String bcontent;
	String b_writer;
	String b_create_date;
	String b_update_date;
	int b_rcount;
	
	
	
	// 나의 댓글 부분
	int Bcoment_num;
	String BC_writer;
	String BC_create_date;
	String BC_update_date;
	String BC_content;
}
