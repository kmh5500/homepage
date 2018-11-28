package spring.model.board;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class BoardMgr {
	@Autowired
	private  BoardDAO dao;
	
	public boolean reply(BoardDTO dto) {
		boolean flag = false;
	
		Map map = new HashMap();
		map.put("ref", dto.getRef());
		map.put("ansnum", dto.getAnsnum());
		
		try {
		
			dao.upAnsnum(map);
			flag= dao.replyCreate(dto);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}finally {
			
		}
	return flag;
	}
}
