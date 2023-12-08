package com.test.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MysqlService {
	// singleton으로 할 예정
	
	private static MysqlService mysqlService = null;
	// final 안붙였으니 한번은 세팅 가능.
	// 일단 new를 안해도 데이터가 올라가 있기는 함.
	
	// 도메인 뒤에 접속할 데이터베이스 명까지 적는다.
	private static final String url = "jdbc:mysql://localhost:3306/test_230914";
	// static final 붙이면 다른 사람이 못 바꿈
	// jdbc : 자바로 들어간다?
	// mysql:// :일종의 벽?
	// 그 뒤로 도메인+DB명
	
	private static final String id = "root";
	private static final String password = "root";
	// mysql 만들 때 정했던 id와 password
	
	private Connection conn = null;
	// import. 안되면 아까 .jar 환경세팅 안한 것이다.
	
	private Statement statement;
	// java.sql.Statement import
	
	private ResultSet res;
	// import
	
	// Singleton 패턴
	// : MysqlService라는 객체가 단 하나만 생성되도록 하는 디자인 패턴
	// why?) DB연결을 여러 객체에서 하지 않도록
	public static MysqlService getInstance() {
		// 클래스로 메소드 쓸려고 static
		// 리턴은 MysqlService
		// 메소드 명은 일반적으로 getInstance()
		
		if (mysqlService == null) {
			mysqlService = new MysqlService(); // 딱 한번만 new 선언.
			// 누가 getInstance()로 불렀을 때 => 딱 한번만 new 선언을 한다.
		}
		return mysqlService;
	} // 이게 Singleton
	
	
	// DB 접속
	public void connect() {
		try {
			// 1. 드라이버 메모리에 로딩
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			// 새로 추가된 jar로 사용 가능
			// 예외처리는 여기서 하겠다(try-catch)
			
			// 2. DB Connection
			conn = DriverManager.getConnection(url, id, password);
			// url, id, password를 보내서 연결 할 것임. 이 connection 정보? 는 Connection conn에 저장
			
			// 3. 쿼리 실행 준비(CRUD 할수 있는 준비) => statement
			statement = conn.createStatement();
			// 이 객체가 쿼리를 실행하는 객체
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	// DB 연결 해제
	public void disconnect() {
		// 연결 해제는 접속에서 거꾸로 올라가는 것.
		
		try {
			statement.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// CUD => 리턴은 없어도 됨.
	public void update(String query) throws SQLException { 
		statement.executeUpdate(query); // 여기서 오류 났다면 90프로 요청하는 쿼리쪽 잘못이므로 throws
	}
	
	// R => 결과값(리턴)을 받아와야 됨. => 결과는 ResultSet res에 담긴다
	public ResultSet select(String query) throws SQLException {
		res = statement.executeQuery(query);
		return res;
	}
}
