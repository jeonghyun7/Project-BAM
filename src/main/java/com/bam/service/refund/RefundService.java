package com.bam.service.refund;

import javax.servlet.http.HttpSession;

public interface RefundService {
		// 아임포트 인증(토큰)을 받아주는 함수
		public String getImportToken();
		// 결제취소 
		public int cancelPayment(String token, String mid);
		// 아임포트 결제정보를 조회해서 결제금액을 뽑아주는 함수 
		public String getAmount(String token, String mId);
		// 아임포트 결제금액 변조는 방지하는 함수 
		public void setHackCheck(String amount, String mId, String token);
		
		public boolean updateBooking(String imp_uid, long point, long use_point, long save_point, String email, HttpSession session);
		
		public String[] getRefundableDate(String check_in);
		
}
