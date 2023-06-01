package com.human.springboot.MainController;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MainDAO {
	ArrayList<MainDTO> bookList();
	ArrayList<MainDTO> emotionBookList(String emotion);
	ArrayList<MainDTO> genreBookList(String emotion);
	

}
