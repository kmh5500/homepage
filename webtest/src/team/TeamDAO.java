package team;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import db.DBClose;
import db.DBOpen;




public class TeamDAO {
	
	public boolean chenkRefnum(int no) {
		boolean flag=false;
		Connection con=DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		ResultSet rs= null;
		sql.append(" select count(refnum) from team ");
		sql.append(" where refnum = ?");
		
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			rs.next();
			int cnt= rs.getInt(1);
			if(cnt>0)flag= true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(pstmt, con);
		}
		
		return flag;
	}
		
	public void upAnsnum(Map map) {
		Connection con= DBOpen.open();
		PreparedStatement pstmt= null;
		StringBuffer sql = new StringBuffer();
		int grpno = (Integer)map.get("grpno");
		int ansnum = (Integer)map.get("ansnum");
		
		sql.append(" update team ");
		sql.append(" set ansnum = ansnum+1 ");
		sql.append(" where grpno = ? and ansnum > ? ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, grpno);
			pstmt.setInt(2, ansnum);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(pstmt, con);
		}
	}
	
	public TeamDTO replyRead(int bbsno) {
		
		
		TeamDTO dto=null;
		Connection con= DBOpen.open();
		PreparedStatement pstmt= null;
		StringBuffer sql = new StringBuffer();
		ResultSet rs = null;
		
		sql.append(" select no,name, grpno, indent, ansnum ");
		sql.append(" from team ");
		sql.append(" where no = ? ");
	
		
		try {
			pstmt= con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto = new TeamDTO();
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(rs, pstmt, con);
		}
		
		
		return dto;
	}
	public boolean replyCreate(TeamDTO dto) {
		boolean flag=false;
		Connection con=DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql=new StringBuffer();
		sql.append(" insert into team(no,name,gender,hobby,skills,phone,zipcode,address,address2, ");
		sql.append(" grpno, indent, ansnum , refnum) ");
		sql.append(" values( (select nvl(max(no),0)+1 from team),?,?,?,?,");
		sql.append(" ?,?,?,? ,?,?,?,? ) ");
		try {
			pstmt=con.prepareStatement(sql.toString());
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getGender());
			pstmt.setString(3, dto.getHobby());
			pstmt.setString(4, dto.getSkills());
			pstmt.setString(5, dto.getPhone());
			pstmt.setString(6, dto.getZipcode());
			pstmt.setString(7, dto.getAddress());
			pstmt.setString(8, dto.getAddress2());
			pstmt.setInt(9, dto.getGrpno());
			pstmt.setInt(10, dto.getIndent()+1);
			pstmt.setInt(11, dto.getAnsnum()+1);
			pstmt.setInt(12, dto.getNo());
			
			int cnt = pstmt.executeUpdate();
			if(cnt>0)flag= true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(pstmt, con);
		}return flag;
	}
	
	public List<TeamDTO> list(Map map) {
		ArrayList<TeamDTO> list = new ArrayList<TeamDTO>();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		StringBuffer sql= new StringBuffer();
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		
		sql.append(" select no,name,gender,skills,phone,grpno,indent,ansnum  ");
		sql.append(" from team  ");
	
		if(word.trim().length()>0) {
			sql.append(" where  "+col +"  like  '%'||?||'%' ");
		}
		sql.append(" order by grpno desc, ansnum ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, word);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				TeamDTO dto= new TeamDTO();
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setGender(rs.getString("gender"));
				dto.setSkills(rs.getString("skills"));
				dto.setPhone(rs.getString("phone"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(rs, pstmt, con);
		}
		
		
		return list;
	}

	public boolean create(TeamDTO dto) {
		// TODO Auto-generated method stub
		boolean flag=false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql= new StringBuffer();
		sql.append(" insert into team(no,name,gender,hobby,skills,phone,zipcode,address,address2,grpno)");
		sql.append(" values( (select nvl(max(no),0)+1 from team),?,?,?,?,");
		sql.append(" ?,?,?,?,  ");
		sql.append(" (select nvl(max(grpno),0)+1 from team) ) ");
		try {

			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getGender());
			pstmt.setString(3, dto.getHobby());
			pstmt.setString(4, dto.getSkills());
			pstmt.setString(5, dto.getPhone());
			pstmt.setString(6, dto.getZipcode());
			pstmt.setString(7, dto.getAddress());
			pstmt.setString(8, dto.getAddress2());
			
			int cnt= pstmt.executeUpdate();
			if(cnt>0)flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(pstmt, con);
		}
		
		
		return flag;
	}

	public TeamDTO read(int no) {
		TeamDTO dto = null;
		Connection con=DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql= new StringBuffer();
		sql.append(" select * from team ");
		sql.append(" where no = ? ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
			dto = new TeamDTO();
			dto.setNo(rs.getInt("no"));
			dto.setName(rs.getString("name"));
			dto.setPhone(rs.getString("phone"));
			dto.setGender(rs.getString("gender"));
			dto.setHobby(rs.getString("hobby"));
			dto.setSkills(rs.getString("skills"));
			dto.setZipcode(rs.getString("zipcode"));
			dto.setAddress(rs.getString("address"));
			dto.setAddress2(rs.getString("address2"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(rs, pstmt, con);
		}
		
	
		return dto;
	}


	public boolean update(TeamDTO dto) {
		// TODO Auto-generated method stub
		boolean flag= false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql= new StringBuffer();
		sql.append(" update team set  ");
		sql.append(" 	hobby=? ,  ");
		sql.append(" 	skills= ? , ");
		sql.append(" 	phone= ?, ");
		sql.append(" 	zipcode=? , ");
		sql.append("    address=? , ");
		sql.append("    address2=? ");
		sql.append("   where no=? ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getHobby());
			pstmt.setString(2, dto.getSkills());
			pstmt.setString(3, dto.getPhone());
			pstmt.setString(4, dto.getZipcode());
			pstmt.setString(5, dto.getAddress());
			pstmt.setString(6, dto.getAddress2());
			pstmt.setInt(7, dto.getNo());
			int cnt=pstmt.executeUpdate();
			if(cnt>0) flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(pstmt, con);
		}
		

		return flag;
	}

	public boolean delete(int no) {
		// TODO Auto-generated method stub
		boolean flag= false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt=null;
		StringBuffer sql= new StringBuffer();
		sql.append(" delete from team ");
		sql.append(" where no = ? ");
		try {
			pstmt= con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			int cnt=pstmt.executeUpdate();
			if(cnt>0)flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(pstmt, con);
		}
		
		
		return flag;
	}
	
	
	
}
