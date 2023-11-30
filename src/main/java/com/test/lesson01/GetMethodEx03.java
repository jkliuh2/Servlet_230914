package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/ex03")
// 위의 링크로 들어오면 이 서블릿으로 들어온다는 뜻.
public class GetMethodEx03 extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
//		response.setContentType("text/plain");
		response.setContentType("text/json"); // json으로 내릴것이다.
		
		// Request Parameter 를 받아온다.
		String userId = request.getParameter("user_id"); // user_id=jkliuh2 
		String name = request.getParameter("name"); // name=서동옥
		int age = Integer.parseInt(request.getParameter("age")); 
		// 메소드 리턴이 String -> "30"으로 옴. 산술연산 안됨.
		// int로 바꾸려면 변환메소드 사용해야 한다.
		
		// 문제: age가 null로 들어오면 int로 변환이 안되니 에러.
		
		
		// 출력부
		PrintWriter out = response.getWriter();
//		out.println("결과");
//		out.println("user_id:" + userId); // request가 없으면? null로 표시 됨.
//		out.println("name:" + name);
//		out.println("age:" + age);
		
		// {"user_id":"jkliuh2", "name":"서동옥", "age":31} age는 숫자니까.
		// 위의 {}가 그냥 하나의 String
		
		// Map으로 put하는 것도 있지만, 지금은 노가다로 한다.
		out.print("{\"user_id\":\""
				+ userId + "\", \"name\":\"" 
				+ name + "\", \"age\":"
				+ age + "}");
		// "표시를 넣기 위해 역슬래쉬(\)를 붙인다.
		
	}
}
