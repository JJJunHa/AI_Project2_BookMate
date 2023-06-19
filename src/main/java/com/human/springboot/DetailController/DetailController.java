package com.human.springboot.DetailController;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class DetailController {
	@Autowired
	private CategoryDAO cdao;
	
	/* category1 코미디 */
	@GetMapping("/category1")
	public String showCategory1(Model model) {
//		ArrayList<CategoryDTO> comedy_list = cdao.comedy_list();
//		model.addAttribute("comedy_list", comedy_list);
		 return "category1";
	}
	
	@PostMapping("/load_category1")
	@ResponseBody
	public String load_category1(HttpServletRequest req) {
		
		int page_num = Integer.parseInt(req.getParameter("pageNum"));
		ArrayList<CategoryDTO> comedy_list = cdao.comedy_list();
		int howmanyProd = comedy_list.size();
		int howmanyPages = (howmanyProd/5)+1;
		if(howmanyProd%5==0) {howmanyPages = howmanyPages-1;}

		JSONArray ja = new JSONArray();
		int start=(page_num-1)*5;
		int end=(page_num*5)-1;
		try {
			JSONObject jo = new JSONObject();
			jo.put("howmany", howmanyPages);
			ja.put(jo);
			for(int i=start; i<=end; i++) {
				if(i>=start && i<=end) {
				jo = new JSONObject();
				jo.put("book_cover", comedy_list.get(i).getBook_cover());
				jo.put("book_num", comedy_list.get(i).getBook_num());
				jo.put("book_name", comedy_list.get(i).getBook_name());
				jo.put("author", comedy_list.get(i).getAuthor());
				jo.put("publication", comedy_list.get(i).getPublication());
				jo.put("book_price", comedy_list.get(i).getBook_price());
				
				ja.put(jo);
				}
			}
		}catch (Exception e) {		
		}
		return ja.toString();
	}
	
	/* category2 로맨스 */
	@GetMapping("/category2")
	public String showCategory2(Model model) {
//		ArrayList<CategoryDTO> romance_list = cdao.romance_list();
//		model.addAttribute("romance_list", romance_list);
		 return "category2";
	}
	
	@PostMapping("/load_category2")
	@ResponseBody
	public String load_category2(HttpServletRequest req) {
		int page_num = Integer.parseInt(req.getParameter("pageNum"));
		ArrayList<CategoryDTO> romance_list = cdao.romance_list();
		int howmanyProd = romance_list.size();
		int howmanyPages = (howmanyProd/5)+1;
		if(howmanyProd%5==0) {howmanyPages = howmanyPages-1;}

		JSONArray ja = new JSONArray();
		int start=(page_num-1)*5;
		int end=(page_num*5)-1;
		try {
			JSONObject jo = new JSONObject();
			jo.put("howmany", howmanyPages);
			ja.put(jo);
			for(int i=start; i<=end; i++) {
				if(i>=start && i<=end) {
				jo = new JSONObject();
				jo.put("book_cover", romance_list.get(i).getBook_cover());
				jo.put("book_num", romance_list.get(i).getBook_num());
				jo.put("book_name", romance_list.get(i).getBook_name());
				jo.put("author", romance_list.get(i).getAuthor());
				jo.put("publication", romance_list.get(i).getPublication());
				jo.put("book_price", romance_list.get(i).getBook_price());
				
				ja.put(jo);
				}
			}
		}catch (Exception e) {		
		}
		return ja.toString();
	}
	
	/* category3 판타지 */
	@GetMapping("/category3")
	public String showCategory3(Model model) {
//		ArrayList<CategoryDTO> fantasy_list = cdao.fantasy_list();
//		model.addAttribute("fantasy_list", fantasy_list);
		 return "category3";
	}
	
	@PostMapping("/load_category3")
	@ResponseBody
	public String load_category3(HttpServletRequest req) {
		int page_num = Integer.parseInt(req.getParameter("pageNum"));
		ArrayList<CategoryDTO> fantasy_list = cdao.fantasy_list();
		int howmanyProd = fantasy_list.size();
		int howmanyPages = (howmanyProd/5)+1;
		if(howmanyProd%5==0) {howmanyPages = howmanyPages-1;}

		JSONArray ja = new JSONArray();
		int start=(page_num-1)*5;
		int end=(page_num*5)-1;
		try {
			JSONObject jo = new JSONObject();
			jo.put("howmany", howmanyPages);
			ja.put(jo);
			for(int i=start; i<=end; i++) {
				if(i>=start && i<=end) {
				jo = new JSONObject();
				jo.put("book_cover", fantasy_list.get(i).getBook_cover());
				jo.put("book_num", fantasy_list.get(i).getBook_num());
				jo.put("book_name", fantasy_list.get(i).getBook_name());
				jo.put("author", fantasy_list.get(i).getAuthor());
				jo.put("publication", fantasy_list.get(i).getPublication());
				jo.put("book_price", fantasy_list.get(i).getBook_price());
				
				ja.put(jo);
				}
			}
		}catch (Exception e) {		
		}
		return ja.toString();
	}
	
	/* category4 공포/스릴러/추리 */
	@GetMapping("/category4")
	public String showCategory4(Model model) {
//		ArrayList<CategoryDTO> mystery_list = cdao.mystery_list();
//		model.addAttribute("mystery_list", mystery_list);
		 return "category4";
	}
	
	@PostMapping("/load_category4")
	@ResponseBody
	public String load_category4(HttpServletRequest req) {
		int page_num = Integer.parseInt(req.getParameter("pageNum"));
		ArrayList<CategoryDTO> mystery_list = cdao.mystery_list();
		int howmanyProd = mystery_list.size();
		int howmanyPages = (howmanyProd/5)+1;
		if(howmanyProd%5==0) {howmanyPages = howmanyPages-1;}

		JSONArray ja = new JSONArray();
		int start=(page_num-1)*5;
		int end=(page_num*5)-1;
		try {
			JSONObject jo = new JSONObject();
			jo.put("howmany", howmanyPages);
			ja.put(jo);
			for(int i=start; i<=end; i++) {
				if(i>=start && i<=end) {
				jo = new JSONObject();
				jo.put("book_cover", mystery_list.get(i).getBook_cover());
				jo.put("book_num", mystery_list.get(i).getBook_num());
				jo.put("book_name", mystery_list.get(i).getBook_name());
				jo.put("author", mystery_list.get(i).getAuthor());
				jo.put("publication", mystery_list.get(i).getPublication());
				jo.put("book_price", mystery_list.get(i).getBook_price());
				
				ja.put(jo);
				}
			}
		}catch (Exception e) {		
		}
		return ja.toString();
	}
	
	/* category5 드라마 */
	@GetMapping("/category5")
	public String showCategory5(Model model) {
//		ArrayList<CategoryDTO> drama_list = cdao.drama_list();
//		model.addAttribute("drama_list", drama_list);
		 return "category5";
	}
	
	
	@PostMapping("/load_category5")
	@ResponseBody
	public String load_category5(HttpServletRequest req) {
		int page_num = Integer.parseInt(req.getParameter("pageNum"));
		ArrayList<CategoryDTO> drama_list = cdao.drama_list();
		int howmanyProd = drama_list.size();
		int howmanyPages = (howmanyProd/5)+1;
		if(howmanyProd%5==0) {howmanyPages = howmanyPages-1;}

		JSONArray ja = new JSONArray();
		int start=(page_num-1)*5;
		int end=(page_num*5)-1;
		try {
			JSONObject jo = new JSONObject();
			jo.put("howmany", howmanyPages);
			ja.put(jo);
			for(int i=start; i<=end; i++) {
				if(i>=start && i<=end) {
				jo = new JSONObject();
				jo.put("book_cover", drama_list.get(i).getBook_cover());
				jo.put("book_num", drama_list.get(i).getBook_num());
				jo.put("book_name", drama_list.get(i).getBook_name());
				jo.put("author", drama_list.get(i).getAuthor());
				jo.put("publication", drama_list.get(i).getPublication());
				jo.put("book_price", drama_list.get(i).getBook_price());
				
				ja.put(jo);
				}
			}
		}catch (Exception e) {		
		}
		return ja.toString();
	}
	
	// =================== detail_page =======================
	  
    // 제품 상세페이지
	@GetMapping("/detail/{seq}")
	public String dodetail(@PathVariable("seq") int seq, Model model) {
	model.addAttribute("num", seq);
	return "detail";
	}
	// 상세페이지 제품 load하기
	@PostMapping("/load_datail")
	@ResponseBody
	public String load_detail(HttpServletRequest req) {
		int book_num = Integer.parseInt(req.getParameter("book_num"));
		
		ArrayList<CategoryDTO> alBook = cdao.load_detail(book_num);
		JSONArray ja = new JSONArray();
		for(int i=0; i<alBook.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("book_name", alBook.get(i).getBook_name());
			jo.put("author", alBook.get(i).getAuthor());
			jo.put("publication", alBook.get(i).getPublication());
			jo.put("rating",alBook.get(i).getRating());
			jo.put("book_cover", alBook.get(i).getBook_cover());
			jo.put("book_price", alBook.get(i).getBook_price());
			jo.put("book_content", alBook.get(i).getBook_content());
			jo.put("book_detail", alBook.get(i).getBook_detail());
			
			ja.put(jo);
		}
		return ja.toString();
	}
	
	// 상세페이지 해당제품 review load하기
	@PostMapping("/load_review")
	@ResponseBody
	public String load_review(HttpServletRequest req) {
		int book_num = Integer.parseInt(req.getParameter("book_num"));
		
		ArrayList<ReviewDTO> alReview = cdao.load_review(book_num);
		JSONArray ja = new JSONArray();
		for(int i=0; i<alReview.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("review_num", alReview.get(i).getReview_num());
			jo.put("rev_title", alReview.get(i).getRev_title());
			jo.put("rev_content", alReview.get(i).getRev_content());
			jo.put("rev_create_date", alReview.get(i).getRev_create_date());
			jo.put("rev_update_date", alReview.get(i).getRev_update_date());
			jo.put("id", alReview.get(i).getId());
			jo.put("order_num", alReview.get(i).getOrder_num());
			jo.put("book_num", alReview.get(i).getBook_num());
			
			ja.put(jo);
		}
		return ja.toString();
	}
	// 리뷰 dialog 만들기
	@PostMapping("/dialog_review")
	@ResponseBody
	public String dialog_review(HttpServletRequest req) {
		int review_num = Integer.parseInt(req.getParameter("review_num"));
		
		ArrayList<ReviewDTO> alReview2 = cdao.dialog_review(review_num);
		JSONArray ja = new JSONArray();
		for(int i=0; i<alReview2.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("book_cover", alReview2.get(i).getBook_cover());
			jo.put("book_name", alReview2.get(i).getBook_name());
			jo.put("book_price", alReview2.get(i).getBook_price());
			jo.put("book_num", alReview2.get(i).getBook_num());
			
			
			
			jo.put("o_qty", alReview2.get(i).getO_qty());
			
			jo.put("id", alReview2.get(i).getId());
			jo.put("rev_title", alReview2.get(i).getRev_title());
			jo.put("rev_rating", alReview2.get(i).getRev_rating());			
			jo.put("rev_content", alReview2.get(i).getRev_content());
			
			ja.put(jo);
		}
		return ja.toString();
	}
	
	// 리뷰 dialog 만들기 - mypage
		@PostMapping("/dialog_review1")
		@ResponseBody
		public String dialog_review1(HttpServletRequest req) {
			String id = req.getParameter("id");
			int order_num = Integer.parseInt(req.getParameter("orderNum"));
			
			ArrayList<ReviewDTO> alReview3 = cdao.dialog_review1(order_num, id);
			JSONArray ja = new JSONArray();
			for(int i=0; i<alReview3.size(); i++) {
				JSONObject jo = new JSONObject();
				jo.put("book_cover", alReview3.get(i).getBook_cover());
				jo.put("book_name", alReview3.get(i).getBook_name());
				jo.put("book_price", alReview3.get(i).getBook_price());
				jo.put("book_num", alReview3.get(i).getBook_num());
				
				jo.put("o_qty", alReview3.get(i).getO_qty());
				
				jo.put("id", alReview3.get(i).getId());
				jo.put("rev_title", alReview3.get(i).getRev_title());
				jo.put("rev_rating", alReview3.get(i).getRev_rating());			
				jo.put("rev_content", alReview3.get(i).getRev_content());
				jo.put("review_num", alReview3.get(i).getReview_num());
				
				ja.put(jo);
			}
			return ja.toString();
		}
	
	
	// cart에 insert 하기 전에 이미 있는 책인지 확인하기
	@PostMapping("/confirm_cart")
	@ResponseBody
	public String confirm_cart(HttpServletRequest req) {
		String m_id = req.getParameter("m_id");
		int qty = Integer.parseInt(req.getParameter("qty"));
		int book_num = Integer.parseInt(req.getParameter("book_num"));
		
		String selectval=null;
		try {
			int confirm = cdao.confirm_cart(m_id, book_num);
			if(confirm == 1) {
				selectval="already";
			}else  {
				selectval="ok";
			}
		} catch(Exception e) {
			selectval="fail";
		}
		return selectval;
	}	
	// cart에 qty update 하기
	@PostMapping("/update_cart")
	@ResponseBody
	public String update_cart(HttpServletRequest req) {
		String m_id = req.getParameter("m_id");
		int qty = Integer.parseInt(req.getParameter("qty"));
		int book_num = Integer.parseInt(req.getParameter("book_num"));
		
		int origin_qty = cdao.confirm_qty(m_id, book_num);
		
		int total_qty = origin_qty + qty;
		String updateval=null;
		try {
			cdao.update_cart(total_qty, m_id, book_num);
			updateval="ok";
			
		} catch(Exception e) {
			updateval="fail";
		}
		return updateval;
	}
	
	
	
	// cart에 insert 하기
	@PostMapping("/insert_cart")
	@ResponseBody
	public String insert_cart(HttpServletRequest req) {
		String m_id = req.getParameter("m_id");
		int qty = Integer.parseInt(req.getParameter("qty"));
		int book_num = Integer.parseInt(req.getParameter("book_num"));
		
		String insertval=null;
		try {
			cdao.insert_cart(m_id, qty, book_num);
			insertval="ok";
		} catch(Exception e) {
			insertval="fail";
		}
		return insertval;
	}	
	
	
	
	// 검색어
	@PostMapping("/search")
	@ResponseBody
	public String search(HttpServletRequest req) {
		String selectVal = req.getParameter("selectVal");
		String keyword = req.getParameter("keyword");
		
		ArrayList<CategoryDTO> searchAr = cdao.search(selectVal, keyword);
		
		JSONArray ja = new JSONArray();
		for(int i=0; i<searchAr.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("book_cover", searchAr.get(i).getBook_cover());
			jo.put("book_num", searchAr.get(i).getBook_num());
			jo.put("book_name", searchAr.get(i).getBook_name());
			jo.put("author", searchAr.get(i).getAuthor());
			jo.put("publication", searchAr.get(i).getPublication());
			jo.put("book_price", searchAr.get(i).getBook_price());
			jo.put("book_summary", searchAr.get(i).getBOOK_SUMMARY());
			
			
			ja.put(jo);
		}
		return ja.toString();
	}
}
