<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>로그인 / 로그아웃 페이지</h3>
	
	<%//다시 로그인 페이지로 돌아가면 로그인 폼 혹은 로그아웃폼만 출력시키고 싶음
		if(session.getAttribute("userId") == null) {
			//session.getAttribute("setAttribute의 키값")
			//처음에는 userID가 없어서 밑의 폼이 나옴
	%>
		<%--로그인 폼 --%>
		<form method="post" action="sessionLoginPro.jsp">
			<div id="auth">
				<dl>
					<dd>
						<label for="userId">아이디</label>
						<input type = "text" name="userId" id="userId" placeholder="id 입력" autofocus required>
					</dd>
					<dd>
						<label for="userPw">비밀번호</label>
						<input type = "password" name="userPw" id="userPw" placeholder="비밀번호 입력" autofocus required>
					</dd>
					<dd>
						<input type="submit" value="로그인">
					</dd>
				</dl>
			</div>
		</form>
		
	<%} else { %>
		<%--로그아웃 폼 --%>
		<form method="post" action="sessionlogout.jsp">
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