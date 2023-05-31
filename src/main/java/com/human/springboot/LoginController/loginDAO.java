package com.human.springboot.LoginController;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface loginDAO {
	ArrayList<loginDTO> L_Users();
}
