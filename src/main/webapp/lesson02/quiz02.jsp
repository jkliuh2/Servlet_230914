<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Quiz02</title>
		
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
		<!-- 날짜, 시간 출력
a 태그를 이용하여 링크를 만드세요.
링크 클릭 시 날짜 또는 시간을 보여주기 위한 jsp 페이지로 이동하세요. -->
		<h1>날짜, 시간 링크</h1>
		<a href="/lesson02/quiz02_1.jsp?type=time" class="btn btn-info">현재 시간 확인</a>
		<a href="/lesson02/quiz02_1.jsp?type=date" class="btn btn-success">현재 날짜 확인</a>
	</body>
</html>