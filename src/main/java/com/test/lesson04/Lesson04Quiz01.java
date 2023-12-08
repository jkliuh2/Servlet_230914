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

@WebServlet("/lesson04/quiz01")
public class Lesson04Quiz01 extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws IOException {
		
		// 응답값 = plain
		response.setContentType("text/plain");
		
		// DB 연결
		MysqlService ms = MysqlService.getInstance(); // ms 객체 생성
		ms.connect(); // DB와 연결
		
		// DB insert
		String insertQuery = "insert into `real_estate`"
				+ "(`realtorId`, `address`, `area`, `type`, `price`, `rentPrice`)"
				+ "value"
				+ "(3, '헤라펠리스 101동 5305호', 350, '매매', 1500000, NULL)"; // insert 쿼리문 작성
		try {
			ms.update(insertQuery); // 쿼리문 실행 => 알아서 insert 다 된다.
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// DB 출력
		PrintWriter out = response.getWriter();
		String selectQuery = "select * from `real_estate` order by `id` desc limit 10"; 
		// select 쿼리문 => 애초에 * 가 아닌 필요한 데이터(address, area, type)만 가져오는 것도 문제 없다
		try {
			ResultSet res = ms.select(selectQuery); // 쿼리문 실행 + 실행결과 나온 데이터 res에 저장
			while (res.next()) { // res를 순회하면서 웹페이지에 출력
				out.println("매물주소: " 	+ res.getString("address") 
						+ ", 면적: " + res.getInt("area")
						+ ", 타입: " + res.getString("type"));
				// 위는 바로 출력했으나, 변수에 담았다가 출력해도 문제 없음
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// 연결 해제
		ms.disconnect(); // 연결 해제
	}
}
