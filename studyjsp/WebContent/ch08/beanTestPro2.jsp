<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--자바빈 클래스 이용 --%>
<jsp:useBean id="testBean" class="ch08.bean.TestBean">
	<jsp:setProperty name="testBean" property="id"/>
</jsp:useBean>

입력한 아이디: <jsp:getProperty name="testBean" property="id"/>
