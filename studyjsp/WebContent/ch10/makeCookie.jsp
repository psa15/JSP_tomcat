<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Cookie cookie = new Cookie("id", "user01");
	//id키에 사용자 id에 해당하는 user01을 저장
	cookie.setMaxAge(60*2); //단위가 초, 시간을 주지 않으면 쿠키를 보내자마자 소멸됨
	response.addCookie(cookie); //response객체에 쿠키 추가, 서버측의 결과를 클라이언트에게 보내질 때 response 객체의 내용이 전송
	
	out.println("cookie ok");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method = "post" action="useCookie.jsp">
		<dl>
			<dd><input type = "submit" value="쿠키확인"></dd>
		</dl>
	</form>
	<form method="post" action="removeCookie.jsp">
		<dl>
			<dd><input type = "submit" value="쿠키소멸"></dd>
		</dl>
	</form>
</body>
</html>