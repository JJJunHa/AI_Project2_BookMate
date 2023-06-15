package com.human.springboot.BoardController;


import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;




@Mapper
public interface boardDAO {
	ArrayList<boardDTO> bList();
	boardDTO bView(int x1);
	boardDTO bViews(int x1);
	void bInsert(String x1, String x2, String x3);
	void bUpdate(String B_TITLE, String B_CONTENT, int board_num);
	void bDelete(int x1);
	void tbcdel(int x1);
	void bRead(int board_num);
	ArrayList<boardDTO> bSearch(String x1, String x2);
	
	//댓글
	void bcInsert(String x1, String x2, int x3);
	ArrayList<boardDTO> comment(int x1);
	void bcdel(int x1);

}
