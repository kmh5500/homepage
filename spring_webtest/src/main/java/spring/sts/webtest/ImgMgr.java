package spring.sts.webtest;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.db.webtest.DBClose;
import spring.db.webtest.DBOpen;
import spring.model.img.ImgDAO;
import spring.model.img.ImgDTO;
@Service
public class ImgMgr {

	@Autowired
	private  ImgDAO dao;
	
	public boolean reply(ImgDTO dto) {
		// TODO Auto-generated method stub
		boolean flag = false;
	
		Map map = new HashMap();
		
		map.put("grpno", dto.getGrpno());
		map.put("ansnum", dto.getAnsnum());
		
		
		try {
			
			dao.upAnsnum(map);
			flag = dao.replyCreate(dto);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
		}finally {
			
		}

		return flag;
	}

}
