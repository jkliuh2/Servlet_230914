<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Quiz02_1</title>
		
		<!-- 부트스트랩CDN -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
		integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous"></script>
	</head>
	<body>
		<%
		// Request Parameter 받기.
		String type = request.getParameter("type");
		
		Date now = new Date();
		String result = null; // 최종 출력 할 String
		
		SimpleDateFormat sdf = null; // 얘를 밖으로 뺌. 이제 if 밖에서도 sdf 사용 가능.
		
		// 조건문+출력문
		if (type.equals("time")) { // 날짜 버튼
			sdf = new SimpleDateFormat("현재 시간은 HH시 mm분 ss초 입니다.");
		} else if (type.equals("date")) { // 시간 버튼
			sdf = new SimpleDateFormat("오늘 날짜는 yyyy년 MM월 dd일 입니다.");
		}
		result = sdf.format(now); // 얘를 밖으로 빼려면 sdf도 밖으로 빼야 한다.
		
		// out.print("<h1>" + result + "</h1>");
		%>
		
		<div class="container">
			<div class="display-4"><%= result %></div>
			<!-- display-4: 글자 크기 표시하는 부트스트랩 기능 -->
		</div>
	</body>
</html>