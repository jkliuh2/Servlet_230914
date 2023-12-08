package com.test.lesson04;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.common.MysqlService;

@WebServlet("/lesson04/ex01")
public class Lesson04Ex01 extends HttpServlet {
	// 웹 주소로 치고 들어올테니 get
	
	@Override
	public void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws IOException {
		
		// 응답값(최종) => plain
		response.setContentType("text/plain"); // utf-8을 필터에서 끝
		
		// DB 연결
//		MysqlService ms = new // 를 원래는 해야하지만
		MysqlService ms = MysqlService.getInstance(); // 이걸 들고왔다고 연결된 것은 아님
		
		ms.connect(); // 실질적인 연결 (꼭 넣어야 함!)
		
		// DB 인서트
		String insertQuery = "insert into `used_goods`"
				+ "(`sellerId`, `title`, `description`, `price`)"
				+ "value"
				+ "(1, '고양이 간식 팝니다!', '까다로워서 잘 안먹어요ㅠ', 2000)";
		try {
			ms.update(insertQuery);
			// 인서트에서는 내용만 변경하면 끝이기 때문에 이것으로 끝
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// 연결 중 DB 셀렉트 & 출력
		PrintWriter out = response.getWriter();
		String query = "select * from `used_goods`"; // 쿼리문 작성
		try {
			ResultSet res = ms.select(query);// R에서 쓰는 메소드.
			while (res.next()) { // 결과 행이 있는 동안 수행(Iterator와 같은 구조지만 메소드가 조금 다름)
				out.println(res.getInt("id"));
				out.println(res.getString("title"));
				out.println(res.getInt("price"));
				out.println(res.getString("description"));
				// 작성된 쿼리문으로 select되서 res로 들어간 데이터들을 Iterator식으로 순회하는 방식.
				// ResultSet의 데이터중 한 행을 뽑아내면(res.next()) Map 형태를 이루고 있는 듯?
				// key-value쌍으로 되있는 방식이라 get~()으로 뽑는 것.
				// 각 value에 맞는 타입에 맞춘 get()으로 원하는 key만 골라서 출력하는 것.
				
			}
		} catch (SQLException e) { // 이제 여기서 이걸 처리해야 함
			e.printStackTrace();
		}
		
		// DB 연결 해제
		ms.disconnect(); // 이것도 꼭 해야함(안 하면 메모리 낭비)
	}
}
