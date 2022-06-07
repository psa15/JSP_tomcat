<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--한글 인코딩 --%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="registerBean" class="ch08.register.RegisterBean">
	<%--
	<jsp:setProperty name="registerBean" property="userId"/>
	<jsp:setProperty name="registerBean" property="passwd"/>
	<jsp:setProperty name="registerBean" property="name"/>
	 --%>
	 <jsp:setProperty name="registerBean" property="*"/>
</jsp:useBean>

<%
	//reg_date(가입날짜) 처리
	registerBean.setReg_date(new Timestamp(System.currentTimeMillis())); //현재시간 등록
%>

아이디: <jsp:getProperty name="registerBean" property="userId"/> <br>
비밀번호: <jsp:getProperty name="registerBean" property="passwd"/> <br>
이름: <jsp:getProperty name="registerBean" property="name"/> <br>
가입일: <jsp:getProperty name="registerBean" property="reg_date"/> <br>