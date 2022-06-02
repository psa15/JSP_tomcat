<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<h2>request 예제 - 요청 메소드</h2>

<%
	String userName = request.getParameter("userName");
	int age = Integer.parseInt(request.getParameter("age"));
	String gender = request.getParameter("gender"); //m아니면 f
	String hobby = request.getParameter("hobby");
	
	if(gender.equals("m")) {
		gender = "남자";
	}else {
		gender = "여자";
	}
%>

<%=userName %>님의 정보는 다음과 같습니다.<br>
나이: <%=age %><br>
성별: <%=gender %><br>
취미: <%=hobby %>