<%@page import="java.sql.ResultSet"%>
<%@page import="com.test.common.MysqlService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	// DB 연결
	MysqlService ms = MysqlService.getInstance();
	ms.connect();
	
	// select(join문으로)
	// 상품이미지, 상품 글 타이틀, 상품 가격, 작성자 이름 + 상품id(내림차순 정렬용)
	String selectQuery = "select  B.id as id, B.productUrl as url, "
			+ "B.title as title, B.price as price, A.nickname as nickname " + "from `seller` as A "
			+ "join `used_goods` as B " + "on A.id = B.sellerId " + "order by B.id desc";
	ResultSet res = ms.select(selectQuery);
%>
<section id="goods-parent-box" class="d-flex flex-wrap">
	<%
		while (res.next()) {
	%>
	<article id="goods-box" class="p-2">
		<img src="
			<%
			String url = res.getString("url");
			if (url == null) { // url이 없을때(이미지 없음 표시)
				out.print("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdGsfDYob65sPl7NQAuzKvEv5-1DRRppnwymDf0FnPww&s");
			} else {
				out.print(url);
			}
			%>"
			alt="제품사진" width="340" height="200">
		<div class="font-weight-bold"><%=res.getString("title")%></div>
		<div id="price" class="mt-2">
			<%=res.getString("price")%>원
		</div>
		<div class="carrot mt-2"><%=res.getString("nickname")%></div>
	</article>
	<%
		} // while문 끝
	%>
</section>
<%
	// DB 해제
	ms.disconnect();
%>
