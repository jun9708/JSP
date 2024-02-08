package kr.co.jboard2.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBHelper {
	
	protected Connection conn = null;
	protected Statement stmt = null;
	protected ResultSet rs = null;
	
	public Connection getConnection() throws Exception{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/jboard");
		return ds .getConnection();
	}
	
	public void closeAll() throws Exception{
		
		if(conn != null) {
			conn.close();
		}
		
		if(stmt != null) {
			stmt.close();
		}
		
		if(rs != null) {
			rs.close();
		}
	
	}
	
}
