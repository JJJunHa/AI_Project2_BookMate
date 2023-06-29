package com.human.springboot.MainController;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MainDAO {
	ArrayList<MainDTO> bookList();
	ArrayList<MainDTO> emotionBookList(String emotion);
	ArrayList<MainDTO> genreBookList(String genre);
	ArrayList<MainDTO> gradeBookList(String genre,float grade);
	ArrayList<MainDTO> priceBookList(String genre,float grade,int price);
	ArrayList<MainDTO> selectWord(String word);
	ArrayList<MainDTO> ageBookList(int num);
	

}
