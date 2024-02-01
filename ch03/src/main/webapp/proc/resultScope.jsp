<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>resultScope</title>
	</head>
	<body>
		<h3>내장객체 값 확인</h3>
		
			pageContext 확인: <%= pageContext.getAttribute("name") %>
			request 확인: <%= request.getAttribute("name") %>
			session 확인: <%= pageContext.getAttribute("name") %>
			application 확인: <%= pageContext.getAttribute("name") %>
	</body>
</html>