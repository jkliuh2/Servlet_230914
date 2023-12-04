<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>결과</title>
	</head>
	<body>
		<%
			// request para
			String nickname = request.getParameter("nickname");
			String hobby = request.getParameter("hobby");
			String animal = request.getParameter("animal"); // radio타입
			String fruit = request.getParameter("fruit"); // select타입
			
			// ★★★ checkbox 타입: 같은 name에 여러개의 value가 들어감 -> getParameterValues
			// 메소드 리턴타입 보면 -> String[] 
			String[] foodArr = request.getParameterValues("food");
		%>
		
		<table border="1">
			<tr>
				<th>별명</th>
				<td><%= nickname %></td>
			<tr>
				<th>취미</th>
				<td><%= hobby %></td>
			<tr>
				<th>선호하는 동물</th>
				<td><%= animal %></td>
			<tr>
				<th>좋아하는 과일</th>
				<td><%= fruit %></td>
			<tr>
				<th>선호하는 음식</th>
				<td><%-- <%= foodArr %> --%>
					<%
						String result = ""; // + 할꺼면 초기화를 null로 하면 안된다.
						
						if (foodArr != null) { // null이 아닐때만 출력. null이면 빈칸.
						for (String food : foodArr) { // 향상된 for문 -> foodArr이 null이면 NPE
							result += food + ",";
						}
						result = result.substring(0, result.length() - 1); // 맨 끝에 , 추출하기.
						
						out.print(result);
						}
					%>
				</td>
		</table>
	</body>
</html>