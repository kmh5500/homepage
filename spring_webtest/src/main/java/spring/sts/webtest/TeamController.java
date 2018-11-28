package spring.sts.webtest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.bbs.BbsDTO;
import spring.model.team.TeamDAO;
import spring.model.team.TeamDTO;
import spring.utility.webtest.Utility;

@Controller
public class TeamController {

	@Autowired
	public TeamDAO dao;
	
	
	
	
	
	
	@RequestMapping(value="/team/delete")
	public String delete(int no,Model model) {
		boolean dflag=dao.chenkRefnum(no);
		boolean flag=dao.delete(no);
		if(!dflag) {
			if(flag) {
			
				return "redirect:/team/list";
			}else {
				model.addAttribute("dflag", dflag);
				model.addAttribute("flag", flag);
				return "/team/delete";
				
			}
		
		}else {
			
			model.addAttribute("dflag", dflag);
			model.addAttribute("flag", flag);
			return "/team/delete";
		}
	}
	
	
	@RequestMapping(value="/team/update" , method=RequestMethod.POST)
	public String update(TeamDTO dto,Model model) {
		
		if(dao.update(dto)) {
			return "redirect:/team/list";
		}else {
			
			return "/error/error";
			
		}
		
		
	}
	@RequestMapping(value="/team/update" , method=RequestMethod.GET)
	public String update(int no,Model model) {
		TeamDTO dto = dao.read(no);
		model.addAttribute("dto", dto);
		return "/team/update";
	}
	@RequestMapping(value="/team/create" , method=RequestMethod.POST)
	public String create(TeamDTO dto,Model model) {
		
		if(dao.create(dto)) {
			return "redirect:/team/list";
		}else {
			
			return "/error/error";
			
		}
		
			
	}
	@RequestMapping(value="/team/create" , method=RequestMethod.GET)
	public String create() {
		
		return "/team/create";
	}
	
	
	@RequestMapping("/team/read")
	public String read(int no,Model model) {
		
		
		TeamDTO dto = dao.read(no);
		model.addAttribute("dto", dto);
		
		return "/team/read";
	}
	
	@RequestMapping("/team/list")
	public String list(HttpServletRequest request, Model model) {
		


		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		// 검색 관련 처리

		if (col.equals("total")) {
			word = "";
		}

		int nowPage = 1;
		int recordPerPage = 5;
		// paging 관련 처리

		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		// 처음 가져온 nowPage의 값이 null일 경우 형변환을 시도하면 Exception에러가 날 수 있으므로

		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;
		// DB에서 가져올 레코드의 첫번호, 끝번호 설정

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		List<TeamDTO> list = dao.list(map);

		int totalRecord = dao.total(map);

		String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);
		// 전체 레코드 개수는 col, word 필요
		// 검색 시에도 페이징을 해줘야 하기 때문에

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("col", col);
		model.addAttribute("word", word);

		
		return "/team/list";
	}
}
