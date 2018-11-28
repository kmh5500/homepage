package spring.model.bbs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class BbsTest {

	public static void main(String[] args) {
		
		
		Resource resource = new ClassPathResource("daoTest.xml");
		
		BeanFactory factory = new XmlBeanFactory(resource);
		
		BbsDAO dao = (BbsDAO)factory.getBean("dao");
		
		// TODO Auto-generated method stub
	//	BbsDTO readdto = dao.read(1);
		// dto= dao.read();
	//	 create(dao);
	//	System.out.println(readdto.getName());
		// List<BbsDTO> list = dao.list(dao);
	//	list(dao);
	//	read(dao);
//		update(dao);
//		read(dao);
//		reply(dao);
//		checkRefnum(dao);
	//	total(dao);
	//	passwdCheck(dao);
		
	}
	

	private static void passwdCheck(BbsDAO dao) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map .put("bbsno",2);
		map .put("passwd","1234");
		if(dao.passCheck(map)) {
			p("올바른 패스워드 입니다.");
		}else {
			
			p("틀린 패스워드 입니다.");
		}
		
	}


	private static void reply(BbsDAO dao) {
		// TODO Auto-generated method stub
		BbsDTO dto = dao.replyRead(1);
		
		
		dto.setWname("가길동");
		dto.setTitle("제목1");
		dto.setContent("내용1");
		dto.setPasswd("1234");
		dto.setFilename("파일이름1");
		dto.setFilesize(50);
		Map map = new HashMap();
		map .put("grpno",dto.getGrpno());
		map .put("ansnum",dto.getAnsnum());
		
//		dao.upAnsnum(map);
//		if(dao.replyCreate(dto)) {
//			p("성공");
//			
//		}else {
//			p("실패");
//		}
		
	}


	/*
	 * Map map = new HashMap(); Map map1 = new HashMap(); map.put("num", 1);
	 * map.put("passwd", "1234"); map1.put("col", "name"); map1.put("word", "홍");
	 * int i = dao.total(map1);
	 * 
	 * if(dao.passCheck(map)) { System.out.println("비밀번호 맞음"); }else
	 * System.out.println("비밀번호 틀림"); System.out.println(i);
	 */


	private static void create(BbsDAO dao) {
		BbsDTO dto = new BbsDTO();
		dto.setWname("가길동");
		dto.setTitle("제목1");
		dto.setContent("내용1");
		dto.setPasswd("1234");
		dto.setFilename("파일이름1");
		dto.setFilesize(50);
		

		if (dao.create(dto)) {
			p("등록 성공");
		} else {
			p("등록 실패");
		}

	}

	private static void read(BbsDAO dao) {
		int num = 1;

		BbsDTO dto = dao.read(num);

		p(dto);
	}

	private static void update(BbsDAO dao) {
		BbsDTO dto = new BbsDTO();
		dto.setWname("변경");
		dto.setTitle("제목변경");
		dto.setContent("내용변경");
		dto.setFilename("파일이름변경");
		dto.setFilesize(999);
		dto.setBbsno(1);

		if (dao.update(dto)) {
			p("변경 성공");
		} else {
			p("변경 실패");
		}
	}

	private static void delete(BbsDAO dao) {
		int num = 2;

		if (dao.delete(num)) {
			p("삭제 성공");
		} else {
			p("삭제 실패");
		}
	}

	private static void list(BbsDAO dao) {
		Map map = new HashMap();
		map.put("col", "name");
		map.put("word", "길");
		map.put("sno", 1);
		map.put("eno", 5);

		List<BbsDTO> list = dao.list(map);

		for (int i = 0; i < list.size(); i++) {
			BbsDTO dto = list.get(i);

			p(dto);
		}
	}

	private static void total(BbsDAO dao) {
		Map map = new HashMap();
		map.put("col", "name");
		map.put("word", "s");

		System.out.println("레코드수: "+dao.total(map));
	}

	private static void upCount(BbsDAO dao) {
		int num = 1;
		dao.upviewcnt(num);
	}

	private static void checkRefnum(BbsDAO dao) {
		int parentNum = 2;

		if (dao.checkRefnum(parentNum)) {
			p("해당 글의 부모글이 존재합니다. 삭제 가능합니다.");
		} else {
			p("해당 글이 부모글입니다. 삭제 불가능합니다.");
		}
	}

//	private static void replyCreate(BbsDAO dao) {
//		BbsDTO dto = dao.replyRead(1);
//		dto.setName("답변");
//		dto.setSubject("글1의 답1");
//		dto.setContent("답변내용");
//		dto.setPasswd("123");
//		dto.setIp("답변아이피");
//		dto.setFilename("답변파일이름");
//		dto.setFilesize(10);
//
//		if (dao.replyCreate(dto)) {
//			p("답변 등록 성공");
//		} else {
//			p("답변 등록 실패");
//		}
//
//	}

	private static void replyRead(BbsDAO dao) {
		int num = 1;
		BbsDTO dto = dao.replyRead(num);

		p("부모 글에서 수정할 수 없는 내용과 필요한 내용을 불러옵니다");

 		p(dto);
	}

//	private static void upAnsnum(BbsDAO dao) {
//		Map map = new HashMap();
//		map.put("ref", 1);
//		map.put("ansnum", 0);
//
//		dao.upAnsnum(map);
//	}
//
//	private static void checkPasswd(BbsDAO dao) {
//		Map map = new HashMap();
//		map.put("num", 1);
//		map.put("passwd", "123");
//
//		if (dao.checkPasswd(map)) {
//			p("비밀번호가 일치합니다.");
//		} else {
//			p("비밀번호 일치 안 함");
//		}
//
//	}

	private static void p(BbsDTO dto) {
		p("일련번호 : " + dto.getBbsno());
		p("작성자 : " + dto.getWname());
		p("제목 : " + dto.getTitle());
		p("작성일 : " + dto.getWdate());
		p("조회수 : " + dto.getViewcnt());
		p("글번호 : " + dto.getIndent());
		p("-----------read추가-------------");
		p("내용 : " + dto.getContent());
		
		p("파일이름 : " + dto.getFilename());
		p("파일크기 : " + dto.getFilesize());
	}

	private static void p(String string) {
		System.out.println(string);
	}

}

