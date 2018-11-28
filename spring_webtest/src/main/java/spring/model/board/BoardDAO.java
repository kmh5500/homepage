package spring.model.board;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
		
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	
	
	
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	
	
	
	
	
	
	public BoardDTO replyRead(int num) {
		
		
		return mybatis.selectOne("board.replyRead", num);
	}
	
	
	
	
	public void upAnsnum(Map map) {
		 mybatis.update("board.upAnsnum", map);	
	}
	
	
	
	
		public boolean checkrefnum(int num) {
			boolean flag = false;
				
				
				int cnt = mybatis.selectOne("board.checkrefnum", num);
				if (cnt > 0) {
					flag = true;
				}			
		
			return flag;
			
		}
	
	public boolean replyCreate(BoardDTO dto) {
		boolean flag = false;
	
			int cnt =mybatis.insert("board.replyCreate",dto);

			if (cnt > 0) {
				flag = true;
			}
		
		return flag;
		
	}
	
	
	

	
	public boolean create(BoardDTO dto) {
		boolean flag=false;
		
		int cnt = mybatis.insert("board.create",dto);
		
		if(cnt>0)flag= true;
		return flag;
	}

	public boolean update(BoardDTO dto) {
		// TODO Auto-generated method stub
		boolean flag=false;
		
		int cnt= mybatis.update("board.update",dto);
		if(cnt>0)flag= true;
		
		return flag;
	}


	public boolean delete(int num) {
		// TODO Auto-generated method stub
		boolean flag=false;
		
	
			int cnt=mybatis.delete("board.delete", num);
			if(cnt>0) {
				flag=true;
			}
		return flag;
	}
	
	
	public BoardDTO read(int num) {
		return mybatis.selectOne("board.read", num);
	}
	
	
	public List<BoardDTO> list(Map map){
		return mybatis.selectList("board.list", map);
		}
		
	
	
	public boolean passCheck(Map map) {
		boolean flag = false; 
		int cnt = mybatis.selectOne("board.passCheck", map);
		if(cnt>0)flag=true;
		
		return flag;
		
	}

	public int total(Map map) {
		// TODO Auto-generated method stub
		
		return mybatis.selectOne("board.total", map);
	}
	
	public void upcount(int num) {
		
	mybatis.update("board.upCount",num);
		
	}




	public BoardDTO readReply(int num) {
		
		return mybatis.selectOne("board.readReply", num);
		
	}
	
	
	
}