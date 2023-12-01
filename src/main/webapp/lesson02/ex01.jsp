<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 위의 내용이 없으면 JSP로 동작할 수 없다. -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<!-- HTML 주석 -->
	<%-- JSP 주석 
		JSP 주석들은 브라우저에서 다 사라져서 보이지 않는다.--%>
	<%
		// scriptlet -> 나중에 spring 가면 절대 쓰지 않을 것.
		// 자바 문법 시작
	
		// 1~10 합계 구하기
		int sum = 0;
		for (int i = 1; i <= 10; i++) {
			sum += i;
	}
%>

	<b>합계:</b>
	<input type="text" value="<%= sum %>">
	<!-- 표현식(Expression) sum 값이 들어감. = 주의 -->
	<br>

	<%!
	// 선언문 - 클래스 같은 느낌 !주의
	
	// 필드
	private int num = 100; // private가 의미 없긴 함
	
	// 메소드
	public String getHelloWorld() {
		return "Hello World";
	}
%>

<%= getHelloWorld() %><br> <!-- 선언했던 메소드를 Expression으로 가져옴 -->
<%= num %>

</body>
</html>