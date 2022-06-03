<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	response.setStatus(HttpServletResponse.SC_OK); 
	//HttpServletResponse : s,f 로 상수값으로 상태코드를 쉽게 사용하기 위해 이름으로 정의
	//SC_OK 의 상태 코드 값은 200, 성공적으로 처리되어 진행되어 서버로 받은 파일을 화면에 출력가능하다는 의미
	//니가 요청한 파일은 아닌데 이 파일은 정상이야 의 의미
%>

<title>404에러 페이지</title>
<%--notfound.jpg를 실행시켜 브라우저에서 열면 주소가 나옴 --%>
<img src="http://localhost:8888/error/notfound.jpg">