<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>
<%
	String name = "김지원";
	String pageName = "includedParamTest.jsp"; 
	//includedParamTest.jsp?name=김지원&pageName=includedParamTest.jsp
	//? 앞을 메소드명으로, ? 뒤를 파라미터로

%>
포함하는 페이지 includeParamTest.jsp<br>
포함되는 페이지에 파라미터 값을 전달합니다.<br>

<hr>
<%--변수 표현식을 이용해 로직을 구성하여 값을 쓸 수 있음을 보여줌 --%>
<%--파일명을 가진 변수를 사용 가능 --%>
<jsp:include page="<%=pageName %>"> 
	<jsp:param name="name" value="<%=name %>" />
	<jsp:param name="pageName" value="<%=pageName %>" />
</jsp:include>