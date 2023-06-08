package com.human.springboot.ReviewController;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewDAO {
	void insert_review(String id, String rev_title, int rev_rating, String rev_content);
}
