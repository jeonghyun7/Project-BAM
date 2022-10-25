package com.bam.model;

import java.util.Iterator;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

import com.bam.storage.LoginStorage;
import com.bam.utils.TimeUtil;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member implements HttpSessionBindingListener{
	private String email;
	private int a_no;
	private String name;
	private String nickname;
	private String pwd;
	private long point;
	private String approval_status;
	private String approval_key;
	private String grade;
	private String accessToken;
	
	private String loginTime;
	private long[] differTime;
	private int loginCount = 0;
	
	public Member(String email, int a_no, String name, String nickname, String pwd, long point, String approval_status,
			String approval_key, String grade, String accessToken) {
		this.email = email;
		this.a_no = a_no;
		this.name = name;
		this.nickname = nickname;
		this.pwd = pwd;
		this.point = point;
		this.approval_status = approval_status;
		this.approval_key = approval_key;
		this.grade = grade;
		this.accessToken = accessToken;
	}
	
	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		log.info("########ValueBound(세션연결됨)########");
		Member member = this;
		TimeUtil timeUtil = new TimeUtil();
		String loginTime = timeUtil.getDateTime();
		member.setLoginTime(loginTime);
		member.setLoginCount(member.getLoginCount()+1);
		if(LoginStorage.getInstance().getLoginUsers().size() == 0) {
			LoginStorage.getInstance().getLoginUsers().add(member);
		} else {
			Iterator<Member> itr = LoginStorage.getInstance().getLoginUsers().iterator();
			boolean isSameUser = false;
			while(itr.hasNext()) {
				Member other = itr.next();
				if(other.getEmail().equals(member.getEmail())) {
					isSameUser = true;
					break;
				}
			}
			if(!isSameUser) LoginStorage.getInstance().getLoginUsers().add(member);
		}
	}

	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
		log.info("########ValueBound(세션끊어짐)########");
		Iterator<Member> itr = LoginStorage.getInstance().getLoginUsers().iterator();
		while(itr.hasNext()) {
			Member other = itr.next();
			if(other.getEmail().equals(this.email)) {
				if(other.getLoginCount() <= 1) {
					log.info("로그인 목록 삭제");
					itr.remove();
					break;
				}
				other.setLoginCount(other.getLoginCount()-1);
			}
		}
		int s = LoginStorage.getInstance().getLoginUsers().size();
		log.info("##>> loginUsers size : "+s);
	}
}
