package spring.model.bbs;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class BbsMgr {
	@Autowired
	private  BbsDAO dao;
	
	@Autowired
	private ReplyDAO rdao;
	
	
	public void delete(int bbsno) throws Exception {
	
		rdao.bdelete(bbsno);//게시글 댓글 전부삭제
		dao.delete(bbsno);
		
		
	}
	
	
	public void reply(BbsDTO dto) throws Exception {
		
	
			Map map = new HashMap();
			map.put("grpno", dto.getGrpno());
			map.put("ansnum", dto.getAnsnum());
			
			dao.upAnsnum(map);
			dao.replyCreate(dto);
			
	
	
	}
}
