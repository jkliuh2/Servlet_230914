package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/ex02")
// "어노테이션"
// url 주소 뒷 내용만 써주면 끝. xml 필요 없음.

public class UrlMappingEx02 extends HttpServlet {

	@Override public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// 한글 깨짐 방지
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html"); // text에 html형식이라는 뜻.
		
		PrintWriter out = response.getWriter();
		
		// 서블릿(Servlet): Java + html 이라고 볼 수 있다.

		// 1 ~ 10 합계: 1+2+3+...+10
		int sum = 0;
		for (int i = 1; i <= 10; i++) {
			sum += i;
		}
		
		// 합계: <b>결과값</b>
		
		// 어차피 이제는 html이므로, 줄 바꿈이 <br>로 밖에 안된다(ln의미 없음)
		out.println("<html><head><title>합계</title></head><body>");
		out.print("합계:<b>" + sum + "</b>");
		out.print("</body></html>");
	}
}
