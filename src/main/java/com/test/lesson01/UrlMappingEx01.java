package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UrlMappingEx01 extends HttpServlet {
// Servlet container 공간에 Url~~이름의 Servlet이 생성되는 개념
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// request와 response를 뒤집으면 "부모에게 없는 메소드"로 인식됨. -> 404에러.
		// Override를 반드시 입력해서 실수를 막는다.
		
		// 한글 깨짐 방지(Response Header부분에 utf-8이라는 선언을 해주는 것.)
		response.setContentType("text/plain"); // 순수한 글자다. 라는 뜻
		response.setCharacterEncoding("utf-8");
		// 위 둘이 한 세트. 하나라도 없으면 한글 깨짐.
		
		PrintWriter out = response.getWriter(); // 이쪽으로 요청이 들어오면,
		out.println("안녕하세요"); // 이러한 응답을 보낸다.
		
		// Date클래스 이용하기.
		Date now = new Date(); // 객체가 생성된 시간으로 시간이 찍힘. 
		out.println(now); // 기본형으로 출력됨.
		
		// formatter
		// 2023-11-27 오후 17:05:43 이런 형태로 나오게 하고 싶다.
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss");
		// 어떻게 쓰는지는 google에 검색하면 잘 나온다.
		
		out.println(sdf.format(now));
		// now의 시간이 위의 포맷에 맞게 바뀌어서 출력된다.
	}
}
