<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Quiz02_1</title>
	</head>
	<body>
		<%
		String type = request.getParameter("type");
		
		if (type.equals("time")) { // 날짜 버튼
			Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("현재 시간은 HH시 mm분 ss초 입니다.");
			out.print("<h1>" + sdf.format(now) + "</h1>");
			
		} else if (type.equals("date")) { // 시간 버튼
			Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("현재 날짜는 yyyy년 MM월 dd일 입니다.");
			out.print("<h1>" + sdf.format(now) + "</h1>");
		}
		%>
	</body>
</html>