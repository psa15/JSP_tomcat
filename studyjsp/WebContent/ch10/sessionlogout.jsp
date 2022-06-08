<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	session.invalidate(); //모든 세션 정보 소멸하기 = 로그아웃
%>

<script>
	alert("로그아웃 완료");
	location.href = "sessionLogin.jsp";
</script>