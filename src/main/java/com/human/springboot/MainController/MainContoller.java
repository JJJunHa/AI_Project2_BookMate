package com.human.springboot.MainController;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class MainContoller {
	@Autowired
	private MainDAO maindao;
	
	@GetMapping("/main")
    public String showMain(HttpServletRequest req,Model model) {
		ArrayList<MainDTO> bookList = maindao.bookList();
		String bookname="";
		String bookimage="";
		for(int i=0; i<bookList.size(); i++) {
			bookname=bookList.get(i).BOOK_NAME;
			bookimage=bookList.get(i).BOOK_COVER;
		}
		model.addAttribute("prod",bookimage);
        return "main";
    }
	
	@PostMapping("/selectpRe")
	@ResponseBody
	public String selectpRe(HttpServletRequest req) {
    	
    	
    	
    	ArrayList<MainDTO> bookList = maindao.bookList();
    	JSONArray ja = new JSONArray();
        for (int i = 0; i < bookList.size(); i++) {
            JSONObject jo = new JSONObject();
            jo.put("BOOK_NUM", bookList.get(i).getBOOK_NUM());
            jo.put("BOOK_NAME", bookList.get(i).getBOOK_NAME());
            jo.put("BOOK_PRICE", bookList.get(i).getBOOK_PRICE());
            jo.put("BOOK_GENRE", bookList.get(i).getBOOK_GENRE());
            jo.put("AUTHOR", bookList.get(i).getAUTHOR());
            jo.put("BOOK_COVER", bookList.get(i).getBOOK_COVER());
            jo.put("BOOK_CONTENT", bookList.get(i).getBOOK_CONTENT());
            jo.put("PUBLICATION", bookList.get(i).getPUBLICATION());
            
            ja.put(jo);
        }
        return ja.toString();
	}
	
	@PostMapping("/suggestion")
	@ResponseBody
	public String suggestion(HttpServletRequest req) {
    	
		String emotion=req.getParameter("emotion")+"";
		if(emotion.equals("우울")||emotion.equals("우울")) {
			emotion="슬픔";
		}
		System.out.println(emotion);
    	
    	ArrayList<MainDTO> emotionBookList = maindao.emotionBookList(emotion);
    	JSONArray ja = new JSONArray();
        for (int i = 0; i < emotionBookList.size(); i++) {
            JSONObject jo = new JSONObject();
            jo.put("BOOK_NUM", emotionBookList.get(i).getBOOK_NUM());
            jo.put("BOOK_NAME", emotionBookList.get(i).getBOOK_NAME());
            jo.put("BOOK_PRICE", emotionBookList.get(i).getBOOK_PRICE());
            jo.put("BOOK_GENRE", emotionBookList.get(i).getBOOK_GENRE());
            jo.put("AUTHOR", emotionBookList.get(i).getAUTHOR());
            jo.put("BOOK_COVER", emotionBookList.get(i).getBOOK_COVER());
            jo.put("BOOK_CONTENT", emotionBookList.get(i).getBOOK_CONTENT());
            jo.put("PUBLICATION", emotionBookList.get(i).getPUBLICATION());
            
            ja.put(jo);
        }
        return ja.toString();
	}
	
	@PostMapping("/genreSelection")
	@ResponseBody
	public String genreSelection(HttpServletRequest req) {
    	
		String genre=req.getParameter("genre")+"";
		System.out.println(genre);
    	
    	ArrayList<MainDTO> genrenBookList = maindao.genreBookList(genre);
    	JSONArray ja = new JSONArray();
        for (int i = 0; i < genrenBookList.size(); i++) {
            JSONObject jo = new JSONObject();
            jo.put("BOOK_NUM", genrenBookList.get(i).getBOOK_NUM());
            jo.put("BOOK_NAME", genrenBookList.get(i).getBOOK_NAME());
            jo.put("BOOK_PRICE", genrenBookList.get(i).getBOOK_PRICE());
            jo.put("BOOK_GENRE", genrenBookList.get(i).getBOOK_GENRE());
            jo.put("AUTHOR", genrenBookList.get(i).getAUTHOR());
            jo.put("BOOK_COVER", genrenBookList.get(i).getBOOK_COVER());
            jo.put("BOOK_CONTENT", genrenBookList.get(i).getBOOK_CONTENT());
            jo.put("PUBLICATION", genrenBookList.get(i).getPUBLICATION());
            
            ja.put(jo);
        }
        return ja.toString();
	}
	
	
	@GetMapping("/")
    public String showchat() {
        return "chat5";
    }
	@GetMapping("/1")
    public String showchat1() {
        return "chat";
    }
	@GetMapping("/2")
    public String showchat2() {
        return "chat2";
    }
	@GetMapping("/3")
    public String showchat3() {
        return "chat3";
    }
	@GetMapping("/4")
    public String showchat4() {
        return "chat4";
    }
}
