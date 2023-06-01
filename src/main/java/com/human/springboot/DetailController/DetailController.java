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
		ArrayList<CategoryDTO> comedy_list = cdao.comedy_list();
		model.addAttribute("comedy_list", comedy_list);
		 return "category1";
	}
	/* category2 로맨스 */
	@GetMapping("/category2")
	public String showCategory2(Model model) {
		ArrayList<CategoryDTO> romance_list = cdao.romance_list();
		model.addAttribute("romance_list", romance_list);
		 return "category2";
	}
	/* category3 판타지 */
	@GetMapping("/category3")
	public String showCategory3(Model model) {
		ArrayList<CategoryDTO> fantasy_list = cdao.fantasy_list();
		model.addAttribute("fantasy_list", fantasy_list);
		 return "category3";
	}
	/* category4 공포/스릴러/추리 */
	@GetMapping("/category4")
	public String showCategory4(Model model) {
		ArrayList<CategoryDTO> mystery_list = cdao.mystery_list();
		model.addAttribute("mystery_list", mystery_list);
		 return "category4";
	}
	/* category5 드라마 */
	@GetMapping("/category5")
	public String showCategory5(Model model) {
		ArrayList<CategoryDTO> drama_list = cdao.drama_list();
		model.addAttribute("drama_list", drama_list);
		 return "category5";
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
			jo.put("book_cover", alBook.get(i).getBook_cover());
			jo.put("book_price", alBook.get(i).getBook_price());
			jo.put("book_content", alBook.get(i).getBook_content());
			
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
}
