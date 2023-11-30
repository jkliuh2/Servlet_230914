package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/quiz08")
public class GetMethodQuiz08 extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// 한글 깨짐 방지
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		// Request Parameter 꺼내기
		String search = request.getParameter("search");
		
		// 검색할 List 정의
		List<String> list = new ArrayList<>(Arrays.asList(
				"강남역 최고 맛집 소개 합니다.", 
				"오늘 기분 좋은 일이 있었네요.", 
				"역시 맛집 데이트가 제일 좋네요.", 
				"집에 가는 길에 동네 맛집 가서 안주 사갑니다.",
				"자축 저 오늘 생일 이에요."));
		
		// HTML 출력
		PrintWriter out = response.getWriter();
		out.print("<html><head><title>검색결과</title><head><body>");
		
		// 검색해서 키워드 일치하는 내용 출력
		Iterator<String> iter = list.iterator();
		
		while (iter.hasNext()) {
			String sentence = iter.next();
			if (sentence.contains(search)) { // 문장 안에 키워드가 포함되어있는가
				
				// 검색어에 대해 bold 처리.
				sentence = sentence.replace(search, ("<b>" + search + "</b>"));
				
				out.print(sentence + "<br>");
			}
		}
		
		out.print("</body></html>");
	}
}
