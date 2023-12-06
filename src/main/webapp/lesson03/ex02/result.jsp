<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레이아웃 전체 페이지</title>
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>
	
	<!-- 내부 스타일시트 -->
	<style>
		header {height:50px;}
		.section {height:900px;}
		.content {height:90%;}
		footer {height:10%}
	</style>
</head>
<body>
	<div id="wrap">
		<header class="bg-success">
			<jsp:include page="header.jsp" />
			<!-- 위 태그는 반드시 닫혀야 함. 근데 태그 사이에 내용이 없다?
			위 처럼 /> 해주면 된다. -->
			<!-- 동적 방식 -->
		</header>
		<div class="section d-flex">
			<!-- aside 조각페이지 -->
			<jsp:include page="menu.jsp" />
			<div class="col-10 bg-warning">
				<%
				String viewName = "content1.jsp";
				// 위의 viewName을 아래의<jsp>에 껴 넣을 것임. 
				// viewName이 바뀌면(content2) 나오는 content 내용이 바뀜.
				// => 이건 Spring 가서 배울 것.
				%>
			
				<!-- content 조각페이지 
				page 주소만 바꿔주면 간단하게 content 내용이 바뀐다.-->
				<jsp:include page="<%= viewName %>" />
				<!-- footer 조각페이지 -->
				<jsp:include page="footer.jsp" />
			</div>
		</div>
	</div>
</body>
</html>