<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>길이 변환 결과</title>
		
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
		<%
			// request para
			double cm = Double.parseDouble(request.getParameter("cm"));
			String[] lengthTypeArr = request.getParameterValues("lengthType");
		%>
		<div class="container">
			<h1>길이 변환 결과</h1>
			<h3><%= cm %>cm</h3>
			<hr>
			
			<h2>
			<%
				if (lengthTypeArr != null) { // null이 아닐 경우.
					for (String type : lengthTypeArr) {
						double conversion = 0;
						if (type.equals("inch")) {
							conversion = cm / 2.54;
							out.print(conversion + " in<br>");
						} else if (type.equals("yard")) {
							conversion = cm / 91.44;
							out.print(conversion + " yd<br>");
						} else if (type.equals("feet")) {
							conversion = cm / 30.48;
							out.print(conversion + " ft<br>");
						} else if (type.equals("meter")) {
							conversion = cm / 100;
							out.print(conversion + " m<br>");
						}
					}
				}
			%>
			</h2>
		</div>
	</body>
</html>