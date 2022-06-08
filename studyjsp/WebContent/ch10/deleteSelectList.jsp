<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="ch10.logon.*"%>
<%--java.sql 패키지가 여러개 사용될 예정이라 * 처리 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	function fn_deleteOk(userid) {
		if(!confirm(userid + "를 삭제 하겠습니까?")) return;
		//취소를 누르면 false가 되어 !로 인해 true로 작용하여 return됨
		//확인을 누르면 true가 되어 !로 인해 false로 작용하여 아리 코드 실행
		location.href="deletePro.jsp?userid=" + userid;
	}
</script>

<table border="1">
	<tr>
		<td>아이디</td>
		<td>이름</td>
		<td>가입 일자</td>
		<td>비고</td>
	</tr>
	
<%
	String userid = "";
	String passwd= "";
	String username= "";
	String addr= "";
	String tel ="";
	Date reg_date = null;

	LogonBean logon = LogonBean.getInstance();
	ArrayList<Member> memberList = logon.selectList();
	
	for(int i=0; i<memberList.size(); i++) {
		Member member = memberList.get(i);
		userid = member.getUserid();
		passwd = member.getPASSWD();
		username = member.getUSERNAME();
		addr = member.getADDR();
		tel = member.getTEL();
		reg_date = member.getREG_DATE();
%>
	<tr>
		<td><a href ="selectDetail.jsp?userid=<%=userid%>"><%=userid %></a></td>
		<td><%=username %></td>
		<td><%=tel %></td>
		<td><%=reg_date %></td>
		<td>
			<input type="button" value="삭제" onclick="fn_deleteOk('<%=userid%>');">
		</td>
	</tr>

<%
}
%>
</table>