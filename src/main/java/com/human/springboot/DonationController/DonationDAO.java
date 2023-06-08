package com.human.springboot.DonationController;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DonationDAO {
	
	// 회원 정보 가져오기
	ArrayList<DonationDTO> load_personInfo(String id);
	void insert_donation(String dona_name, int dona_qty, String dona_way, String id);
}
