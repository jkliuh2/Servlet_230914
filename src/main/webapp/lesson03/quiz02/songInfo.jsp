<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 아티스트 정보 

    Map<String, Object> artistInfo = new HashMap<>();
    artistInfo.put("name", "아이유");
    artistInfo.put("debute", 2008);
    artistInfo.put("agency", "EDAM엔터테인먼트");
    artistInfo.put("photo", "http://image.genie.co.kr/Y/IMAGE/IMG_ALBUM/081/867/444/81867444_1616662460652_1_600x600.JPG");


// 아이유 노래 리스트 
    List<Map<String, Object>> musicList = new ArrayList<>();

    Map<String, Object> musicInfo = new HashMap<>();
    musicInfo.put("id", 1);
    musicInfo.put("title", "팔레트");
    musicInfo.put("album", "Palette");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://upload.wikimedia.org/wikipedia/ko/b/b6/IU_Palette_final.jpg");
    musicInfo.put("time", 217);
    musicInfo.put("composer", "아이유");
    musicInfo.put("lyricist", "아이유");
    musicList.add(musicInfo);

    musicInfo = new HashMap<>();
    musicInfo.put("id", 2);
    musicInfo.put("title", "좋은날");
    musicInfo.put("album", "Real");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://upload.wikimedia.org/wikipedia/ko/3/3c/IU_-_Real.jpg");
    musicInfo.put("time", 233);
    musicInfo.put("composer", "이민수");
    musicInfo.put("lyricist", "김이나");
    musicList.add(musicInfo);

    musicInfo = new HashMap<>();
    musicInfo.put("id", 3);
    musicInfo.put("title", "밤편지");
    musicInfo.put("album", "palette");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://upload.wikimedia.org/wikipedia/ko/b/b6/IU_Palette_final.jpg");
    musicInfo.put("time", 253);
    musicInfo.put("composer", "제휘,김희원");
    musicInfo.put("lyricist", "아이유");
    musicList.add(musicInfo);

    musicInfo = new HashMap<>();
    musicInfo.put("id", 4);
    musicInfo.put("title", "삐삐");
    musicInfo.put("album", "삐삐");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://image.genie.co.kr/Y/IMAGE/IMG_ALBUM/081/111/535/81111535_1539157728291_1_600x600.JPG");
    musicInfo.put("time", 194);
    musicInfo.put("composer", "이종훈");
    musicInfo.put("lyricist", "아이유");
    musicList.add(musicInfo);

    musicInfo = new HashMap<>();
    musicInfo.put("id", 5);
    musicInfo.put("title", "스물셋");
    musicInfo.put("album", "CHAT-SHIRE");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://image.genie.co.kr/Y/IMAGE/IMG_ALBUM/080/724/877/80724877_1445520704274_1_600x600.JPG");
    musicInfo.put("time", 194);
    musicInfo.put("composer", "아이유,이종훈,이채규");
    musicInfo.put("lyricist", "아이유");
    musicList.add(musicInfo);

    musicInfo = new HashMap<>();
    musicInfo.put("id", 6);
    musicInfo.put("title", "Blueming");
    musicInfo.put("album", "Love poem");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://upload.wikimedia.org/wikipedia/ko/6/65/%EC%95%84%EC%9D%B4%EC%9C%A0_-_Love_poem.jpg");
    musicInfo.put("time", 217);
    musicInfo.put("composer", "아이유,이종훈,이채규");
    musicInfo.put("lyricist", "아이유");
    musicList.add(musicInfo);
%>

<%
	Map<String, Object> selectMusic = null; // 출력할 노래(아직 비어있음)
	
	// 1. <a>태그로 들어왔을 때 => id
	if (request.getParameter("id") != null) { // id가 null이 아닐 때만 request para를 받겠다.
		// => 그냥 막 받으면 오류 생긴다.
		
		int id = Integer.parseInt(request.getParameter("id")); // 검색한 노래의 id => <a>로 보내는 것
		// 어지간하면 id로 찾는 것이 좋다(DB에서 id 검색은 속도가 빠름)
		
		Iterator<Map<String, Object>> iter = musicList.iterator();
		while (iter.hasNext()) {
			Map<String, Object> songInfo = iter.next();
			if ((int)songInfo.get("id") == id) { // id가 일치
				selectMusic = songInfo; // 출력할 노래에 등록.
				break; // 반복문 끝.
			}
		}
	}
	
	// 2. header에서 form태그 검색으로 들어왔을 때 => title
	if (request.getParameter("title") != null) {
		String title = request.getParameter("title"); // form태그로 넘어온 것.
		
		for (Map<String, Object> music : musicList) {
			if (music.get("title").equals(title)) {
				selectMusic = music	; // 출력할 노래에 등록.
				break;
			}
		}
	}
%>   
 
<%-- 곡 정보 영역 --%>
<div>
	<%
	// 3. selectMusic이 null인 경우. 잘못 검색할 경우.
	if (selectMusic == null) {
	%>
	<h4>곡 정보가 없습니다.</h4>
	<%	
	} else { // 곡 정보가 있을 때 아래의 코드 출력
	%>
	
	<h4>곡 정보</h4>
	<div class="d-flex border border-success p-3">
		<div>
			<img 
				src="<%= selectMusic.get("thumbnail") %>" 
				alt="썸네일 이미지" width="200">
		</div>
		<div class="ml-3">
			<div class="display-4"><%= selectMusic.get("title") %></div>
			<div class="text-success font-weight-bold"><%= selectMusic.get("singer") %></div>
			<div class="d-flex music-info mt-3">
				<div>
					<div>앨범</div>
					<div>재생시간</div>
					<div>작곡가</div>
					<div>작사가</div>
				</div>
				<div class="ml-3">
					<div><%= selectMusic.get("album") %></div>
					<div>
					<%
						int time = (int)selectMusic.get("time");
						if (time % 60 >= 10) {
							out.print((time / 60) + " : " + (time % 60));
						} else {
							out.print((time / 60) + " : 0" + (time % 60));
						}
					%>
					</div>
					<div><%= selectMusic.get("composer") %></div>
					<div><%= selectMusic.get("lyricist") %></div>
				</div>
			</div>
		</div>
	</div>
	<%
	} // 3. else문의 끝
	%>
</div>
<%-- 가사 영역 --%>
<div class="mt-5">
	<h4>가사</h4>
	<hr>
	<b>가사 정보 없음</b>
</div>