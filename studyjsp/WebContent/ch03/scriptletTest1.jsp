<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선언문과 스크립트릿에서 선언된 변수의 차이</title>
</head>
<body>
	<h2>선언문과 스크립트릿에서 선언된 변수의 차이점</h2>
	
	<%! //선언문 
		//선언문 형태에서는 변수, 메서드 선언만 가능하다. cuz, 클래스 레벨에 코드가 생성
		String str1 = "선언문에서 선언한 변수"; //멤버 변수
		public void method1(){};
		//str2 = "김지원"; -> str2는 지역변수 이므로 사용 불가
	%>
	
	<%  //스크립트릿
		//스크립트릿형태에서의 변수는 _jspService메소드 안에 코드가 생성됨
		//메소드 정의 불가 - 자바문법 상 _jspService()메소드 안에 또다른 메소드 정의 불가.
		//선언문에서 선언한 변수, 메서드는 호출 가능
		String str2 = "스크립트릿에서 선언한 변수"; //_jspService메소드 안에 선언되어 지역 변수
		
		method1(); //클래스에 선언된 메소드 사용(호출) 가능
		str1 = "김지원"; //str1은 클래스에 선언된 변수이므로 사용 가능
	%>
</body>
</html>