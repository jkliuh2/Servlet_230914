package com.test.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

// 모든 링크는 이 필터를 거친다. 라는 뜻이다.
@WebFilter("/*")
public class CharacterEncodingFilter implements Filter {
	// Filter는 인터페이스 구현 방식.

	// 반드시 구현해야 하는 메소드
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		// 필터를 통과할 때 인코딩 설정(글자 인코딩)
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		// ContentType은 자주 바꿔서 여기에는 하지 않는다.
		
		// 이것을 Chain에 적용한다.
		chain.doFilter(request, response);
		
		// 이에 대한 링크는 xml or 어노테이션
		// 둘 중 하나만 걸어야 한다.
	}

}
