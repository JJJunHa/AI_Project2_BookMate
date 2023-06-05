package com.human.springboot.BoardController;

import lombok.Data;

@Data
public class boardDTO {
	int board_num;
	String B_TITLE;
	String B_CONTENT;
	String B_CREATE_DATE;
	String B_UPDATE_DATE;
	int B_RCOUNT;
	String ID;
	
	//댓글
	int bcontent_num;
	String bc_create_date;
	String bc_update_date;
	String bc_content;


}
