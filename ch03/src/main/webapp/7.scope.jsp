<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>7.scope</title>
		<!-- 
			날짜 : 2024.01.01
			이름 : 김준형
			내용 : 내장객체 영역 실습하기
			
			
			내장객체 영역(Scope			
		 <!--JSP 내장객체가 저장되는 메모리의 유효범위
		 	- 각 내장객체별 영역 포함관계
		 	-하나의 요청이 오며 하나되어서
		 -->
	</head>
	<body>
		<h3>7. 내장 객체 영역</h3>
		<%
			//내장객체 값 설정
			pageContext.setAttribute("name", "김유신");
			request.setAttribute("name", "김춘추");
			session.setAttribute("name", "장보고");
			application.setAttribute("name", "강감찬");
		%>
		
		<p>
			pageContext 확인: <%= pageContext.getAttribute("name") %>
			request 확인: <%= request.getAttribute("name") %>
			session 확인: <%= pageContext.getAttribute("name") %>
			application 확인: <%= pageContext.getAttribute("name") %>
		</p>
		
		<%
			pageContext.forward("./proc/resultScope.jsp");
		%>
		
	</body>
</html>