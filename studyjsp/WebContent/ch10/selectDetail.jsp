<%@page import="java.util.Date"%>
<%@page import="ch10.logon.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String userid = request.getParameter("userid");

	LogonBean logon = LogonBean.getInstance();
	Member member = logon.getMember(userid);
	
	String d_userid = member.getUserid(); 
	String d_username = member.getUSERNAME();
	String d_addr = member.getADDR();
	String d_tel = member.getTEL();
	Date d_reg_date = member.getREG_DATE();


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 정보</title>
</head>
<body>
	<dl>
		<dd>
			<label for="userId">아이디</label>
			<input type="text" name="userId" id="userId" value="<%=d_userid %>" readonly>
		</dd>
		<dd>
			<label for="username">이름</label>
			<input type="text" name="username" id="username" value="<%=d_username %>" readonly>
		</dd>
		<dd>
			<label for="addr">주소</label>
			<input type="text" name="addr" id="addr" value="<%=d_addr %>" readonly>
		</dd>
		<dd>
			<label for="tel">연락처</label>
			<input type="text" name="tel" id="tel" value="<%=d_tel %>" required>
		</dd>
		<dd>
			<label for="reg_date">등록 일자</label>
			<input type="text" name="reg_date" id="reg_date" value="<%=d_reg_date %>" required>
		</dd>
	</dl>
</body>
</html>