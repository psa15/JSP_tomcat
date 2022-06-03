<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--사용자가 입력한 아이디와 비밀번호를 받음 --%>

<%
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");
	
	//db에서 로그인 정보 확인작업 - 생략(우리는 없음)
	//equals()의 파라미터는 db에서 가져오는 것!
	if(userId.equals("user01") && userPw.equals("1234")) {
		//로그인 정보가 검증되었음(true)
		
		//서버측의 메모리에 사용자(브라우저)에게 발급해준 세션ID로 관리되는 기억장소에 로그인에 성공한 상태를 저장 및 관리
		session.setAttribute("userId", userId); //키, 값
	}
	
	response.sendRedirect("loginFrom.jsp");
	//다시 로그인 페이지로 돌아가면 로그인 폼 혹은 로그아웃폼만 출력시키고 싶음
%>