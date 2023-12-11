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
	String selectQuery = "select `id`, `nickname` from `seller` order by `id`";
	ResultSet res = ms.select(selectQuery);
%>
<section class="d-flex justify-content-center">
	<div id="new">
		<form method="post" action="/lesson04/quiz03_insert">
			<div class="my-5 display-4">
				물건 올리기
			</div>
			
			<%-- id, title, price 3개 div d-flex 하는 부분 --%>
			<div class="d-flex justify-content-between mb-3">
			
				<%-- SellerId select --%>
				<div class="col-3">
					<select name="sellerId" class="form-control">
						<option value="0">-아이디 선택-</option>
						<%
						while (res.next()) {
						%>
						<option value="<%= res.getInt("id") %>">
							<%= res.getString("nickname") %>
						</option>
						<%
						}
						%>
					</select>
				</div>
				
				<%-- 상품 title --%>
				<div class="col-6">
					<input type="text" name="title" class="form-control" placeholder="제목">
				</div>
				
				<%-- 상품 가격 --%>
				<div class="col-3">
					<div class="input-group">
						<input type="text" name="price" class="form-control" placeholder="가격">
						<div class="input-group-append">
							<span class="input-group-text">원</span>
						</div>
					</div>
				</div>
			</div>
			<%-- 3종 div d-flex끝 --%>
			
			<%-- description textarea 부분 (null 허용) --%>
			<div class="mb-3">
				<textarea class="form-control" name="description" rows="5"></textarea>
			</div>
			
			<%-- 이미지 url(productUrl) (null 허용) --%>
			<div class="mb-3">
				<div class="input-group">
	  				<div class="input-group-prepend">
	    				<span class="input-group-text">이미지 url</span>
	  				</div>
	  				<input type="text" name="productUrl" class="form-control">
				</div>
			</div>
			
			<%-- submit 버튼 --%>
			<div>
				<input id="submit" type="submit" value="저장" class="btn btn-light form-control">
			</div>
		</form>
	</div>
</section>
<%
	// DB 해제
	ms.disconnect();
%>