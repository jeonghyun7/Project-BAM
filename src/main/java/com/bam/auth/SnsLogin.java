package com.bam.auth;

import java.io.IOException;
import java.util.concurrent.ExecutionException;

import com.bam.model.Member;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

public class SnsLogin {
	private OAuth20Service oauthService;
	private SnsValue sns;
	
	public SnsLogin(SnsValue sns) {
		this.oauthService = new ServiceBuilder(sns.getClientId())
				.apiSecret(sns.getClientSecret())
				.callback(sns.getRedirectUrl())
				.scope("profile")
				.build(sns.getApi20Instance());
		this.sns = sns;
	}
	
	/* 네이버 아이디로 인증 URL 생성 Method */
	public String getNaverAuthURL() {
		return this.oauthService.getAuthorizationUrl();
	}
	
	public Member getUserProfile(String code) throws IOException, InterruptedException, ExecutionException {
		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
		
		OAuthRequest request = new OAuthRequest(Verb.GET, this.sns.getProfileUrl());
		oauthService.signRequest(accessToken, request);
		
		Response response = oauthService.execute(request);
		Member member = parseJson(response.getBody());
		member.setAccessToken(accessToken.getAccessToken());
		return member;
	}
	
	private Member parseJson(String body) throws IOException {
		Member member = new Member();
		
		ObjectMapper mapper = new ObjectMapper();
		JsonNode rootNode = mapper.readTree(body);
		if(this.sns.isNaver()){
			JsonNode responseNode = rootNode.get("response");
			member.setEmail(responseNode.get("email").asText());
			member.setName(responseNode.get("name").asText());
			member.setNickname(responseNode.get("nickname").asText());
			member.setGrade("silver");
		}
		return member;
	}
}
