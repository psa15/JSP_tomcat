<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Cookie cookie = new Cookie("id", null); //쿠키 삭제기 때문에 이름은 같고 값은 null로
	cookie.setMaxAge(0); //음수나 0
	response.addCookie(cookie);
	
	out.println("Cookie removed");
%>