<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>

<%
	String[] color = request.getParameterValues("color"); 
	//사용자가 선택한 개수만큼 값을 받게 됨
	
	String[] sizes = request.getParameterValues("sizes"); 
	//사용자가 선택한 개수만큼 값을 받게 됨

	String[] names = request.getParameterValues("name");
	//<input type="text" name="name"> 3개의 정보 전송
			
	String colorNames = "";
	for (int i=0; i<color.length; i++) {
		colorNames += color[i] + ",";
	}
	String sizeNames ="";
	for(int i=0; i<sizes.length; i++) {
		sizeNames += sizes[i] + ",";
	}
	String nameStr="";
	for(int i=0; i<names.length; i++) {
		nameStr += names[i] + ",";
	}
%>

선택한 색상들은? <%=colorNames%><br>
모든 size: <%=sizeNames%><br>
모든 name: <%=nameStr%>