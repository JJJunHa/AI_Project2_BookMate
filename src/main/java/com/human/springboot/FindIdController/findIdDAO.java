package com.human.springboot.FindIdController;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface findIdDAO {
	ArrayList<String> useemail(String a, String b);
	ArrayList<String> usephone(String a, String b);
}
