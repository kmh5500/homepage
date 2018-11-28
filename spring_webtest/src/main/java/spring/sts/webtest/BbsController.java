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

import spring.model.bbs.BbsDAO;
import spring.model.bbs.BbsDTO;
import spring.model.bbs.BbsMgr;
import spring.model.bbs.ReplyDAO;
import spring.model.bbs.ReplyDTO;
import spring.utility.webtest.Utility;

@Controller
public class BbsController {

	@Autowired
	private BbsDAO dao;

	@Autowired
	private ReplyDAO rdao;

	@Autowired
	private BbsMgr mgr;
	
	@RequestMapping("/bbs/rdelete")
	public String rdelete(int rnum, int bbsno, String nowPage,
			String col, String word, int nPage,Model model) {
		
		
		int total= rdao.total(bbsno);
		int totalPage= (int)(Math.ceil((double)total/3));
		
		if(rdao.delete(rnum)) {
			if(nPage!=1 && nPage==totalPage&& total%3==1) nPage=nPage-1; 
			model.addAttribute("bbsno", bbsno);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("col",col );
			model.addAttribute("word",word );
			model.addAttribute("nPage",nPage );
			return "redirect:/bbs/read";
			
		}else {
			return "/error/error";
		}
	}
	
	@RequestMapping("/bbs/rupdate")
	public String rupdate(ReplyDTO dto, Model model,String nowPage,
			String col, String word, String nPage) {
		if(rdao.update(dto)) {
			model.addAttribute("bbsno", dto.getBbsno());
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("col",col );
			model.addAttribute("word",word );
			model.addAttribute("nPage",nPage );
			return "redirect:/bbs/read";
			
		}else {
			return "/error/error";
		}
	}
	
	
	@RequestMapping("/bbs/rcreate")
	public String rcreate(ReplyDTO dto, Model model,
			String nowPage, String col, String word) {
		if(rdao.create(dto)) {
			model.addAttribute("bbsno", dto.getBbsno());
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("col",col );
			model.addAttribute("word",word );
			return "redirect:/bbs/read";
			
		}else {
			return "/error/error";
		}
		
	}

	@RequestMapping(value = "/bbs/delete", method = RequestMethod.POST)
	public String delete(int bbsno, String passwd, String oldfile, HttpServletRequest request,Model model) {

		Map map = new HashMap();
		map.put("passwd", passwd);
		String upDir = request.getRealPath("/bbs/storage");
		map.put("bbsno", bbsno);
		boolean pflag = dao.passCheck(map);
		
		if (pflag) {
			
			try {
				
				mgr.delete(bbsno); 
		
				Utility.deleteFile(upDir, oldfile);
				model.addAttribute("nowPage", request.getParameter("nowPage"));
				model.addAttribute("col", request.getParameter("col"));
				model.addAttribute("word", request.getParameter("word"));
				
				return "redirect:/bbs/list";
			} catch (Exception e) {
				// TODO: handle exception
				return "/error/error";
			}
			
		} else {
			
			return "/error/passwdError";
		}

	}

	@RequestMapping(value = "/bbs/delete", method = RequestMethod.GET)
	public String delete(int bbsno, HttpServletRequest request) {

		boolean flag = dao.checkRefnum(bbsno);
		request.setAttribute("flag", flag);
		return "/bbs/delete";
	}

	@RequestMapping(value = "/bbs/reply", method = RequestMethod.POST)
	public String reply(BbsDTO dto, HttpServletRequest request) {

		String upDir = request.getRealPath("/view/storage");

		int filesize = (int) dto.getFilenameMF().getSize();
		String filename = "";
		if (filesize > 0)
			filename = Utility.saveFileSpring(dto.getFilenameMF(), upDir);

		dto.setFilename(filename);
		dto.setFilesize(filesize);


		String str = "redirect:/bbs/list";
		
		try	{

			mgr.reply(dto);
			return str;
		} catch (Exception e) {
				e.printStackTrace();
				Utility.deleteFile(upDir, filename);
				str = "/error/error";
			
			return str;

		}
	}

	@RequestMapping(value = "/bbs/reply", method = RequestMethod.GET)
	public String reply(int bbsno, Model model) {
		BbsDTO dto = dao.replyRead(bbsno);

		model.addAttribute("dto", dto);

		return "/bbs/reply";

	}

	@RequestMapping(value = "/bbs/update", method = RequestMethod.POST)
	public String update(BbsDTO dto, HttpServletRequest request, String oldfile ,Model model) {

		String upDir = request.getRealPath("/view/storage");

		Map map = new HashMap();
		map.put("bbsno", dto.getBbsno());
		map.put("passwd", dto.getPasswd());

		int filesize = (int) dto.getFilenameMF().getSize();
		String filename = "";
		boolean pflag = dao.passCheck(map);

		if (pflag) {
			if (filesize > 0) {
				if (oldfile != null) {
					Utility.deleteFile(upDir, oldfile);
				}
				filename = Utility.saveFileSpring(dto.getFilenameMF(), upDir);

			}
			dto.setFilename(filename);
			dto.setFilesize(filesize);

			if (dao.update(dto)) {
				model.addAttribute("nowPage", request.getParameter("nowPage"));
				model.addAttribute("col", request.getParameter("col"));
				model.addAttribute("word", request.getParameter("word"));
				return "redirect:/bbs/list";
			} else {
				return "/error/error";
			}

		} else {
			return "/error/passwdError";

		}

	}

	@RequestMapping(value = "/bbs/update", method = RequestMethod.GET)
	public String update(int bbsno, Model model) {

		BbsDTO dto = dao.read(bbsno);
		model.addAttribute("dto", dto);

		return "/bbs/update";
	}

	@RequestMapping(value = "/bbs/create", method = RequestMethod.POST)
	public String create(BbsDTO dto, HttpServletRequest request) {

		int filesize = (int) dto.getFilenameMF().getSize();
		String filename="";
		String basePath = request.getRealPath("/bbs/storage");
		if (filesize > 0)
			filename= (Utility.saveFileSpring(dto.getFilenameMF(), basePath));
		dto.setFilesize(filesize);
		dto.setFilename(filename);
		String str = "redirect:/bbs/list";
		boolean flag = dao.create(dto);
		
		if (flag) {

			return "redirect:/bbs/list";
		} else {
			if (!filename.equals("")) {
				Utility.deleteFile(basePath, dto.getFilename());
			}	return "/error/error";
		}
	
	
	}

	@RequestMapping(value = "/bbs/create", method = RequestMethod.GET)
	public String create() {

		return "/bbs/create";
	}

	@RequestMapping("/bbs/read")
	public String read(int bbsno, Model model,HttpServletRequest request) {

		dao.upviewcnt(bbsno);

		BbsDTO dto = dao.read(bbsno);

		String content = dto.getContent();
		content = content.replaceAll("\r\n", "<br>");
		dto.setContent(content);
		
		model.addAttribute("dto", dto);
		
		/* 댓글처리*/
		String url ="read";
		int nPage =1;
		if(request.getParameter("nPage")!=null) {
			nPage=Integer.parseInt(request.getParameter("nPage"));
		}
		int recordPerPage = 3;
		int sno=((nPage-1)*recordPerPage)+1;
		int eno = nPage* recordPerPage;
		
		Map map= new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("bbsno", bbsno);
		
		List<ReplyDTO> rlist=rdao.list(map);
		int total= rdao.total(bbsno);
		int nowPage = Integer.parseInt(request.getParameter("nowPage"));
		String col = request.getParameter("col");
		String word = request.getParameter("word");
				
		String paging = Utility.rpaging(total, nowPage, recordPerPage,
				col, word,bbsno, nPage,url);
		
		model.addAttribute("rlist", rlist);
		model.addAttribute("nPage", nPage);
		model.addAttribute("paging", paging);
		
		/*댓글 처리 끝*/
	

		return "/bbs/read";
	}

	@RequestMapping("/bbs/list")
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

		List<BbsDTO> list = dao.list(map);

		int totalRecord = dao.total(map);

		String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);
		// 전체 레코드 개수는 col, word 필요
		// 검색 시에도 페이징을 해줘야 하기 때문에

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("rdao", rdao);
		

		return "/bbs/list";
	}

}
