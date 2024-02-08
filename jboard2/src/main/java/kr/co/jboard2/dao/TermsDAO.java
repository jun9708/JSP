package kr.co.jboard2.dao;

import kr.co.jboard2.db.DBHelper;
import kr.co.jboard2.db.SQL;
import kr.co.jboard2.dto.TermsDTO;

public class TermsDAO extends DBHelper {
	
	//싱글톤
	private static TermsDAO instance = new TermsDAO();
	public static TermsDAO getInstance() {
		return instance;
	}
	private TermsDAO() {}

	public TermsDTO selectTerms() {
		
		TermsDTO terms = null;
		
		try {
			
			conn = getConnection();
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SQL.SELECT_TERMS);
			
			if(rs.next()) {
				terms = new TermsDTO();
				terms.setTerms(rs.getString(1));
				terms.setPrivacy(rs.getString(2));
			}
			
			closeAll();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return terms;

	}
}