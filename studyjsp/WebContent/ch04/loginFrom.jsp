<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//세션아이디 소멸 시간(초단위)
		session.setMaxInactiveInterval(20);
	%>
	<h3>로그인 / 로그아웃 페이지</h3>
	
	<%//다시 로그인 페이지로 돌아가면 로그인 폼 혹은 로그아웃폼만 출력시키고 싶음
		if(session.getAttribute("userId") == null) {
			//session.getAttribute("setAttribute의 키값")
	%>
		<%--로그인 폼 --%>
		<form method="post" action="loginOk.jsp">
			<div id="auth">
				<dl>
					<dd>
						<label for="userId">아이디</label>
						<input type = "text" name="userId" id="userId" placeholder="user01" autofocus required>
					</dd>
					<dd>
						<label for="userPw">비밀번호</label>
						<input type = "password" name="userPw" id="userPw" placeholder="1234" autofocus required>
					</dd>
					<dd>
						<input type="submit" value="로그인">
					</dd>
				</dl>
			</div>
		</form>
		
	<%} else { %>
		<%--로그아웃 폼 --%>
		<form method="post" action="logout.jsp">
			<div id="auth">
				<dl>
					<dd>
						<%=session.getAttribute("userId") %>님이 로그인 하셨습니다.
					</dd>
					<dd>
						<input type="submit" value="로그아웃">
					</dd>
				</dl>
			</div>
		</form>
	<%} %>
</body>
</html>