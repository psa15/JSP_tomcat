<%@page import="ch10.logon.LogonBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");
	
	//LogonBean 클래스의 메소드를 가져다 쓰고 싶은데 생성자가 private임
	//LogonBean logon = new 사용 불가
	//getInstance()메소드 호출 -> static이니까 클래스명.메소드명()
	LogonBean logon = LogonBean.getInstance();
	int check = logon.loginCheck(userId, userPw);
	//check에는 1, 0, -1 중 하나가 들어감
	
	if (check == 1) {
		//아이디와 비밀번호가 맞으니까 인증된 상태를 저장시키는 것
		session.setAttribute("userId", userId);
		
		//sessionLogin.jsp의 if(session.getAttribute("userId") == null) 가 false가 되어 else문인 로그아웃폼으로 페이지 로드
		response.sendRedirect("sessionLogin.jsp");
	} else if( check == 0) {
	/*	out.println("<html>");
		    ...
		out.println("</html>");   */
%>
	<script>
		//자바스크립트
		alert("비밀번호가 틀립니다.");
		history.go(-1); //이전페이지로 이동
	</script>
<%
	} else if(check == -1) { //else만 적어도 됨, 근데 좀 더 else의 조건을 명확히 알려주고 싶다면
%>
	<script>
		alert("아이디가 틀립니다.");
		history.go(-1); //이전페이지로 이동
	</script>
<%		
	}
%>