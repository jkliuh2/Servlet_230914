<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홍당무 마켓 리스트</title>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<style>
	header {height:100px; background-color:#E97341;}
	nav {height:80px; background-color:#E97341;}
	section {min-height:200px;}
	footer {height:100px;}
	
	a {text-decoration:none;}
	a:hover {text-decoration:none;}
	.menu-text {font-weight:bold; color:white;}
	.menu-text:hover {color:#999;}
	
	#goods-parent-box {gap:20px 15px; margin-top:20px}
	#goods-box {border:solid; border-color:#E97341;}
	
	.carrot {color:#E97341;}
	#price {color:#999; font-size:small;}
	
	#new {width:800px;}
</style>
<body>
	<div id="wrap" class="container">
		<header class="d-flex justify-content-center align-items-center">
			<jsp:include page="header.jsp" />
		</header>
		<nav class="d-flex align-items-center">
			<jsp:include page="menu.jsp" />
		</nav>
		<jsp:include page="section_new.jsp" />
		<footer class="d-flex justify-content-center align-items-center">
			<jsp:include page="footer.jsp" />
		</footer>
	</div>

	<%-- jQuery 부분 --%>
	<script>
		$(document).ready(function () {
			// form 버튼이 click 됬을 때 유효성 검사 하기(null 비허용 애들)
			$("#btn-submit").on("click", function() {
				//alert("확인 알람");
				
				// select 0번 제외(아이디 선택 칸)
				let id = $("input[name=sellerId]").val();
				if (id == 0) {
					alert("아이디를 선택하세요.");
					return false;
				}
				
				// 제목 null 비허용
				let title = $("input[name=title]").val();
				if (title == "") {
					alert("제목을 입력하세요.");
					return false;
				}
				
				// 가격 null 비허용
				let price = $("input[name=price]").val();
				if (price == "") {
					alert("가격을 입력하세요.");
					return false;
				}
				
				alert(
					"아이디: " + id
					+ "\n제목: " + title
					+ "\n가격: " + price + "원"
				);
				
			}); // submit 버튼 클릭 끝
		}); // ready 이벤트 끝
	</script>
</body>
</html>