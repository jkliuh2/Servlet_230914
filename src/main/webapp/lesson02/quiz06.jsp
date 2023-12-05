<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>퀴즈06</title>
		
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
			List<String> goodsList = Arrays.asList(new String[]{ 
			    "저지방 우유", "요플레 4개", "딸기 1팩", "삼겹살 300g", "생수 6개", "주방 세제"
			});
		%>
		<!-- 위의 List를 테이블로 만든다. -->
		
		<div class="container">
			<h1 class="text-center">장보기 목록</h1>
			<table class="table text-center">
			<!-- table:부트스트랩 테이블 모양
				 text-center:테이블 내 모든 텍스트들 전부 가운데 정렬
			 -->
				<thead>
					<tr>
						<th>번호</th>
						<th>품목</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (int i = 0; i < goodsList.size(); i++) {
							String goods = goodsList.get(i); // List의 i번째 인덱스의 value
					%>
					<tr>
						<td><%= i + 1 %></td>
						<td><%= goods %></td><!-- 그냥 여기에 바로 goodsList.get(i)를 써도 무관 -->
					</tr>
					<%
						} // for문 끝
					%>
				</tbody>
			</table>
		
		</div>
		
	</body>
</html>