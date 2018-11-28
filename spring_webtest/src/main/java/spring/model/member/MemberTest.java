package spring.model.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;



public class MemberTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		

		Resource resource = new ClassPathResource("daoTest.xml");
		
		BeanFactory factory = new XmlBeanFactory(resource);
		
		MemberDAO dao = (MemberDAO)factory.getBean("member");
		
		
		
		//create(dao);
		//read(dao);
	//	cehckRefnum(dao);
	//	reply(dao);
	//	read(dao);
	//	list(dao);
	//	delete(dao);
	//update(dao);
	//	updatepw(dao);
	//	updateFile(dao);
	//	getGrade(dao);
	//	getIdFind(dao);
	//	getPwFind(dao);
		dupID(dao);
		
		
		

	}

	private static void dupID(MemberDAO dao) {
		// TODO Auto-generated method stub
		if(dao.duplicateId("user3")) {
			p("중복입니다;");
		}else {
			
			p("사용가능합니다");
		}
		
	}

	private static void getPwFind(MemberDAO dao) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("mname", "모리");
		map.put("id","user11");
		p(dao.getpwFind(map));
		
		
	}private static void getIdFind(MemberDAO dao) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("mname", "개발자3");
		map.put("email","email10");
		p(dao.getIdFind(map));
		
		
	}

	private static void getGrade(MemberDAO dao) {
		// TODO Auto-generated method stub
		String grade = dao.getGrade("admin");
		p(grade);
		
	}

	private static void updateFile(MemberDAO dao) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("id", "user5");
		map.put("fname", "1234.jpg");
		if(dao.updateFile(map)) {
			p("성공");
		}else
			p("실패");
	}

	private static void updatepw(MemberDAO dao) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("id", "user3");
		map.put("passwd", "1234");
		if(dao.updatePw(map)) {
			p("성공");
		}else
			p("실패");
	
	}

	private static void update(MemberDAO dao) {
		// TODO Auto-generated method stub
		MemberDTO dto = dao.read("dd");
		dto.setAddress1("aaaaa");
		if(dao.update(dto)) {
			p("성공");
		}else
			p("실패");
	}

	private static void delete(MemberDAO dao) {
		// TODO Auto-generated method stub
		if(dao.delete("user2")) {
			p("성공");
		}else
			p("실패");
	}

	private static void list(MemberDAO dao) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("col", "name");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);

		List<MemberDTO> list = dao.list(map);

		for (int i = 0; i < list.size(); i++) {
			MemberDTO dto = list.get(i);

			p(dto);
			p("-------------");
		}
	}





	private static void read(MemberDAO dao) {
		// TODO Auto-generated method stub
		MemberDTO dto = dao.read("user21");
		p(dto);
	}



	private static void create(MemberDAO dao) {
		// TODO Auto-generated method stub
		MemberDTO dto = new MemberDTO();
		dto.setId("user2");
		dto.setMname("지은");
		dto.setPasswd("1234");
		dto.setEmail("user2@naver.com");
		dto.setFname("member.jpg");
		dto.setTel("010-444-4879");
		dto.setJob("a01");
//		dto.setZipcode("5555");
//		dto.setAddress("서울시 종로구");
//		dto.setAddress2("코아빌딩");
		if(dao.create(dto)) {
			p("성공");
		}else
			p("실패");
		
	}

	private static void p(String string) {
		// TODO Auto-generated method stub
		System.out.println(string);
	}
	
	private static void p(MemberDTO dto) {
		// TODO Auto-generated method stub
		System.out.println(dto.getMname());
		System.out.println(dto.getJob());
		
		System.out.println(dto.getTel());
		System.out.println(dto.getEmail());
		System.out.println(dto.getFname());
		System.out.println(dto.getZipcode());
	}

}
