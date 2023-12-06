<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 여긴 일부 페이지 -->    
<!-- 이 위의 구문은 남기고(jsp라는 구문이다) 나머지 html 부분을 전부 삭제. -->
<%@ page import="java.util.Calendar" %>
<!-- 자바의 Calendar import -->
<p>
	현재 시간: <%= Calendar.getInstance().getTime() %>
	<!-- 이제 Date 타입으로 나올 것임.(getTime()) -->
</p>
<!-- 
	정적 방식: 코드가 그대로 붙는다고 보면 된다.
	주의: 두 개의 페이지에서 같은 이름의 변수를 선언하면 오류가 난다.
 -->