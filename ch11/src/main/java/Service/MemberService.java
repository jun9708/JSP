package Service;

import java.util.List;

import dao.MemberDAO;
import dto.MemberDTO;

public class MemberService {
	private static MemberService instance = new MemberService();
	public static MemberService getInstance() {
		return instance;
	}
	
	private MemberDAO dao = MemberDAO.getInstance();
	
	private MemberService() {}
	
	public void insertMember(){
		
	}
	public void selectMember(){
		
	}
	public List<MemberDTO> selectMembers(){
		return dao.selectMembers();
	}
	public void updateMember(){
		
	}
	public void deleteMember(){
		
	}
	
}
