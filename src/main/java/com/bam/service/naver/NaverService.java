package com.bam.service.naver;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface NaverService {
	void naverLogin(String snsService, String code, HttpSession session, Model model) throws Exception;
	void naverLogout(HttpSession session, String accessToken) throws IOException;
}
