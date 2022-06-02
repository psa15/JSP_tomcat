<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	//request 객체 : 클라이언트에서 보내온 모든 요청정보를 가지고 있는 객체
	//예) 사용자가 입력한 정보, 브라우저가 요청한 서버 주소 정보 등등
	request.setCharacterEncoding("utf-8"); 
	//<form method="post">한글이 입력되면 서버에서 처리시 한글 깨짐 -> 한글깨짐 방지 목적
%>

<% 
	//입력한 정보를 확인하는 작업
	//request : HttpServletRequest 클래스
	String name = request.getParameter("name"); //<input type = "text" name = "name">
	String color = request.getParameter("color"); //<select name ="color">
	
	String selectColor = "";
	
	if(color.equals("blue")) {
		selectColor = "파랑색";
	} else if(color.equals("green")){
		selectColor = "초록색";
	}else if(color.equals("red")) {
		selectColor = "빨강색";
	}else{
		selectColor = "노랑색";
	}
%>

<%=name %>님이 선택한 색은 <%=selectColor %>입니다.
선택한 색: <br>
<img src = "/image/<%=color + ".jpg" %>" border ="0">