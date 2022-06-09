<%@page import="ch10.logon.LogonBean"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//삭제하기 위해 primary key 받아오기
	String userid = request.getParameter("userid");

	LogonBean logon = LogonBean.getInstance();
	logon.deleteMember(userid);
	
	response.sendRedirect("selectList.jsp");

%>
