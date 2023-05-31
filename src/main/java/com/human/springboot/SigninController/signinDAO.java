package com.human.springboot.SigninController;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface signinDAO {
	ArrayList<signinDTO> confirmId();
	void doInsert(String Id, String pwd, String name,String email,String zip_code,String address, String mobile, String birth, String regdate);
}
