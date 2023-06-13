package com.human.springboot.PaymentController;

import java.util.Date;

import lombok.Data;
 
@Data
public class KakaoPayReadyVO {
    
    //response
    private String tid, next_redirect_pc_url;
    private Date created_at;
    
}
