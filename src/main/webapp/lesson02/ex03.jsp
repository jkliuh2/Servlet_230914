<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Post METHOD Form 태그</title>
	</head>
	<body>
		<form method="post" action="/lesson02/ex03_1.jsp">
			1. 별명은 무엇입니까?
			<input type="text" name="nickname"><br><br>
			2. 취미는 무엇입니까?
			<input type="text" name="hobby"><br><br>
			3. 강아지 or 고양이?
			<label for="dog">강아지</label>
			<!-- label:for -> input:id 와 매칭 -->
			<input type="radio" id="dog" name="animal" value="dog">
			<!-- name의 의미: 1. 그룹핑 2. 서버에 넘겨지는 key 이름 -->
			<!-- 즉 animal=dog 의 쿼리스트링으로 넘어간다고 보면 된다. -->
			
			<label for="cat">고양이</label>
			<input type="radio" id="cat" name="animal" value="cat">
			<br><br>
			4. 다음 중 선호하는 것을 모두 고르세요.<br>
			<label for="mintcho">민트초코</label>
			<input type="checkbox" id="mintcho" name="food" value="민트초코">
			<label for="pizza">하와이안 피자</label>
			<input type="checkbox" id="pizza" name="food" value="하와이안 피자">
			<label for="pupa">번데기</label>
			<input type="checkbox" id="pupa" name="food" value="번데기">
			<br><br>
			
			5. 좋아하는 과일을 선택하세요.<br>
			<!-- select에 name 지정. value는 알아서 선택된 옵션값 그대로 들어간다. -->
			<select name="fruit">
				<option>사과</option>
				<option>바나나</option>
				<option>복숭아</option>
				<option>딸기</option>
				<option>포드</option>
			</select><br><br>
			
			<button type="submit">제출</button>
		</form>
	</body>
</html>