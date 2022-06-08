<%@page import="ch10.logon.*"%>
<%@page import="java.sql.*"%>
<%--java.sql 패키지가 여러개 사용될 예정이라 * 처리 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("utf-8"); %>
<%
	String userId = request.getParameter("userId");
	String passwd = request.getParameter("passwd");
	String username = request.getParameter("username");
	String addr = request.getParameter("addr");
	String tel = request.getParameter("tel");
	
	Member memObj = new Member(userId, passwd, username, addr, tel, null);
	LogonBean logon = LogonBean.getInstance();
	
		//1)여러개 파라미터를 이용한 작업
		//logon.insertMember(userId, passwd, username, addr, tel, null);
	
	
	//2) 클래스(객체)를 이용한 작업
	
	//insert문이라 reg_date는 null
	logon.insertMember2(memObj);
	
	//response.sendRedirect("insertSelectList.jsp");
%>

<script>
	alert("회원가입이 완료되었습니다.");
	location.href = "deleteSelectList.jsp"
</script>