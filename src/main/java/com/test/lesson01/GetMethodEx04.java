package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/ex04")
public class GetMethodEx04 extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws IOException {
		// 이 메소드의 이름이 doGet()인 이유: GET 방식으로 불리면 작동하는 메소드가 얘 라는 뜻이다.
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		// request parameter
		String userId = request.getParameter("userId");
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String email = request.getParameter("email");
		
		// 테이블로 출력
		PrintWriter out = response.getWriter();
		out.print("<html><head><title>회원 정보</title></head><body>");
		out.print("<table border=1>");
		out.print("<tr><th>아이디</th><td>" + userId + "</td></tr>");
		out.print("<tr><th>이름</th><td>" + name + "</td></tr>");
		out.print("<tr><th>생년월일</th><td>" + birth + "</td></tr>");
		out.print("<tr><th>이메일</th><td>" + email + "</td></tr>");
		
		out.print("</table></body></html>");
	}
}
