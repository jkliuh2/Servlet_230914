package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/quiz07")
public class GetMethodQuiz07 extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws IOException {
		// 한글 깨짐 방지
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		// request parameter 꺼내기
		String address = request.getParameter("address");
		String card = request.getParameter("card");
		String price = request.getParameter("price");
		
		// 응답 HTML 화면
		PrintWriter out = response.getWriter();
		
		out.print("<html><head><title>주문 결과</title></head><body>");
		
		// 조건문
		if (address.startsWith("서울시") == false) { // 주소에 서울시로 시작 안 될 경우
			out.print("<h1>배달 불가 지역입니다.</h1>");
		} else if (card.equals("신한카드")) { // card == 신한카드
			out.print("<h1>결제 불가 카드입니다.</h1>");
		} else {
			out.print(address + " <b>배달 준비중</b><br>"
					+ "결제금액:" + price + "원");
		}
		
		out.print("</body></html>");
	}
}
