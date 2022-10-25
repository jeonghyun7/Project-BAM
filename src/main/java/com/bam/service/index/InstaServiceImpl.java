package com.bam.service.index;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class InstaServiceImpl implements InstaService{
	
	private static final String url = "https://graph.instagram.com/me/media?media-id=[아이디입력]&fields=media_url,%20permalink,%20timestamp,%20caption&access_token=[토큰입력]";
	
	public String getHttpHTML_GET() {
		try {
			URL object = new URL(url);
			HttpURLConnection con = (HttpURLConnection)object.openConnection();
			con.setRequestMethod("GET");
			con.setConnectTimeout(3000); // 연결 타임아웃 3초
			con.setReadTimeout(3000); // 읽기 타임아웃 3초
			
			log.info("$$메서드"+con.getRequestMethod());
			log.info("$$타입"+con.getContentType());
			log.info("$$코드"+con.getResponseCode());
			log.info("$$응답메시지"+con.getResponseMessage());
			
			try {
				InputStream is = con.getInputStream();

				ByteArrayOutputStream baos = new ByteArrayOutputStream();
				
				byte[] buf = new byte[1024*8];
				int length = 0;
				while((length = is.read(buf)) != -1) {
					baos.write(buf, 0, length);
				}
				
				log.info("$$baos : "+baos);
				String jsonArray = baos.toString("UTF-8");
				jsonArray = jsonArray.replaceAll("\\\\/", "/");
				log.info("$$test : "+jsonArray);
				return jsonArray;
			}catch(Exception e) {
				e.printStackTrace();
			}
			con.disconnect();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
