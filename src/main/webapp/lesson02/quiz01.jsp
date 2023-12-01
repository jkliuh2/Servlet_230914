<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퀴즈01</title>
</head>
<body>
	<!-- 1. 1부터 n까지의 합계를 구하는 함수
jsp의 선언문 <%! %> 문법을 사용해서 1부터 N까지의 합을 구하는 함수를 만드세요. -->
<%!
	public int sumNum(int num) {
	int sum = 0;
	for (int i = 1; i <= num; i++) {
		sum += i;
	}
	return sum;
}
%>

	<!-- 2. 점수들의 평균 구하기
스크립틀릿(scriptlet) <% %> 문법을 사용해서 주어진 점수들의 평균을 구하세요. -->
<%
	int[] scores = {80, 90, 100, 95, 80}; // 주어지는 배열
	
	double averageScores = 0;
	for (int i = 0; i < scores.length; i++) {
		averageScores += (double)scores[i] / scores.length;
	}
%>
	
	<!-- 3. 채점 결과
아래 채점표로 시험점수가 몇점인지 구하세요. -->
	<%
	List<String> scoreList = Arrays.asList(new String[]{"X", "O", "O", "O", "X", "O", "O", "O", "X", "O"});
	// import 시키는 법. List, Arrays 부분 뒤쪽에 커서를 두고 ctrl + space -> util 을 선택해서 import
	
	double result = 0;
	for (int i = 0; i < scoreList.size(); i++) {
		String ox = scoreList.get(i);
		
		if (ox.equals("O")) { // 정답 맞으면.
			result += 100 / (double)scoreList.size(); 
		}
	}
	%>
	
	<!-- 4. 나이 구하기
주어진 생년월일을 가진 사람의 나이를 구하세요. -->
	<%
	String birthDay = "20010820";
	
	int age = 2023 - Integer.parseInt(birthDay.substring(0, 4));
	
	// java의 PrintWriter를 따로 선언을 하지 않고 이렇게만 해도 출력이 된다.
	//out.print(age); // 확인용
	%>
	
	
	<!-- 위의 모든 내용들 출력 -->
	<h1>1부터 50까지의 합은 <%= sumNum(50) %>입니다.</h1>
	<h1>평균 점수는 <%=averageScores %>입니다</h1>
	<h1>채점 결과는 <%= result %>점 입니다.</h1>
	<h1>20010820의 2023년 기준 나이는 <%= age %>세 입니다.</h1>
</body>
</html>