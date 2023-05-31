package com.human.springboot.SigninController;

import lombok.Data;

@Data
public class signinDTO {
	String Id;
	String pwd;
	String name;
	String email;
	String zip_code;
	String Address; 
	String mobile;
	String birth;
	String regdate;
}
