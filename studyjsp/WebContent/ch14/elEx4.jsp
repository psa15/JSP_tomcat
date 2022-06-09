<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//scope(영역) : jsp, servlet파일이 실행되면서 데이터를 관리하는 범위
	//수명 주기 : pageScope < requestScope < sessionScope < applicationScope
	pageContext.setAttribute("value", 1); //jsp 페이지가 실행 중에만 사용 가능(이 영역을 pageScope)
	request.setAttribute("value", 2); //요청을 받았을 때 사용 가능(requestScope)
	session.setAttribute("value", 3); //세션유효기간(소멸 전까지) 사용 가능(sessionScope)
	application.setAttribute("value", 4); //웹 애플리케이션이 종료되기 전까지 사용 가능(applicationScope)
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${value}
	<%--value라는 키를 pageScope에서부터 찾음, pageScope에 value가 없으면 그 다음인 requestScope에서 찾음 --%>
	
	${requestScope.value}
</body>
</html>