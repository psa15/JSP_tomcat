<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--이미 클라이언트는 쿠키를 가지고 있고 다시 서버에 요청시 함께 전송됨 -> 읽는 작업 --%>

<%
	//브라우저는 사이트를 재방문시 쿠키를 가지고 서버측에 접속하게 됨
	//클라이언트에게 생성해 준 쿠키를 읽는 작업
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null) {
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("id")) {
				out.println("cookie name: " + cookies[i].getName());
				out.println("cookie value: " + cookies[i].getValue());
			}
		}
	}
	
%>