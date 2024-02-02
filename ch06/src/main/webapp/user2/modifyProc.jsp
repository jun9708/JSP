<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
//인코딩 설정
	request.setCharacterEncoding("UTF-8");

	//데이터 수신
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String hp = request.getParameter("hp");
	String age = request.getParameter("age");
	
	//데이터베이스 작업
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "wnsgud1997";
	String pass = "abc1234";
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		String sql  = "update `user1` set ";
			sql += "`name` = ?, ";
			sql += "`birth` = ?, ";
			sql += "`hp` = ?, ";
			sql += "`age` = ? ";
			sql += "where `uid` = ?";
			
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, name);
		psmt.setString(2, birth);
		psmt.setString(3, hp);
		psmt.setString(4, age);
		psmt.setString(5, uid);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");
%>