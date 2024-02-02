<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="dto.User1DTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "wnsgud1997";
	String pass = "abc1234";
	
	List<User1DTO> users = new ArrayList<>();
	
	try{
		//1단계 - JDBC 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		//2단계 - 데이터베이스 접속
		Connection conn = DriverManager.getConnection(host, user, pass);
		Statement stmt = conn.createStatement();
		
		//3단계 - 실행객체 생성
		ResultSet rs = stmt.executeQuery("select * from `user1`");
		
		while(rs.next()){
			User1DTO dto = new User1DTO();
			dto.setUid(rs.getString(1));
			dto.setName(rs.getString(2));
			dto.setBirth(rs.getString(3));
			dto.setHp(rs.getString(4));
			dto.setAge(rs.getInt(5));
			
			users.add(dto);
		}
		
		//4단계 - SQL 실행
		//5단계
		//6단계 - 데이터베이스 종료
		rs.close();
		stmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}

%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>User2::list</title>
	</head>
	<body>
		<h3>User2 목록</h3>
		<a href="../1.jdbc.jsp">처음으로</a>
		<a href="./register.jsp">등록하기</a>
		<table border="1">
		<tr>
			<td>아이디</td>
			<td>이름</td>
			<td>생년월일</td>
			<td>주소</td>
			<td>관리</td>
		</tr>
			<% for(User1DTO dto : users) { %>
			<tr>
				<td><%= dto.getUid() %></td>
				<td><%= dto.getName() %></td>
				<td><%= dto.getBirth() %></td>
				<td><%= dto.getHp() %></td>
				<td><%= dto.getAge() %></td>
			<td>
				<a href="./modify.jsp?uid=<%= dto.getUid() %>">수정</a>
				<a href="./delete.jsp?uid=<%= dto.getUid() %>">삭제</a>
			</td>
		</tr>
		<% } %>
		</table>
	</body>
</html>