<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>퀴즈07</title>
		
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
		<div class="container">
			<h1>메뉴 검색</h1>
			<form method="post" action="/lesson02/quiz07_1.jsp">
				<div class="d-flex align-items-center">
					<input type="text" name="menu" class="form-control col-3 mr-3" placeholder="메뉴를 입력하세요">
					<label class="m-0">
						<input type="checkbox" id="point4" name="point4" value="true">
						4점 이하 제외
					</label>
				</div>
				<input type="submit" value="검색" class="btn btn-success mt-2">
			</form>
		</div>
	</body>
</html>