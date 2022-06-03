<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="template.css">
</head>
<body>
	<header>
		<%--<jsp:include> 액션태그로 top.jsp 내의 코드가 참조됨
		만약  <jsp:include page="content.jsp"></jsp:include> 태그 사이에 내용이 필요 없다면
		<jsp:include page="top.jsp" /> /만 추가하면 닫는태그 삭제됨--%>
		
		<jsp:include page="top.jsp" />
	</header>
	<div id="content">
		<section id="areaSub">
			<jsp:include page="left.jsp" />
		</section>
		<section id="areaMain">
			<jsp:include page="content.jsp" />
		</section>
	</div>
	<footer>
		<jsp:include page="bottom.jsp" />
	</footer>

</body>
</html>