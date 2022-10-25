package com.bam.auth;

import com.github.scribejava.core.builder.api.DefaultApi20;

//NaverApi20은 항상 싱글톤 패턴으로 만들어야 한다.
//
public class NaverApi20 extends DefaultApi20 implements SnsUrl{
	
	private NaverApi20() {}
	
	private static class InstanceHolder{
		private static final NaverApi20 INSTANCE = new NaverApi20();
	}
	
	public static NaverApi20 instance() {
		return InstanceHolder.INSTANCE;
	}

	@Override
	public String getAccessTokenEndpoint() {
		return NAVER_ACCESS_TOKEN;
	}

	@Override
	protected String getAuthorizationBaseUrl() {
		return NAVER_AUTH;
	}
	
}
