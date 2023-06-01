package com.human.springboot.DonationController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DonationController {
	
	@GetMapping("/donation")
	public String showDonation() {
		 return "donation-main";
	}
	
	@GetMapping("/donation-submit")
	public String submitDonation() {
		 return "donation-submit";
	}
}
