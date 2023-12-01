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
			
			
			
//			if (sentence.contains(search)) { // 문장 안에 키워드가 포함되어있는가
//				out.print(sentence + "<br>");
//			} // 이건 그냥 bold 처리 안하고 출력하는 것.
				
			
			// bold처리하기
			// 1) split()
//			if (sentence.contains(search)) {
//				// split()이용. 아예 키워드를 기준으로 앞 뒤로 자른다.
//				// 그 다음, 앞 뒤에 <b></b> 넣어준다.
//				// 키워드가 하나만 있다고 가정
//				
//				String[] words = sentence.split(search); // 0-앞문장, 1-뒷문장 
//				out.print(words[0] + "<b>" + search + "</b>" + words[1] + "<br>");
//			}
			
			// 2) 키워드 교체. replace()
			if (sentence.contains(search)) {
				// 키워드를 앞 뒤에 <b></b>를 붙인 것으로 교체
				sentence = sentence.replace(search, "<b>" + search + "</b>");
				out.print(sentence + "<br>");
				// 간단한 방식
			}
		}
		
		out.print("</body></html>");
	}
}
