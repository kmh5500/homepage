package spring.model.board;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BReplyDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	
	
	
	public BReplyDTO read(int rnum) {
		return mybatis.selectOne("rboard.read", rnum);
	}
	
	 public boolean create(BReplyDTO dto) {
		 boolean flag= false;
		 int cnt = mybatis.insert("rboard.create", dto);
		 if(cnt>0 ) {
			 flag= true;
		 }
		 return flag; 
	 }
	 
	 public boolean update(BReplyDTO dto) {
		 boolean flag= false;
		 int cnt = mybatis.insert("rboard.update", dto);
		 if(cnt>0 ) {
			 flag= true;
		 }
		 return flag;
		 
	 }
	 
	 public int  total(int bbsno) {
		 return mybatis.selectOne("rboard.total", bbsno);
	 }
	 
	 
	 public List<BReplyDTO> list(Map map){
		 return mybatis.selectList("rboard.list", map);
	 }

	public boolean delete(int rnum) {
		boolean flag= false;
		int cnt = mybatis.delete("rboard.delete",rnum);
		if(cnt>0)flag = true;
		return flag;
	}
	public boolean bdelete(int bbsno) {
		boolean flag= false;
		int cnt = mybatis.delete("rboard.bdelete",bbsno);
		if(cnt>0)flag = true;
		return flag;
	}
	
}
