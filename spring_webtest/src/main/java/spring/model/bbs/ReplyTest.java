package spring.model.bbs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class ReplyTest {

	public static void main(String[] args) {
		
		
		Resource resource = new ClassPathResource("daoTest.xml");
		
		BeanFactory factory = new XmlBeanFactory(resource);
		
		ReplyDAO dao = (ReplyDAO)factory.getBean("reply");
		
		// TODO Auto-generated method stub
	
		 create(dao);

	//	list(dao);
	//	read(dao);
	//	update(dao);
	//	read(dao);
	//	read(dao);
	//	delete(dao);
	//	bdelete(dao);
	//	total(dao);
		
	}

	private static void bdelete(ReplyDAO dao) {
		// TODO Auto-generated method stub
		int bbsno = 3;

		if (dao.delete(bbsno)) {
			p("삭제 성공");
		} else {
			p("삭제 실패");
		}
	}

	/*
	 * Map map = new HashMap(); Map map1 = new HashMap(); map.put("num", 1);
	 * map.put("passwd", "1234"); map1.put("col", "name"); map1.put("word", "홍");
	 * int i = dao.total(map1);
	 * 
	 * if(dao.passCheck(map)) { System.out.println("비밀번호 맞음"); }else
	 * System.out.println("비밀번호 틀림"); System.out.println(i);
	 */


	private static void create(ReplyDAO dao) {
		ReplyDTO dto = new ReplyDTO();
	
		dto.setContent("유저 11의 답글입니다322aa44"); 
		dto.setId("user11");      
		dto.setBbsno(9);    
		

		if (dao.create(dto)) {
			p("등록 성공");
		} else {
			p("등록 실패");
		}

	}

	private static void read(ReplyDAO dao) {
		int num = 1;

		ReplyDTO dto = dao.read(num);

		p(dto);
	}

	private static void update(ReplyDAO dao) {
		ReplyDTO dto = dao.read(3);
		
		dto.setContent("다시 내용변경");
		

		if (dao.update(dto)) {
			p("변경 성공");
		} else {
			p("변경 실패");
		}
	}

	private static void delete(ReplyDAO dao) {
		int rnum = 2;

		if (dao.delete(rnum)) {
			p("삭제 성공");
		} else {
			p("삭제 실패");
		}
	}

	private static void list(ReplyDAO dao) {
		Map map = new HashMap();
		map.put("bbsno", 119);
		map.put("sno", 1);
		map.put("eno", 10);

		List<ReplyDTO> list = dao.list(map); 

		for (int i = 0; i < list.size(); i++) {
			ReplyDTO dto = list.get(i);

			p(dto);
		}
	}

	private static void total(ReplyDAO dao) {
		Map map = new HashMap();
		map.put("col", "name");
		map.put("word", "s");

		int bbsno = 3;
		
		int total = dao.total(bbsno);
		
		System.out.println("레코드수: "+dao.total(bbsno));
	}

	

	

//	private static void replyCreate(ReplyDAO dao) {
//		ReplyDTO dto = dao.replyRead(1);
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

	

	private static void p(ReplyDTO dto) {
		p("일련번호 : " +	 dto.getRnum());
		p("내용 : " + 	 dto.getContent());
		p("작성일 : " + 	 dto.getRegdate());
		p("Id : " +  	 dto.getId());
		p("부모글번호 : " +  dto.getBbsno());
		p("-----------read추가-------------");
		
	}

	private static void p(String string) {
		System.out.println(string);
	}

}

