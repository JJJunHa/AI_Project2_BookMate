package com.human.springboot.MypageController;

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
import jakarta.servlet.http.HttpSession;

@Controller
public class MypageController {
	
	@Autowired private mypageDAO mypagedao;
	
	@GetMapping("/mypage")
    public String showMypage(HttpServletRequest req, Model model) {
    	
    	HttpSession session = req.getSession();
    	
    	if (session == null || session.getAttribute("id") == null) {
            // 아이디 세션이 만료되었을 때 로그인 페이지로 리다이렉트
            return "redirect:/login";
        }
    	
		String id=(String)session.getAttribute("id");
//		System.out.println(id);
		
//		int order_num=(int)session.getAttribute("order_num");
//		System.out.println(order_num);
		
//		orderedDTO compareRev = mypagedao.compareRev(id,order_num);
		
		mypageDTO showAdr = mypagedao.showAdr(id);
		mypageDTO showMob = mypagedao.showMob(id);
		mypageDTO showBir = mypagedao.showBir(id);
		
//		System.out.println(showAdr);
//		System.out.println(showAdr);
		String cut[]=showAdr.getAddress().split("@");
//		System.out.println(cut[1]);
		
		showAdr.setAddress1(cut[0]);
		showAdr.setAddress2(cut[1]);
		
		String cut1[]=showMob.getMobile().split(" ");
//		System.out.println(cut1[1]);
		
		showMob.setMobile1(cut1[0]);
		showMob.setMobile2(cut1[1]);
		showMob.setMobile3(cut1[2]);
		
		String cut3=showBir.getBirth();
		String cut4 = cut3.substring(0, 10);
		
		String cut2[]=cut4.split("-");
//		System.out.println(cut2[1]);
		
		showBir.setBirth1(cut2[0]);
		showBir.setBirth2(cut2[1]);
		showBir.setBirth3(cut2[2]);
		
		
		ArrayList<mypageDTO> selectMy = mypagedao.selectMy(id);
		
		for (int i = 0; i < selectMy.size(); i++) {
			
		    String id1 = selectMy.get(i).getId();
		    String pwd = selectMy.get(i).getPwd();
		    String name = selectMy.get(i).getName();
		    String zip_code = selectMy.get(i).getZip_code();
		    String email = selectMy.get(i).getEmail();
		    String mobile= selectMy.get(i).getMobile();
		    String birth= selectMy.get(i).getBirth();
		    
		}
		

		model.addAttribute("selectMy",selectMy);
		model.addAttribute("showAdr",showAdr);
		model.addAttribute("showMob",showMob);
		model.addAttribute("showBir",showBir);
	
//	///// 주문내역 상품 select 하는 코드 /////
			  ArrayList<orderedDTO> mydeli = mypagedao.selectDelInfo(id);
//		      System.out.println(mydeli);
		      ArrayList<Integer> product_prices = new ArrayList<>();
		      
		      for (int i = 0; i < mydeli.size(); i++) {
		        
		    	///// 주문내역 상품 select 하는 코드 /////
		    	  String order_date = mydeli.get(i).getOrder_date();
//		    	  System.out.println(order_date);
		    	  
		          int o_qty = mydeli.get(i).getO_qty(); // int
//		          System.out.println(qty);
		          
		          String book_num = mydeli.get(i).getBook_num();
//		          System.out.println(book_num);
		          
		          String book_cover = mydeli.get(i).getBook_cover();
//		          System.out.println(book_cover);
		          
		          String book_name = mydeli.get(i).getBook_name();
//		          System.out.println(book_name);
		          
		          String book_price = mydeli.get(i).getBook_price(); // int
//		          System.out.println(book_price);
		          
		          int order_num = mydeli.get(i).getOrder_num();
//		          System.out.println(order_num);
				    
				    if(book_price != null) {
				    	
				    	int product_price = (Integer.parseInt(book_price) * (o_qty));
				    	mydeli.get(i).setBPR(product_price);
				    	
				    }
				  
				    if(book_name != null) {
				    	
				    	mydeli.get(i).setIMG_NAME1("책 이름"+book_name);
				    	
				    }
				  
				    mydeli.get(i).setBOOK("책 넘버"+book_num);
				   
		      }

		      model.addAttribute("mydeli",mydeli);
		      	
		      
		      // 리뷰 작성 확인하기 
		      
		      
		       return "mypage";

	    }
    
    
    
////////////////////////////// 주문내역 part //////////////////////////////

	
    
    
////////////////////////////// 주문내역 part //////////////////////////////    
    
    
    
////////////////////////////// 게시글 part ///////////////////////////////
	
    @GetMapping("/myPlist")
	@ResponseBody
	public String doGetList(HttpServletRequest req) {
    	
    	HttpSession session = req.getSession();
		String id=(String)session.getAttribute("id");
		
//		System.out.println(id);
    	
		ArrayList<POSTDTO> plist = mypagedao.selectPlist(id);
//		System.out.println(plist);
		
		JSONArray ja =new JSONArray();
		
		for(int i=0; i<plist.size(); i++) {
			
			JSONObject jo = new JSONObject();
			jo.put("board_num", plist.get(i).getBoard_num());
			jo.put("B_title", plist.get(i).getB_title());
			jo.put("id", plist.get(i).getId());
			jo.put("B_Create_date", plist.get(i).getB_create_date());
			jo.put("B_rcount",plist.get(i).getB_rcount());
		
			ja.put(jo);
		}
		return ja.toString();
	} 
    
    @GetMapping("/doQview")
	@ResponseBody
	public String viewBBS(HttpServletRequest req) {

		String id=req.getParameter("name");
		String board_num=req.getParameter("num");
		
		POSTDTO qo=mypagedao.QviewList(Integer.parseInt(board_num));

		String pstr=qo.getB_title()+",:"+qo.getB_content()+",:"+qo.getId()+
				",:"+qo.getB_create_date()+",:"+qo.getB_update_date()+",:"+
				qo.getB_rcount()+",:"+qo.getBoard_num();

		
		//System.out.println(qa);
		return pstr;
	}
    
//////////////////////////////// 게시글 part //////////////////////////////
    
    
//////////////////////////////// 댓글 part ///////////////////////////////   
    
    @PostMapping("/showBC")
	@ResponseBody
	public String showBC(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String writer=(String) session.getAttribute("id");
		
		ArrayList<POSTDTO> myComment = mypagedao.myComment(writer);
		JSONArray ja = new JSONArray();
		for(int i=0; i<myComment.size(); i++) {
			
			JSONObject jo = new JSONObject();
			jo.put("BC_num", myComment.get(i).getBcontent_num());
			jo.put("BC_content", myComment.get(i).getBC_content());
			jo.put("id", myComment.get(i).getId());
			jo.put("BC_create", myComment.get(i).getBC_create_date());
//			if(writer.equals(myComment.get(i).getBC_writer())) {
//				jo.put("check", "check");
//			}
			
			
			ja.put(jo);
		}
		return ja.toString();
	}
    
    
    
    @GetMapping("/doQview2")
	@ResponseBody
	public String viewBBS2(HttpServletRequest req) {
    	
		String id=req.getParameter("name");
		String num=req.getParameter("num");

		POSTDTO BordNum=mypagedao.selectBordNum(num);
		
			
//		System.out.println("bordNum= "+BordNum.getBoard_num());
		
		mypagedao.Qread(BordNum.getBoard_num());
		
		POSTDTO qo=mypagedao.QviewList(BordNum.getBoard_num());

		String pstr=qo.getB_title()+",:"+qo.getB_content()+",:"+qo.getId()+
				",:"+qo.getB_create_date()+",:"+qo.getB_update_date()+",:"+qo.getB_rcount()+",:"+qo.getBoard_num();
	
		return pstr;
	}
	
//////////////////////////////// 댓글 part ///////////////////////////////
    
    
//////////////////////////////// 나의 기부 part ///////////////////////////
    
    @PostMapping("/showDN")
	@ResponseBody
	public String showDN(HttpServletRequest req) {
    	
		HttpSession session = req.getSession();
		String dona_id = (String) session.getAttribute("id");
		
		ArrayList<POSTDTO> myDonation = mypagedao.myDonation(dona_id);
		JSONArray ja = new JSONArray();
		for(int i=0; i<myDonation.size(); i++) {
			
			JSONObject jo = new JSONObject();
			jo.put("dona_num", myDonation.get(i).getDona_num());
			jo.put("dona_name", myDonation.get(i).getDona_name());
			jo.put("dona_qty", myDonation.get(i).getDona_qty());
			jo.put("dona_way", myDonation.get(i).getDona_way());
			jo.put("dona_date", myDonation.get(i).getDona_date());
			
			ja.put(jo);
		}
		
		return ja.toString();
	}
    
//////////////////////////////// 나의 기부 part ///////////////////////////
    
    
//////////////////////////////// 회원정보 update part /////////////////////
    
    @PostMapping("/updateMy")
    @ResponseBody
    public String updateMy(HttpServletRequest req) {
    	String id= req.getParameter("id");
    	String id2= req.getParameter("id2");
    	String pwd=req.getParameter("pwd");
    	String name = req.getParameter("name");
    	String email = req.getParameter("email");
    	String zip_code = req.getParameter("zip_code");
    	String address = req.getParameter("address");
    	String mobile = req.getParameter("mobile");
    	String birth = req.getParameter("birth");
    	
    	
		mypagedao.updateMy(id, id2, pwd, name, email, zip_code, address, mobile, birth);
		
		return "ok";
		
    }
    
////////////////////////////// 회원정보 update part /////////////////////////////
    

    
    
////////////////////////////// mypage part ////////////////////////////////////
    
    // mypage에서 cart에 있는지 찾기
    @PostMapping("/MyPageCartFind")
	@ResponseBody
	public String MyPageCartFind(HttpServletRequest req) {
    	String id = req.getParameter("id");
		int book_num = Integer.parseInt(req.getParameter("book_num"));

		String cartinsertval=null;
		int count = mypagedao.MyPageCartFind(id, book_num);
		try {
			if(count == 0) {
				cartinsertval="none";
			} else {
				cartinsertval="ok";
			}

		} catch(Exception e) {
			cartinsertval="fail";
			e.printStackTrace();
		}
		return cartinsertval;
	}	
    
    
    // mypage에서 cart insert 하기
    @PostMapping("/MyPageAddCart")
	@ResponseBody
	public String MyPageAddCart(HttpServletRequest req) {
    	String id = req.getParameter("id");
		int book_num = Integer.parseInt(req.getParameter("book_num"));
		int qty = Integer.parseInt(req.getParameter("qty"));
//		System.out.println(book_num);
//		System.out.println(qty);

		String cartinsertval=null;
		try {
			mypagedao.MyPageAddCart(id, book_num, qty);
			cartinsertval="ok";
			
		} catch(Exception e) {
			cartinsertval="fail";
			e.printStackTrace();
		}
		return cartinsertval;
	}	
    
//    // mypage에서 주문 목록 갯수 불러오기
//    @PostMapping("/count_order")
//	@ResponseBody
//	public String count_order(HttpServletRequest req) {
//    	String id = req.getParameter("id");
//		String count_order = "";
//		try {
//			count_order = Integer.toString(mypagedao.count_order(id));
////			System.out.println(count_order);
//			
//		} catch(Exception e) {
//			count_order="fail";
//			e.printStackTrace();
//		}
//		return count_order;
//	}	
    
    // 주문 목록 불러오기
    @PostMapping("/load_order")
	@ResponseBody
	public String load_order(HttpServletRequest req) {;
		String id = req.getParameter("id");
		
		ArrayList<orderedDTO> ar = mypagedao.load_order(id);

		JSONArray ja = new JSONArray();

		try {
			JSONObject jo = new JSONObject();			
			for(int i=0; i<ar.size(); i++) {
					jo = new JSONObject();			
					jo.put("book_name", ar.get(i).getBook_name());
					jo.put("book_price", ar.get(i).getBook_price());
					jo.put("book_cover", ar.get(i).getBook_cover());
					jo.put("author", ar.get(i).getAuthor());
					jo.put("o_qty", ar.get(i).getO_qty());
					jo.put("book_num", ar.get(i).getBook_num());
					jo.put("order_date", ar.get(i).getOrder_date());
					jo.put("id", ar.get(i).getId());
					jo.put("order_num", ar.get(i).getOrder_num());
					jo.put("status", ar.get(i).getStatus());
					jo.put("pay_way", ar.get(i).getPay_way());
					
					int total = Integer.parseInt(ar.get(i).getBook_price()) * ar.get(i).getO_qty();
					jo.put("total", total);
					
					ja.put(jo);
					}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ja.toString();
	}
    
    // mypage에서 배송상태 확인 하기
    @PostMapping("/check_status")
    @ResponseBody
    public String check_status(HttpServletRequest req) {
        String id = req.getParameter("id");
        int orderNum = Integer.parseInt(req.getParameter("orderNum"));

        String statusval = null;
        try {
            String status = mypagedao.check_status(id, orderNum);
//            System.out.println(status);
            if (status.equals("주문완료")) {
                statusval = "ok1";
            } else if(status.equals("배송준비")) {
                statusval = "ok2";
            } else if(status.equals("배송중")) {
                statusval = "ok3";
            } else if(status.equals("배송완료")) {
                statusval = "ok4";
            }
        } catch (Exception e) {
            statusval = "fail";
            e.printStackTrace();
        }
        return statusval;
    }
    
    // 주문취소하기
    @PostMapping("/order_delete")
    @ResponseBody
    public String order_delete(HttpServletRequest req) {
        String id = req.getParameter("id");
        int orderNum = Integer.parseInt(req.getParameter("orderNum"));

        String deleteval = null;
        try {

        	int cart_num =  mypagedao.order_delete_cart(id, orderNum);
        	mypagedao.order_delete(id, orderNum);
        	mypagedao.order_delete1(id, cart_num);
            
            deleteval = "ok";
           
        } catch (Exception e) {
        	deleteval = "fail";
            e.printStackTrace();
        }
        return deleteval;
    }

  
}
