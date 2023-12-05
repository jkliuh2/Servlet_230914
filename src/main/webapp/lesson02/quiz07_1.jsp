<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 부트스트랩CDN -->
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
</head>
<body>
	<%
	// List, Map
	List<Map<String, Object>> list = new ArrayList<>();
	Map<String, Object> map = new HashMap<String, Object>() {
		{
			put("name", "버거킹");
			put("menu", "햄버거");
			put("point", 4.3);
		}
	};
	list.add(map);
	map = new HashMap<String, Object>() {
		{
			put("name", "BBQ");
			put("menu", "치킨");
			put("point", 3.8);
		}
	};
	list.add(map);
	map = new HashMap<String, Object>() {
		{
			put("name", "교촌치킨");
			put("menu", "치킨");
			put("point", 4.1);
		}
	};
	list.add(map);
	map = new HashMap<String, Object>() {
		{
			put("name", "도미노피자");
			put("menu", "피자");
			put("point", 4.5);
		}
	};
	list.add(map);
	map = new HashMap<String, Object>() {
		{
			put("name", "맥도날드");
			put("menu", "햄버거");
			put("point", 3.8);
		}
	};
	list.add(map);
	map = new HashMap<String, Object>() {
		{
			put("name", "BHC");
			put("menu", "치킨");
			put("point", 4.2);
		}
	};
	list.add(map);
	map = new HashMap<String, Object>() {
		{
			put("name", "반올림피자");
			put("menu", "피자");
			put("point", 4.3);
		}
	};
	list.add(map);

	// request para
	String menu = request.getParameter("menu"); // 검색 메뉴
	
	boolean flag = false;
	flag = Boolean.parseBoolean(request.getParameter("point4")); // 체크박스 표시
	// point4가 true면 true, 그 외(null포함)면 false.

	/*
	boolean flag = false;
	if (point4 != null) { // point4 체크박스가 체크되면 flag -> true
		flag = true;
	}
	*/
	%>

	<div class="container">
		<h1 class="text-center">검색 결과</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th>메뉴</th>
					<th>상호</th>
					<th>별점</th>
				</tr>
			</thead>
			<tbody>
				<%
				Iterator<Map<String, Object>> iter = list.iterator();
				while (iter.hasNext()) {
					Map<String, Object> food = iter.next();

					// 4점 이하 체크시 작동하는 제어문
					if (flag) { // 4점 이하 제외 체크되면
						double point = (double)food.get("point");
						if (point <= 4) { // 4점 이하면?
					continue; // 아래 모두 생략하고 반복분으로.
						}
					}

					// 출력을 위한 if문
					if (food.get("menu").equals(menu)) {
						// iterator에서 뽑아낸 menu의 value가 검색한 menu와 일치할 때
				%>
				<tr>
					<td><%=food.get("menu")%></td>
					<td><%=food.get("name")%></td>
					<td><%=food.get("point")%></td>
				</tr>
				<%
					} // menu if 문의 끝
					// 만약, menu가 일치하지 않으면 출력X

				} // while문 끝
				%>
			</tbody>
		</table>
	</div>
</body>
</html>