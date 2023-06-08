package com.human.springboot.DonationController;

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
public class DonationController {
	@Autowired
	private DonationDAO ddao;
	
	@GetMapping("/donation")
	public String showDonation() {
		 return "donation-main";
	}
	
	@GetMapping("/donation-submit")
	public String submitDonation() {
		 return "donation-submit";
	}
	
	// 회원 정보 가져오기
	@PostMapping("/load_personInfo")
	@ResponseBody
	public String load_personInfo(HttpServletRequest req) {
		String id = req.getParameter("m_id");
		ArrayList<DonationDTO> load_personInfo = ddao.load_personInfo(id);
		JSONArray ja = new JSONArray();
		for(int i=0; i<load_personInfo.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("name", load_personInfo.get(i).getName());
			jo.put("mobile", load_personInfo.get(i).getMobile());
			jo.put("zip_code", load_personInfo.get(i).getZip_code());
			jo.put("address", load_personInfo.get(i).getAddress());
			
			ja.put(jo);
		}
		return ja.toString();
	}
	
	// donation insert 하기
	@PostMapping("/insert_donation")
	@ResponseBody
	public String insert_donation(HttpServletRequest req) {
		String dona_name = req.getParameter("dona_name");
		int dona_qty = Integer.parseInt(req.getParameter("dona_qty"));
		String dona_way = req.getParameter("dona_way");
		String id = req.getParameter("id");
		
		String insertval=null;
		try {
			ddao.insert_donation(dona_name, dona_qty, dona_way, id);
			insertval = "ok";

		} catch(Exception e) {
			insertval="fail";
		}
		return insertval;
	}
}
