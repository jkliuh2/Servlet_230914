package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/quiz06")
public class GetMethodQuiz06 extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/json");
		
		// Request Parameter
		int number1 = Integer.parseInt(request.getParameter("number1"));
		int number2 = Integer.parseInt(request.getParameter("number2"));
		
//		int addition = number1 + number2;
//		int subtraction = number1 - number2;
//		int multiplication = number1 * number2;
//		int division = number1 / number2;
		
		
		// 출력
		PrintWriter out = response.getWriter();
		
		out.print("{\"addition\":" + (number1 + number2) 
				+ ", \"subtraction\":" + (number1 - number2) 
				+ ", \"multiplication\":" + (number1 * number2) 
				+ ", \"division\":" + (number1 / number2) 
				+ "}");
		
	}
}
