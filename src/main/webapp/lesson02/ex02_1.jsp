<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 위에 html, utf-8등의 모든 정보들이 다 써있다. 실제로 검사해보면 html 파일로 만들어진다. -->
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>결과</title>
	</head>
	<body>
		<!-- Servlet 역활 페이지 -->
		
		<h1>결과</h1>
		<b>아이디</b>
		<%= request.getParameter("user_id") %><br> <!--  request가 내장되어있어서 그냥 쓰면 된다. -->
		<b>이름</b>
		<%= request.getParameter("name") %><br>
		<b>나이</b>
		<%= request.getParameter("age") %>

	</body>
</html>