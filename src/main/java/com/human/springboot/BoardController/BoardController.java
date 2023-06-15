package com.human.springboot.BoardController;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class BoardController {

	@Autowired
	private boardDAO bdao;
	
//	게시판 목록
	@GetMapping("/board")
	public String bList(Model model) {
		ArrayList<boardDTO> bList= bdao.bList();
		model.addAttribute("bl",bList);
		return "board";
	}
	//  게시글 검색
	@GetMapping("/board/search")
	public String bSearch(Model model, @RequestParam("type") String type, @RequestParam("keyword") String keyword) {
	    ArrayList<boardDTO> bSearch = bdao.bSearch(type, keyword);
	    model.addAttribute("bl", bSearch);
	    return "board";
	}
//  새글 창
	@GetMapping("/boardNew")
	public String boardNew() {
		return "boardNew";
	}
//  새글 쓰기
	@GetMapping("/boardNewa")
	public String boardNewa(HttpServletRequest req) {
		String ID=req.getParameter("ID");
		String B_title=req.getParameter("B_title");
		String B_content=req.getParameter("summernote");
		bdao.bInsert(ID,B_title,B_content);
		return "redirect:/board";
	}
//  게시글 보기	
	@GetMapping("/boardView/{board_num}")
    public String boardView(@PathVariable("board_num") int board_num, Model model) {
		boardDTO bView=bdao.bView(board_num);
		bdao.bRead(board_num);
		model.addAttribute("bView",bView);
        return "boardView";
    }
//  게시글 수정창 이동 	
	@GetMapping("/boardUpdate/{board_num}")
    public String bViews(@PathVariable("board_num") int board_num, Model model) {
		boardDTO bViews=bdao.bViews(board_num);
		model.addAttribute("bViews",bViews);
        return "boardUpdate";
    }
//  게시글 수정	
	@PostMapping("/boardModify")
    public String boardModify(HttpServletRequest req, @RequestParam("board_num") int boardNum) {
		String B_title=req.getParameter("B_title");
		String B_content=req.getParameter("summernote");
		int board_num=Integer.parseInt(req.getParameter("board_num"));
		bdao.bUpdate(B_title,B_content,board_num);
		return "redirect:/board";
    }
//  게시글 삭제	
	@GetMapping("/bDelete/{board_num}")
	public String Qdelete(@PathVariable("board_num") int board_num) {
		bdao.tbcdel(board_num);
		bdao.bDelete(board_num);
		return "redirect:/board";
	}
//댓글 작성
	@PostMapping("/bcInsert")
	@ResponseBody
	public String bcInsert(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String id=(String) session.getAttribute("id");
		String content=req.getParameter("BC_content");
		int board_num=Integer.parseInt(req.getParameter("board_num"));
	
		bdao.bcInsert(content,id,board_num);
		
		
		return "board";
	}
//댓글 목록
	@PostMapping("/selectBC")
	@ResponseBody
	public String selectBC(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String id=(String) session.getAttribute("id");
		String board_num=req.getParameter("board_num");
		ArrayList<boardDTO> comment = bdao.comment(Integer.parseInt(board_num));
		JSONArray ja = new JSONArray();
		for(int i=0; i<comment.size(); i++) {
			
			JSONObject jo = new JSONObject();
			jo.put("id", comment.get(i).getID());
			jo.put("bc_create_date", comment.get(i).getBc_create_date());
			jo.put("bc_content", comment.get(i).getBc_content());
			jo.put("bcontent_num", comment.get(i).getBcontent_num());
			if (id.equals(comment.get(i).getID())||id.equals("bookmate")) {
	            jo.put("check", "check");
	        }
			
			
			
			ja.put(jo);
		}
		return ja.toString();
	}
//댓글 삭제

	@PostMapping("/bcdel")
	@ResponseBody
	public String bcdel(HttpServletRequest req, Model model) {
		String num=req.getParameter("num");
		bdao.bcdel(Integer.parseInt(num));
		
		String box="";
		
		return box;
	}
}
