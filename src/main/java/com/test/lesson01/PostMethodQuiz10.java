package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/quiz10")
public class PostMethodQuiz10 extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws IOException {
		response.setContentType("text/html");
		
		// request para
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		// 출력
		PrintWriter out = response.getWriter();
		
		out.print("<html><head><title>정보 확인</title></head><body>");
		
		// 일치하는가 확인하기
		if (userMap.get("id").equals(id) == false) { // id 불일치
			out.print("id가 일치하지 않습니다.");
		} else if (userMap.get("password").equals(password) == false) { // password 불일치
			out.print("password가 일치하지 않습니다.");
		} else {
			out.print(userMap.get("name") + "님 환영합니다!");
		}
		
		out.print("</body></html");
	}
	
	
	// doPost 메소드 바깥쪽에 위치
	private final Map<String, String> userMap =  new HashMap<String, String>() {
	    {
	        put("id", "marobiana");
	        put("password", "qwerty1234");
	        put("name", "신보람");
	    }
	};
}
