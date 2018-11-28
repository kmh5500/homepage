package spring.model.team;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import spring.model.bbs.BbsDTO;

public class TeamTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		

		Resource resource = new ClassPathResource("daoTest.xml");
		
		BeanFactory factory = new XmlBeanFactory(resource);
		
		TeamDAO dao = (TeamDAO)factory.getBean("team");
		
		
		
		//create(dao);
		//read(dao);
	//	cehckRefnum(dao);
	//	reply(dao);
	//	read(dao);
		list(dao);
		
		
		
		

	}

	private static void list(TeamDAO dao) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("col", "name");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);

		List<TeamDTO> list = dao.list(map);

		for (int i = 0; i < list.size(); i++) {
			TeamDTO dto = list.get(i);

			p(dto);
			p("-------------");
		}
	}

	private static void reply(TeamDAO dao) {
		// TODO Auto-generated method stub
		TeamDTO dto = dao.replyRead(12);
	
		dto.setPhone("010-4577-7777");
		dto.setHobby("운동");
		dto.setSkills("Java");
		dto.setGender("여자");
//		dto.setZipcode("5555");
//		dto.setAddress("서울시 종로구");
//		dto.setAddress2("코아빌딩");
		Map map = new HashMap();
		map.put("grpno", dto.getGrpno());
		map.put("ansnum",dto.getAnsnum());
		dao.upAnsnum(map);
		if(dao.replyCreate(dto)) {
			p("성공");
		}else
			p("실패");
	}

	private static void cehckRefnum(TeamDAO dao) {
		// TODO Auto-generated method stub
		if(dao.chenkRefnum(11)) {
			p("삭제 할수없습니다");
			
		}else {
			p("삭제가능합니다.");
			}
	}

	private static void read(TeamDAO dao) {
		// TODO Auto-generated method stub
		TeamDTO dto = dao.read(11);
		p(dto);
	}



	private static void create(TeamDAO dao) {
		// TODO Auto-generated method stub
		TeamDTO dto = new TeamDTO();
		dto.setName("길수");
		dto.setPhone("010-4577-7777");
		dto.setHobby("운동");
		dto.setSkills("Java");
		dto.setGender("여자");
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
	
	private static void p(TeamDTO dto) {
		// TODO Auto-generated method stub
		System.out.println(dto.getName());
		System.out.println(dto.getNo());
		System.out.println(dto.getGender());
		System.out.println(dto.getHobby());
		System.out.println(dto.getPhone());
		System.out.println(dto.getZipcode());
	}

}
