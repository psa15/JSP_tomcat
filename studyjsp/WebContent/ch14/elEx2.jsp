<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String name = "";
	
	if(request.getParameter("name") != null) {
		name = request.getParameter("name");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="elEx2.jsp">
		<ul>
			<li>
				<label for = "name">이름</label>
				<input type = "text" id = "name" name = "name">
				<input type = "submit" value = "확인">
			</li>
			<li>
				<p>이름은: <%=name%></p>
			</li>
		</ul>
	</form>
</body>
</html>