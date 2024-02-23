package dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import db.DBHelper;
import dto.MemberDTO;

public class MemberDAO extends DBHelper {
	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {
		return instance;
	}
	
	private MemberDAO() {}
	
	//로거 생성
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insertMember() {
		
	}
	
	public void selectMember() {
		
	}
	
	public List<MemberDTO> selectMembers() {
		
		List<MemberDTO> members = new ArrayList<MemberDTO>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM `member`");
			
			while(rs.next()) {
				MemberDTO member = new MemberDTO();
				member.setUid(rs.getString(1));
				member.setName(rs.getString(2));
				member.setHp(rs.getString(3));
				member.setPos(rs.getString(4));
				member.setDep(rs.getInt(5));
				member.setRdate(rs.getString(6));
				members.add(member);
			}
			
			closeAll();
			
		}catch(Exception e) { 
			//로그 출력
			logger.error("selectMember() - " +e.getMessage());
		}
		
		return members;
		
	}
	
	public void updateMember() {
		
	}
	
	public void deleteMember() {
		
	}
}
