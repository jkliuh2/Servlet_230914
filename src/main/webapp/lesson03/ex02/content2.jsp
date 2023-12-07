<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="content bg-secondary">
	다른 내용이 들어있는 content2
	<hr>
	컨텐츠 영역에 들어갈 jsp 이름만 변경해서 다른 내용을 넣을 수 있도록 한다.<br>
	이 페이지에는 부트스트랩 임포트 코드가 없지만, 하나로 합쳐진 전체 jsp에서 적용된다.<br>
	현재 페이지는 실행 시 마다 동적으로 수행되고 실행된 결과가 <b>layout.jsp에 include</b>된다.<br>
	java 코드는 모든 jsp마다 따로 실행된다.
</section>

<!-- 사실 그렇게 좋은 코드는 아니다.
<section>부분을 그냥 두고 내부의 내용만 바꾸는 것이 좋다. -->