package team;

import java.util.ArrayList;

public class TeamTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TeamDAO dao= new TeamDAO();
		List(dao);
		//create(dao);
		//read(dao);
		//update(dao);
		//delete(dao);
		//read(dao);

	}

	private static void delete(TeamDAO dao) {
		int no =1;
		// TODO Auto-generated method stub
		if(dao.delete(no)) {
			p("성공");
		}else p("실패");
		
	}

	private static void update(TeamDAO dao) {
		TeamDTO dto = dao.read(1);
		dto.setHobby("게임");
		dto.setName("구길동");
		dto.setAddress("경상도 부산광역시");
		dto.setAddress2("해운대 타워펠리스");
		
		// TODO Auto-generated method stub
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}
	}

	private static void read(TeamDAO dao) {
		// TODO Auto-generated method stub
		TeamDTO dto= dao.read(1);
		p(dto);
	}

	private static void create(TeamDAO dao) {
		// TODO Auto-generated method stub
		TeamDTO dto= new TeamDTO();
		dto.setName("다길동");
		dto.setGender("여자");
		dto.setHobby("게임");
		dto.setPhone("010-7878-9898");
		dto.setSkills("C++");
		dto.setZipcode("45695");
		dto.setAddress("경기도 화성시");
		dto.setAddress2("서산 2번지");
		
		if(dao.create(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void List(TeamDAO dao) {
		// TODO Auto-generated method stub
		
		java.util.List<TeamDTO> list = dao.list();
		for(int i=0; i<list.size();i++) {
			TeamDTO dto = list.get(i);
			p(dto);
			p("-----------------");
		}
		
	}

	private static void p(TeamDTO dto) {
		// TODO Auto-generated method stub
		p("번호:"+dto.getNo());
		p("이름:"+dto.getName());
		p("성별:"+dto.getGender());
		p("보유기술:"+dto.getSkills());
		p("전화번호:"+dto.getPhone());
		
		p("-------------------------");
		p("취미:" +dto.getHobby());
		p("우편번호:" +dto.getZipcode());
		p("주소:" +dto.getAddress());
		p("주소2:" +dto.getAddress2());
	}

	private static void p(String string) {
		// TODO Auto-generated method stub
		System.out.println(string);
		
	}

}
