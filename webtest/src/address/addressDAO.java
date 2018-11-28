package address;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import db.DBClose;
import db.DBOpen;

public class addressDAO {
	public addressDTO replyRead(int no) {
		addressDTO dto= new addressDTO();
		Connection con= DBOpen.open();
		PreparedStatement pstmt= null;
		StringBuffer sql = new StringBuffer();
		ResultSet rs= null;
		sql.append(" select no, grpno, indent, ansnum ");
		sql.append(" from address ");
		sql.append(" where no = ? ");
		try {
			pstmt= con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
			dto.setNo(no);
			dto.setPhone(rs.getString("grpno"));
			dto.setZipcode(rs.getString("indent"));
			dto.setAddress(rs.getString("ansnum"));
		
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(rs, pstmt, con);
		}
		
		return dto;
	}
	public void upAnsnum(Map map) {
		Connection con= DBOpen.open();
		PreparedStatement pstmt= null;
		StringBuffer sql = new StringBuffer();
		int grpno = (Integer)map.get("grpno");
		int ansnum = (Integer)map.get("ansnum");
		sql.append(" update address set ");
		sql.append(" ansnum = ansnum+ 1 ");
		sql.append(" where grpno=? and ansnum > ? ");
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
	public boolean replyCreate(addressDTO dto) {
		boolean flag= false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into address ");
		sql.append(" (no,name,phone,zipcode,address,address2, grpno, indent, ansnum,refnum) ");
		sql.append(" values( ");
		sql.append(" 	(select nvl(max(no),0)+1 from address),?,?,?, ");
		sql.append(" 	?,?,?,?,?,?) ");

		try {
			pstmt= con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPhone());
			pstmt.setString(3, dto.getZipcode());
			pstmt.setString(4, dto.getAddress());
			pstmt.setString(5, dto.getAddress2());
			pstmt.setInt(6, dto.getGrpno());
			pstmt.setInt(7, dto.getIndent()+1);
			pstmt.setInt(8, dto.getAnsnum()+1);
			pstmt.setInt(9, dto.getNo());
			int cnt = pstmt.executeUpdate();
			
			if(cnt>0)flag = true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(pstmt, con);
		}
		
		return flag;
	}
	public boolean create(addressDTO dto) {
		boolean flag =false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into address ");
		sql.append(" (no,name,phone,zipcode,address,address2,grpno) ");
		sql.append(" values( ");
		sql.append(" 	(select nvl(max(no),0)+1 from address),?,?,?, ");
		sql.append(" 	?,?  ,(select nvl(max(grpno),0)+1 from address )) ");
		
/*		insert into address
		(no,name,phone,zipcode,address,address2)
		values(
			(select nvl(max(no),0)+1 from address),'김태리','010-7878-7878','12345',
			'서울시 종로구 관철동','종로코아빌딩 5층'
		)
*/	
		try {
			pstmt= con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPhone());
			pstmt.setString(3, dto.getZipcode());
			pstmt.setString(4, dto.getAddress());
			pstmt.setString(5, dto.getAddress2());
			int cnt = pstmt.executeUpdate();
			
			if(cnt>0)flag = true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(pstmt, con);
		}
		
		return flag;
	}

	public addressDTO read(int i) {
		// TODO Auto-generated method stub
		addressDTO dto = new addressDTO();
		Connection con = DBOpen.open();
		PreparedStatement pstmt= null;
		StringBuffer sql= new StringBuffer();
		sql.append(" select * from address where no = ?");
		ResultSet rs= null;
		try {
			pstmt= con.prepareStatement(sql.toString());
			pstmt.setInt(1, i);
			rs=pstmt.executeQuery();
			if(rs.next()) {
			dto.setNo(i);
			dto.setName(rs.getString("name"));
			dto.setPhone(rs.getString("phone"));
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

	public boolean update(addressDTO dto) {
		// TODO Auto-generated method stub
		boolean flag= false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt=null;
		StringBuffer sql= new StringBuffer();
		sql.append(" update address set " );
		sql.append(" name=? ,phone=?, zipcode=?,address=?, address2=? ");
		sql.append(" where no= ? ");
	

		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPhone());
			pstmt.setString(3, dto.getZipcode());
			pstmt.setString(4, dto.getAddress());
			pstmt.setString(5, dto.getAddress2());
			pstmt.setInt(6, dto.getNo());
			int cnt= pstmt.executeUpdate();
			if(cnt>0) {
				flag= true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(pstmt, con);
		}
		
		return flag;
	}

	public boolean delete(int i) {
		// TODO Auto-generated method stub
		boolean flag= false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt=null;
		StringBuffer sql= new StringBuffer();
		sql.append(" delete from address " );
		sql.append(" where no= ? ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1,	 i);
			int cnt = pstmt.executeUpdate();
			if(cnt>0) {
				flag= true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(pstmt, con);
		}
		
		return flag;
	}

	public List<addressDTO> list() {
		// TODO Auto-generated method stub
		List<addressDTO> list= new ArrayList<addressDTO>();
		addressDAO dao = new addressDAO();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new  StringBuffer();
		ResultSet rs = null;
		sql.append(" select * from address ");
		sql.append(" order by grpno desc, ansnum ");

		
		try {
			pstmt=con.prepareStatement(sql.toString());
			rs=pstmt.executeQuery();
			while(rs.next()) {
				addressDTO dto = new addressDTO();
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress(rs.getString("address"));
				dto.setAddress2(rs.getString("address2"));
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
	

}
