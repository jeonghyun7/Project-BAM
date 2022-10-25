package com.bam.service.naver;

import java.io.IOException;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.bam.auth.SnsLogin;
import com.bam.auth.SnsValue;
import com.bam.mapper.MemberMapper;
import com.bam.model.Member;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class NaverServiceImpl implements NaverService{
	@Autowired
	MemberMapper memberMapper;

	@Transactional
	@Override
	public void naverLogin(String snsService, String code, HttpSession session, Model model) throws Exception {
		SnsLogin snsLogin = new SnsLogin(new SnsValue(snsService));
		/* Access Token을 이용하여 네이버 사용자 프로필 API를 호출 */
		Member profile = snsLogin.getUserProfile(code);
		System.out.println("====================================");
		log.info("#>Profile : "+profile);
		int i = memberMapper.emailCheck(profile.getEmail());
		if(i > 0) {
			profile = memberMapper.login(profile.getEmail());
			profile.setPwd(null);
		} else {
			profile.setApproval_key(create_key());
			profile.setApproval_status("true");
			profile.setPwd(create_key()+"_naver_"+create_key());
			if(memberMapper.insertMember(profile)) profile.setPwd(null);
		}
		session.setAttribute("member", profile);
		System.out.println("====================================");
	}

	@Override
	public void naverLogout(HttpSession session, String accessToken) throws IOException {
		session.removeAttribute("member");
	}
	
	private String create_key() {
		String key = "";
		Random rd = new Random();
		
		//8자리 숫자의 랜덤한 숫자 생성 
		for (int i = 0; i < 8; i++) {
			key += rd.nextInt(10);
		}
		return key;
	}
}
