package com.human.springboot.MypageController;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.human.springboot.BoardController.boardDTO;

@Mapper
public interface C_BoardDAO {
	ArrayList<boardDTO> bList();
	boardDTO bView(int x1);
	boardDTO QviewList(int x1);
	void bInsert(String x1, String x2, String x3);
	void bUpdate(String B_TITLE, String B_CONTENT, int board_num);
	void bDelete(int x1);
	void Qread(int board_num);
	ArrayList<boardDTO> bSearch(String x1, String x2);
}
