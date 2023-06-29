package com.human.springboot.MainController;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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
	
	@GetMapping("/apikey")
	  public ResponseEntity<String> getApiKey() {
	    String apiKey = "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";
	    return ResponseEntity.ok(apiKey);
	  }
	@GetMapping("/")
	public String Main2() {
		
		return "redirect:/main";
    }
	
	@GetMapping("/main")
    public String showMain(HttpServletRequest req,Model model) {
		ArrayList<MainDTO> bookList = maindao.bookList();
		String bookname="";
		String bookimage="";
		/*
		 * String A_bookname; String A_birth; String A_emotion; String A_genre; int[]
		 * numbers = {10, 1, 1};
		 */
		
		/*
		 * for(int i=0; i<ageBookList.size(); i++) {
		 * A_bookname=ageBookList.get(i).BOOK_NAME; A_birth=ageBookList.get(i).BIRTH;
		 * A_emotion=ageBookList.get(i).EMOTION; A_genre=ageBookList.get(i).BOOK_GENRE;
		 * 
		 * }
		 */
		
		for(int i=0; i<bookList.size(); i++) {
			bookname=bookList.get(i).BOOK_NAME;
			bookimage=bookList.get(i).BOOK_COVER;
		}
		/* model.addAttribute("prod2",numbers); */
		model.addAttribute("prod",bookimage);
        return "main";
    }
	
	@PostMapping("/selectWord")
	@ResponseBody
	public String selectWord(HttpServletRequest req) {
    	String word=req.getParameter("word");
 
    	
    	ArrayList<MainDTO> selectWord = maindao.selectWord(word);
    	JSONArray ja = new JSONArray();
        for (int i = 0; i < selectWord.size(); i++) {
            JSONObject jo = new JSONObject();
            jo.put("BOOK_NUM", selectWord.get(i).getBOOK_NUM());
            jo.put("BOOK_NAME", selectWord.get(i).getBOOK_NAME());
            jo.put("BOOK_PRICE", selectWord.get(i).getBOOK_PRICE());
            jo.put("BOOK_GENRE", selectWord.get(i).getBOOK_GENRE());
            jo.put("AUTHOR", selectWord.get(i).getAUTHOR());
            jo.put("BOOK_COVER", selectWord.get(i).getBOOK_COVER());
            jo.put("BOOK_CONTENT", selectWord.get(i).getBOOK_CONTENT());
            jo.put("PUBLICATION", selectWord.get(i).getPUBLICATION());
            jo.put("BOOK_SUMMARY", selectWord.get(i).getBOOK_SUMMARY());
            
            ja.put(jo);
        }
        return ja.toString();
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
            jo.put("BOOK_SUMMARY", bookList.get(i).getBOOK_SUMMARY());
            
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
		if(emotion.equals("기쁨")||emotion.equals("즐거움")) {
			emotion="행복";
		}
		if(emotion.equals("스트레스")||emotion.equals("화가남")) {
			emotion="분노";
		}

    	
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
            jo.put("BOOK_SUMMARY", emotionBookList.get(i).getBOOK_SUMMARY());
            ja.put(jo);
        }
        return ja.toString();
	}
	
	@PostMapping("/priceSelection")
	@ResponseBody
	public String priceSelection(HttpServletRequest req) {
    	
		String genre = req.getParameter("genre")+"";
		float grade = Float.parseFloat(req.getParameter("grade").replace("점", ""));
		int price = Integer.parseInt(req.getParameter("price").replace("원", ""));

    	
    	ArrayList<MainDTO> priceBookList = maindao.priceBookList(genre,grade,price);
    	JSONArray ja = new JSONArray();
        for (int i = 0; i < priceBookList.size(); i++) {
            JSONObject jo = new JSONObject();
            jo.put("BOOK_NUM", priceBookList.get(i).getBOOK_NUM());
            jo.put("BOOK_NAME", priceBookList.get(i).getBOOK_NAME());
            jo.put("BOOK_PRICE", priceBookList.get(i).getBOOK_PRICE());
            jo.put("BOOK_GENRE", priceBookList.get(i).getBOOK_GENRE());
            jo.put("AUTHOR", priceBookList.get(i).getAUTHOR());
            jo.put("BOOK_COVER", priceBookList.get(i).getBOOK_COVER());
            jo.put("BOOK_CONTENT", priceBookList.get(i).getBOOK_CONTENT());
            jo.put("PUBLICATION", priceBookList.get(i).getPUBLICATION());
            jo.put("BOOK_SUMMARY", priceBookList.get(i).getBOOK_SUMMARY());

            
            ja.put(jo);
        }
        return ja.toString();
	}
	
	
	@PostMapping("/genreSelection")
	@ResponseBody
	public String genreSelection(HttpServletRequest req) {
    	
		String genre=req.getParameter("genre")+"";

    	
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
            jo.put("BOOK_SUMMARY", genrenBookList.get(i).getBOOK_SUMMARY());
            ja.put(jo);
        }
        return ja.toString();
	}
	
	@PostMapping("/gradeSelection")
	@ResponseBody
	public String gradeSelection(HttpServletRequest req) {
    	
		String genre=req.getParameter("genre")+"";
		float grade = Float.parseFloat(req.getParameter("grade").replace("점", ""));
    	
    	ArrayList<MainDTO> gradeBookList = maindao.gradeBookList(genre,grade);
    	JSONArray ja = new JSONArray();
        for (int i = 0; i < gradeBookList.size(); i++) {
            JSONObject jo = new JSONObject();
            jo.put("BOOK_NUM", gradeBookList.get(i).getBOOK_NUM());
            jo.put("BOOK_NAME", gradeBookList.get(i).getBOOK_NAME());
            jo.put("BOOK_PRICE", gradeBookList.get(i).getBOOK_PRICE());
            jo.put("BOOK_GENRE", gradeBookList.get(i).getBOOK_GENRE());
            jo.put("AUTHOR", gradeBookList.get(i).getAUTHOR());
            jo.put("BOOK_COVER", gradeBookList.get(i).getBOOK_COVER());
            jo.put("BOOK_CONTENT", gradeBookList.get(i).getBOOK_CONTENT());
            jo.put("PUBLICATION", gradeBookList.get(i).getPUBLICATION());
            jo.put("BOOK_SUMMARY", gradeBookList.get(i).getBOOK_SUMMARY());
            ja.put(jo);
        }
        return ja.toString();
	}
	
	
	
	@GetMapping("/5")
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
