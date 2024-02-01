<%@page import="sub1.UserDTO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>5.session</title>
		<!--  
			날짜 : 2024.01.31
			이름 : 김준형
			내용 : application 내장객체 실습하기
			
			-session
			-session 최초 요청부터 마지막 요청까지인 전체시간의 경과
			-클라이언트에 대응되는 객체
			-서버에 기록되는 클라이언트 명단(/session table>
			
		 -->
	</head>
	<body>
		<h3>5.session 내장객체</h3>
		
		<h4>session ID 확인</h4>
		<%= session.getId() %>
		
		
		<h4>session 설정</h4>
		<%
			String agent = request.getHeader("User-Agent");
			
			if(agent.contains("Edg")){  // 메소드명 오타 수정
				UserDTO user = new UserDTO("a101", "김유신", 23, "경주");
				
				// session 값 설정
				session.setAttribute("user", user);
			}else{
				UserDTO user = new UserDTO("a102", "김춘추", 25, "부산");
				
				// session 값 설정
				session.setAttribute("user", user);
			}
			
			UserDTO userDTO = (UserDTO) session.getAttribute("user");
		%>
		
		<p>
			아이디 : <%= userDTO.getUid() %><br>
			이름 : <%= userDTO.getName() %><br>
			나이 : <%= userDTO.getAge() %><br>
			주소 : <%= userDTO.getAddr() %><br>
		</p>
	</body>
</html>