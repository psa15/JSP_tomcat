<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>

<%
	//http://192.168.0.20:8888/ch04/requestTest2.jsp
	//자신의 컴퓨터ip로 테스트
	
	//http://192.168.0.20:8888/ch04/requestTest2.jsp?userid=sua&addr=김지원
	//주소의 ? 뒤에 오는 문자열(userid부터)을 쿼리스트링이라고 함 -> 일종의 파라미터
	
	//names와 values의 값 순서와 개수가 같다, 문자배열의 길이가 같다
	String[] names = {
			"프로토콜이름", 
			"서버이름", 
			"method방식",
			"context 경로", 
			"Host", 
			"URI", 
			"URL", 
			"QueryString 쿼리스트링",
			"접속한 클라이언트IP"
		};
	String[] values = { //순서는 names의 값과 같음
			request.getProtocol(), 
			request.getServerName(),
			request.getMethod(),
			request.getContextPath(),
			request.getRemoteHost(),
			request.getRequestURI(), 
			request.getRequestURL().toString(), //Stringbuffer성격이라 String으로 변환
			request.getQueryString(),
			request.getRemoteAddr()
	};
%>
<h2>웹 브라우저와 웹서버 정보표시</h2>

<%
	for(int i=0; i<names.length; i++) {
%>
<%=names[i]%> : <%=values[i] %>	<br>	
	<%}%>
	
<h2>헤더의 정보 표시</h2>
<%
	Enumeration<String> en = request.getHeaderNames();
	//네트워크가 서로 정보를 주고 받을 때의 단위 : 패킷
	
	String headerName = "";
	String headerValue="";
	
	while(en.hasMoreElements()) {//데이터가 존재하면 true
		headerName = en.nextElement();
		headerValue = request.getHeader(headerName);
		out.println(headerName + " : " + headerValue + "<br>");
	}
	
%>