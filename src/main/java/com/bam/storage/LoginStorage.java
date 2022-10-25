package com.bam.storage;

import java.util.LinkedList;

import com.bam.model.Member;

public class LoginStorage {
	private static LoginStorage LOGIN_SESSION = null;
	private static LinkedList<Member> LOGIN_USERS = new LinkedList<Member>();
	//싱글톤
	
	private LoginStorage() {
	}
	
	public static synchronized LoginStorage getInstance() {
		if(LOGIN_SESSION == null) LOGIN_SESSION = new LoginStorage();
		return LOGIN_SESSION;
	}
	
	public LinkedList<Member> getLoginUsers(){
		return LOGIN_USERS;
	}
}