package com.human.springboot.BoardController;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;

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
		bdao.bDelete(board_num);
		return "redirect:/board";
	}
//  게시글 검색

}
