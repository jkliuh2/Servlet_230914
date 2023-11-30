package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UrlMappingQuiz01 extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/plain");
		response.setCharacterEncoding("utf-8");
		
		
//		1. 오늘 날짜 출력
//		오늘 날짜를 출력하세요.
//		- web.xml URL Mapping 후 servlet을 이용해서 출력하세요.
//		- Content Type은 text/plain으로 설정하세요.
		
//		오늘의 날짜는 2021년 5월 20일
		
		Date now = new Date(); // 지금 시간정보가 담긴 객체.
		
		// 시간정보에 대한 포멧이 담긴 객체(sdf) 생성
		SimpleDateFormat sdf = new SimpleDateFormat("오늘의 날짜는 yyyy년 M월 dd일");
		PrintWriter out = response.getWriter();
		out.println(sdf.format(now)); // now의 정보를 sdf에 맞춰서 출력하기.
		
		
//		2. 시간 출력
//		현재의 시간을 출력하세요.
//		- web.xml URL Mapping 후 servlet을 이용해서 출력하세요.
//		- Content Type은 text/plain으로 설정하세요.
//		- 24시간 표현법으로 출력하세요.
//
//		출력 예시
//
//		현재 시간은 14시 52분 43초 입니다.
		SimpleDateFormat sdf2 = new SimpleDateFormat("현재 시간은 HH시 mm분 ss초 입니다.");
		out.println(sdf2.format(now));
		
	}

}
