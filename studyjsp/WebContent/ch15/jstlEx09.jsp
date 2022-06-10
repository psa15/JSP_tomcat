<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Functions 라이브러리의 함수 사용예제</title>
</head>
<body>
	<h3>JSTL Functions 라이브러리의 함수 사용예제 : String클래스의 메서드와 유사</h3>
	
	<c:set var="str1" value="test String"/>
	<c:set var="str2" value="<aaa>여기</aaa>를 클릭해서 다운로드" />
	<p>str1출력 : ${str1}</p>
	<p>str2출력 : ${fn:escapeXml(str2)}</p>
	
	<c:if test="${fn:contains(str1, 'test')}">
		<%--fn:contains(str1, 'test') : 리턴타입 boolean --%>
		<p>test문자열 포함되어있음</p>
	</c:if>
		
	<p>indexOf(str1, 'a') : ${fn:indexOf(str1, 'a')} </p>
	<%--str1의 t의 위치값 반환 -> 없으면 -1 --%>
	<%--indexOf(String, String) 리턴타입 int --%>
	
	<p>length(str2): ${fn:length(str2)}</p>
	<%--str2변수의 문자열 길이를 반환 --%>
	
	<c:set var="spStr" value="${fn:split(str1, ' ')}" />
	<%--str1변수인 문자열 데이터를 ' '(공백)구분자를 이용하여 배열로 반환 --%>
	<p>split(str1, ' ')수행 후 첫 배열 원소값 : ${spStr[0]}</p>
	
	<p>fn:join(spStr, '-'): ${fn:join(spStr, '-')}</p>
	<%--fn:join(String[], String) 배열을 두번째 파라미터의 문자열로 연결 --%>
	
	<p>fn:replace(str1, 'test', '테스트') : ${fn:replace(str1, 'test', '테스트')}</p>
	<%--fn:replace(str1, 'test', '테스트')str1에서 test를 찾아 테스트로 바꿔라 --%>
	
	<p>fn:startsWith(str1, 'test'): ${fn:startsWith(str1, 'test')}</p>
	<%--fn:startsWith(str1, 'test') str1변수의 내용이 test로 시작하는지 boolean으로 반환 --%>
	
	<p>fn:substring(str1, 0, 3): ${fn:substring(str1, 0, 3)}</p>
	<%--fn:substring(str1, 0, 3) str1의 0부터 (3-1)번 인덱스까지 --%>
	<p>${fn:substringAfter(str1, ' ')}</p>
	<%--fn:substringAfter(str1, ' ')str1에서 ' ' 이후의 내용을 가져와라 --%>
	<p>fn:toLowerCase(str1): ${fn:toLowerCase(str1) }</p>
	<p>fn:toUpperCase(str1): ${fn:toUpperCase(str1) }</p>
</body>
</html>