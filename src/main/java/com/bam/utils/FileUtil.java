package com.bam.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Log4j
public class FileUtil {
	/**
	 * 업로드할 파일 객체와 경로를 매개변수로 넘겨준다면, 
	 * 설정된 파일 경로에 파일 업로드 후에, 중복처리된 새로운 파일이름을
	 * 반환한다.
	 * @param file (MultipartFile) 저장할 파일 객체
	 * @param path (String) 저장될 파일 경로
	 * @return a String value of saveFileName 새로운파일이름
	 */
	public String uploadFile(MultipartFile file, String path, HttpSession session) {
		path = session.getServletContext().getRealPath("") + path;
		String ofname = file.getOriginalFilename();
		int idx = ofname.lastIndexOf(".");
		String ofheader = ofname.substring(0, idx);
		String ext = ofname.substring(idx);
		long ms = System.currentTimeMillis();
		StringBuffer sb = new StringBuffer();
		sb.append(ofheader);
		sb.append("_");
		sb.append(ms);
		sb.append(ext);
		String saveFileName = sb.toString();
		
		boolean flag = writeFile(file, saveFileName, path);
		if(flag) {
			System.out.println("flag : "+flag);
			log.info("#> 파일 업로드 성공");
		}else {
			System.out.println("flag : "+flag);
			log.info("#> 파일 업로드 실패");
		}
		return saveFileName;
	}
	
	private boolean writeFile(MultipartFile file, String saveFileName, String path) {
		File dir = new File(path);
		if(!dir.exists())dir.mkdirs();
		FileOutputStream fos = null;
		try {
			byte data[] = file.getBytes();
			fos = new FileOutputStream(path+saveFileName);
			fos.write(data);
			fos.flush();
			return true;
		} catch(IOException ie) {
			log.info("IOException Err : "+ie);
			return false;
		} finally {
			try {
				fos.close();
			} catch(IOException ie) {
				log.info("IOException Err : "+ie);
			}
		}
	}
}
