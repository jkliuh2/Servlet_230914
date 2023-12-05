<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>제어문 사용</title>
	</head>
	<body>
		<%
			// Map을 테이블로 표현하기
			// {"키":값} : json(JavaScript) / {"키"=값} : Java
			// {"korean"=85, "english"=72, "math"=90, "science"=100}
			// 위와 같은 Map을 표현한다.
			Map<String, Integer> scoreMap = new HashMap<>();
			scoreMap.put("korean", 85);
			scoreMap.put("english", 72);
			scoreMap.put("math", 90);
			scoreMap.put("science", 100);
		%>
		
		<!-- 위에서 선언한 Map을 테이블로 만들 것임. => 이 때, 반복문을 사용해서 테이블태그를 만든다. -->
		<table border="1">
			<%
				Iterator<String> iter = scoreMap.keySet().iterator(); // keySet() + Iterator
				while (iter.hasNext()) {
					String key = iter.next(); // 과목명 = key
			%>
			<tr>
				<!-- <th><%= key %></th> --> <!-- {}내부이므로 key 변수가 접근이 가능하다. -->
				<th>
					<%
						if (key.equals("korean")) { // 과목명 출력되는 것을 한글로 바꾸는 작업.
							out.print("국어");
						} else if (key.equals("english")) {
							out.print("영어");
						} else if (key.equals("math")) {
							out.print("수학");
						} else if (key.equals("science")) {
							out.print("과학");
						}
					%>
				</th>
				<td><%= scoreMap.get(key) %></td>
			</tr>
			<%
				} // while문의 닫힘 중괄호. 중괄호 사이가 반복된다!
			%>
		</table>
	</body>
</html>