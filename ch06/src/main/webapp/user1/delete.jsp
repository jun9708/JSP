<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%	
	
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "wnsgud1997";
	String pass = "abc1234";

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	//2단계 - 데이터베이스 접속
	Connection conn = DriverManager.getConnection(host, user, pass);
	
	PreparedStatement psmt = conn.prepareStatement("delete from `user1` where `uid` = ?");
	psmt.setString(1, uid);
	
	psmt.executeUpdate();
	
	psmt.close();
	conn.close();
	
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");
%>