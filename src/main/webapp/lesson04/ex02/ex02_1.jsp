<%@page import="java.sql.ResultSet"%>
<%@page import="com.test.common.MysqlService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 목록</title>
</head>
<body>
<%
	// DB 연결
	MysqlService ms = MysqlService.getInstance();
	ms.connect();
	
	// select DB
	String query = "select * from `new_user`";
	ResultSet result = ms.select(query); // 에러처리는 알아서 됨. / import 필요
%>
	<h1>사용자 목록</h1>
	
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>이메일</th>
				<th>자기소개</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
		<%
			while (result.next()) {
				
		%>
			<tr>
				<td><%= result.getInt("id") %></td>
				<td><%= result.getString("name") %></td>
				<td><%= result.getString("yyyymmdd") %></td>
				<td><%= result.getString("email") %></td>
				<td><%= result.getString("introduce") %></td>
				<td><a href="/lesson04/ex02_delete?id=<%= result.getInt("id") %>">삭제</a></td>
			</tr>
		<%
			} // while문 끝
		%>
		</tbody>
	</table>
<%
	// DB 연결 해제
	ms.disconnect();
%>
</body>
</html>