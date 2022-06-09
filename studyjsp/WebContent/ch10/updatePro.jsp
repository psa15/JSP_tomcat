<%@page import="ch10.logon.*"%>
<%@page import="java.sql.*"%>
<%--java.sql 패키지가 여러개 사용될 예정이라 * 처리 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--회원정보를 수정한 결과를 데이터베이스에 반영하는 기능을 가진 jsp파일 --%>

<% request.setCharacterEncoding("utf-8"); %>
<%
	//오라클 데이터베이스 member테이블에 사용자가 입력하는 데이터 저장 목적으로 존재-> tag 필요 x
	String userId = request.getParameter("userId");
	String passwd = request.getParameter("passwd");
	String username = request.getParameter("username");
	String addr = request.getParameter("addr");
	String tel = request.getParameter("tel");
	
	LogonBean logon = LogonBean.getInstance();
	
	//logon.updateMember(memObj); 를 호출하려면 파라미터가 Member이기 때문에 Member객체를 생성해야 함
	//()안에 컨트롤 스페이스바 하면 어떤 것을 추가해야하는지 보임
	Member memObj = new Member(userId, passwd, username, addr, tel, null);
	//member클래스의 생성자에는 reg_date가 있는데 여기선 쓰지 않기 때문이 null로 처리
	//updateMember()메소드에는 username이 없지만 updateForm.jsp에는 username이 있어서 추가함
	
	logon.updateMember(memObj);

	response.sendRedirect("selectList.jsp");
%>