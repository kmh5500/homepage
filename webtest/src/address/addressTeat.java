package address;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class addressTeat {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		addressDAO dao = new addressDAO();

	//	create(dao);
	//	read(dao);
	//	update(dao);
	//	delete(dao);
		list(dao);
		

	}

	private static void list(addressDAO dao) {
		// TODO Auto-generated method stub
		List<addressDTO> list = dao.list();
		for(int i =0;i<list.size();i++) {
			addressDTO dto = list.get(i);
			p(dto);
			p("------------");
		}
	//	p(list);
		
	}

	private static void p(List<addressDTO> list) {
		// TODO Auto-generated method stub
		
		
	}

	private static void delete(addressDAO dao) {
		// TODO Auto-generated method stub
		if(dao.delete(5)) {
			p("삭제 성공");
		}else p("삭제 실패");
		
	}

	private static void update(addressDAO dao) {
		// TODO Auto-generated method stub
		addressDTO dto= dao.read(3);
		dto.setAddress("USA");
		dto.setAddress2("new york");
		if(dao.update(dto)) {
			p("수정 성공");
		}else p("수정 실패");
		
	}

	private static void read(addressDAO dao) {
		// TODO Auto-generated method stub
		addressDTO dto =dao.read(3);
		p(dto);
	}

	private static void p(addressDTO dto) {
		// TODO Auto-generated method stub
		System.out.println(dto.getNo());
		System.out.println(dto.getName());
		System.out.println(dto.getPhone());
		System.out.println(dto.getZipcode());
		System.out.println(dto.getAddress());
		System.out.println(dto.getAddress2());
	}

	private static void create(addressDAO dao) {
		// TODO Auto-generated method stub
		addressDTO dto = new addressDTO();
		dto.setName("홍길동");
		dto.setPhone("010-1111-2222");
		dto.setZipcode("55555");
		dto.setAddress("경기도 남양주시");
		dto.setAddress2("와부읍 덕소리");
		if(dao.create(dto)) {
			p("등록 성공");			
		}else p("등록 실패");
		
	}

	private static void p(String string) {
		// TODO Auto-generated method stub
		System.out.println(string);
	}

}
