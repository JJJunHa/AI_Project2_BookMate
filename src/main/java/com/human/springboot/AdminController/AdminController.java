package com.human.springboot.AdminController;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.human.springboot.SigninController.signinDTO;

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
		//도서 중복 체크
		@PostMapping("/book_nameCheck")
		@ResponseBody
		public String book_nameCheck(HttpServletRequest req) {
			
			String book_name= req.getParameter("book_name");
						
			ArrayList<AdminDTO> book_nameCheck = adao.book_nameCheck();
			for(int i=0;i<book_nameCheck.size();i++) {
				if(book_name.equals(book_nameCheck.get(i).getBook_name())) {
					return "이미 존재하는 도서입니다";
				}
			}
			
			return "등록 가능한 도서입니다";
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
//	상품등록- 책 커버 img
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
		
		//상품보기
		 // 제품 수정페이지
		@GetMapping("/adminUpdate/{seq}")
		public String detail(@PathVariable("seq") int seq, Model model) {
		adao.viewPro(seq);
		AdminDTO pro=adao.viewPro(seq);
		model.addAttribute("pro", pro);
		return "adminUpdate";
		}
//		상품수정하기
		@PostMapping("/updatePro")
		public String updatePro(HttpServletRequest req, Model model) {
			int book_num=Integer.parseInt(req.getParameter("book_num"));
			String book_name=req.getParameter("book_name");
			int book_price=Integer.parseInt(req.getParameter("book_price"));
			String book_genre=req.getParameter("book_genre");
			String book_content=req.getParameter("book_content");
			String author=req.getParameter("author");
			String publication=req.getParameter("publication");
			int rating=Integer.parseInt(req.getParameter("rating"));
			String emotion=req.getParameter("emotion");
			String book_summary=req.getParameter("book_summary");
			num=book_num;
			adao.updatePro(book_num, book_name, book_price, book_genre, book_content, author, publication, rating, emotion, book_summary);
			return "redirect:/prolist";
		}
//		상품수정 책 커버 img
		@PostMapping("updatefile")
		   @ResponseBody
		   public String updatefile(HttpServletRequest hsr, MultipartFile file) {
			System.out.println("hi");
		      try {
		         String fileName = file.getOriginalFilename();
		         // webapp 폴더까지의 경로 정보를 가져온다.
		         String book_cover="/img/" + fileName;
		         String folder2 = "C:\\Users\\admin\\Documents\\BookMate\\src\\main\\resources\\static";
		         file.transferTo(new File(folder2 + book_cover)); 
		         adao.updateUrl(book_cover,num);	
		      } catch (Exception ex) {
		         System.out.println(ex.getMessage());
		      }

		      return "ok";
		   }
//		상품수정 상세설명 img
		@PostMapping("/updatefile2")
		   @ResponseBody
		   public String updatefile2(HttpServletRequest hsr, MultipartFile prod_content_file) {
			System.out.println("hi");
		      try {
		         String fileName = prod_content_file.getOriginalFilename();
		         // webapp 폴더까지의 경로 정보를 가져온다.
		         String book_detail="/img/" + fileName;
		         String folder = "C:\\Users\\admin\\Documents\\BookMate\\src\\main\\resources\\static";
		         prod_content_file.transferTo(new File(folder + book_detail)); 
		         adao.updateUrlC(book_detail,num);	
		      } catch (Exception ex) {
		         System.out.println(ex.getMessage());
		      }

		      return "ok";
		   }
//		상품삭제
		@GetMapping("/productDelete/{book_num}")
		public String proDelete(@PathVariable("book_num") int book_num) {
			adao.proDelete(book_num);
			return "redirect:/prolist";
		}
//    상품검색
		@PostMapping("/booksearch")
		public String bSearch(Model model, @RequestParam("type") String type, @RequestParam("keyword") String keyword) {
		    ArrayList<AdminDTO> pSearch = adao.pSearch(type, keyword);
		    model.addAttribute("pl", pSearch);
		    return "adminProduct";
		}

		//회원관리
		 /*회원목록*/
		@GetMapping("/memlist")
		public String memlist(Model model) {
			ArrayList<AdminDTO> memlist= adao.memlist();
			model.addAttribute("ml",memlist);
			return "adminMember";
		}
		//회원검색
		@PostMapping("/member/search")
		public String mSearch(Model model, @RequestParam("type") String type, @RequestParam("keyword") String keyword) {
		    ArrayList<AdminDTO> mSearch = adao.mSearch(type, keyword);
		    model.addAttribute("ml", mSearch);
		    return "adminMember";
		}
		//회원삭제
		@PostMapping("/memberDel")
		@ResponseBody
		public String memberDel(HttpServletRequest req) {
			String val="ok";
			try {
				String id=req.getParameter("id");
				adao.mcdel(id);
				adao.model(id);
				adao.mpdel(id);
				adao.mrdel(id);
				adao.mbdel(id);
				adao.mbcdel(id);
				adao.mdel(id);
			} catch(Exception e) {
				val="fail";
				e.printStackTrace();
				System.out.println(req.getParameter("id"));
			}
			return val;
		}
		
		
//		리뷰목록
		@GetMapping("/revlist")
		public String revlist(Model model) {
			ArrayList<AdminDTO> revlist= adao.revlist();
			model.addAttribute("rl",revlist);
			return "adminReview";
		}
//	리뷰삭제
		@PostMapping("/reviewDel")
		@ResponseBody
		public String reviewDel(HttpServletRequest req) {
			String val="ok";
			try {
				int id=Integer.parseInt(req.getParameter("id"));
				adao.reviewDel(id);
				
			} catch(Exception e) {
				val="fail";
				e.printStackTrace();
				System.out.println(req.getParameter("id"));
			}
			return val;
		}

		// 리뷰검색
		@PostMapping("/review/search")
		public String rSearch(Model model, @RequestParam("type") String type, @RequestParam("keyword") String keyword) {
			ArrayList<AdminDTO> rSearch = adao.rSearch(type, keyword);
			model.addAttribute("rl", rSearch);
			return "adminReview";
		}
//주문
		//주문 목록
		@GetMapping("/orlist")
		public String orlist(Model model) {
			ArrayList<AdminDTO> orlist= adao.orlist();
			model.addAttribute("ol",orlist);
			return "adminOrder";
		}
		//주문 상세
		@GetMapping("/dorder")
		public ResponseEntity<List<AdminDTO>> dorder(@RequestParam("id") String id, @RequestParam("price") String price) {
		    List<AdminDTO> dorder = adao.dorder(id, price);
		    if (dorder != null && !dorder.isEmpty()) {
		        return ResponseEntity.ok(dorder);
		    } else {
		        return ResponseEntity.notFound().build();
		    }
		}
		
		@PostMapping("/delivery")
		@ResponseBody
		public String delivery(HttpServletRequest req) {
		try {
			String status = req.getParameter("status");
			String id = req.getParameter("id");
			int order_num = Integer.parseInt(req.getParameter("order_num"));
			adao.delivery(status, id, order_num);
		} catch(Exception e) {
			System.out.println(req.getParameter("id"));
		}
			return "redirect:/adminOrder";
		}
		
//		주문삭제
			@PostMapping("/ordel")
			@ResponseBody
			public String ordel(HttpServletRequest req) {
				String val="ok";
				try {
					String id = req.getParameter("id");
					int order_num = Integer.parseInt(req.getParameter("order_num"));
					adao.oreviewDel(order_num, id);
					adao.ordered_cart(order_num, id);
					adao.payment(order_num, id);
					
				} catch(Exception e) {
					val="fail";
					e.printStackTrace();
					System.out.println(req.getParameter("id"));
				}
				return val;
			}
			//주문검색
			// 리뷰검색
			@PostMapping("/order/search")
			public String oSearch(Model model, @RequestParam("type") String type, @RequestParam("keyword") String keyword) {
				ArrayList<AdminDTO> oSearch = adao.oSearch(type, keyword);
				model.addAttribute("ol", oSearch);
				return "adminOrder";
			}
}
 
