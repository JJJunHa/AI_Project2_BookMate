package com.human.springboot.AdminController;

import java.io.File;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;


@Controller
public class AdminController {

	@Autowired
	private AdminDAO adao;
	String name="";
	int num;
	//상품관리
	
	 /*상품목록*/
	@GetMapping("/prolist")
	public String prolist(Model model) {
		ArrayList<AdminDTO> prolist= adao.prolist();
		model.addAttribute("pl",prolist);
		return "adminProduct";
	}
	
	 /*상품등록페이지*/
		@GetMapping("/adminNew")
		public String adminNew(Model model) {
			return "adminNew";
		}
		//상품등록-상품명, 가격, 장르, 책소개, 작가, 출판일, 별점, 감정, 책요약
		@PostMapping("/newProduct")
		@ResponseBody
		public String newProduct(HttpServletRequest req) {
			String retval="ok";
//			try {
			String book_name=req.getParameter("book_name");
			int book_price=Integer.parseInt(req.getParameter("book_price"));
			String book_genre=req.getParameter("book_genre");
			String book_content=req.getParameter("book_content");
			String author=req.getParameter("author");
			String publication=req.getParameter("publication");
			int rating=Integer.parseInt(req.getParameter("rating"));
			String emotion=req.getParameter("emotion");
			String book_summary=req.getParameter("book_summary");
			name=book_name;
			adao.newProduct(book_name,book_price,book_genre,book_content,author,publication,rating,emotion,book_summary);
//		} catch(Exception e) {
//			return "fail";
//		}
			return retval;
	}
//		상품등록- 책 커버 img
		@PostMapping("/newfile")
		   @ResponseBody
		   public String doUpload(HttpServletRequest hsr, MultipartFile file) {
			System.out.println("hi");
		      try {
		         String fileName = file.getOriginalFilename();
		         // webapp 폴더까지의 경로 정보를 가져온다.
		         String book_cover="/img/" + fileName;
		         String folder2 = "C:\\Users\\admin\\Documents\\BookMate\\src\\main\\resources\\static";
		         file.transferTo(new File(folder2 + book_cover)); 
		         adao.newUrl(book_cover,name);	
		      } catch (Exception ex) {
		         System.out.println(ex.getMessage());
		      }

		      return "ok";
		   }
//		상품등록-상세 설명 img
		@PostMapping("/newfile2")
		   @ResponseBody
		   public String doUpload2(HttpServletRequest hsr, MultipartFile book_detail_file) {
			System.out.println("hi");
		      try {
		         String fileName = book_detail_file.getOriginalFilename();
		         // webapp 폴더까지의 경로 정보를 가져온다.
		         String book_detail="/img/" + fileName;
		         String folder = "C:\\Users\\admin\\Documents\\BookMate\\src\\main\\resources\\static";
		         book_detail_file.transferTo(new File(folder + book_detail)); 
		         adao.newUrlC(book_detail,name);	
		      } catch (Exception ex) {
		         System.out.println(ex.getMessage());
		      }

		      return "ok";
		   }
}
