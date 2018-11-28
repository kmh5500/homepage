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

import spring.model.board.BReplyDAO;
import spring.model.board.BReplyDTO;
import spring.model.board.BoardDAO;
import spring.model.board.BoardDTO;
import spring.model.board.BoardMgr;
import spring.utility.webtest.Utility;


@Controller
public class BoardController {

		@Autowired
		private BoardDAO dao;
		
		@Autowired
		private BoardMgr mgr;
		
		
		@Autowired
		private BReplyDAO rdao;
		
		@RequestMapping(value="/board/update", method=RequestMethod.GET)
		public String update(int num, Model model) {
			
			BoardDTO dto = dao.read(num);
			model.addAttribute("dto", dto);
			return "/board/update";
			
		}
		
		@RequestMapping(value="/board/update", method=RequestMethod.POST)
		public String update(BoardDTO dto,HttpServletRequest request, Model model, String oldfile) {

			String basePath = request.getRealPath("/storage");
			
			dto.setFilename(Utility.saveFileSpring(dto.getFilenameMF(), basePath));
			dto.setFilesize((int)dto.getFilenameMF().getSize());
			
			
			Map map = new HashMap();
			map.put("num", dto.getNum());
			map.put("passwd", dto.getPasswd());
			
			boolean pflag = dao.passCheck(map);
			boolean flag=false;
			
			if(pflag) {
				flag= dao.update(dto);
			}
			
			String str=null;
			if(pflag) {
				if(flag ) {
					if(dto.getFilesize()>0) {
					Utility.deleteFile(basePath, oldfile);
					}
					model.addAttribute("nowPage", request.getParameter("nowPage"));
					model.addAttribute("col", request.getParameter("col"));
					model.addAttribute("word", request.getParameter("word"));
					return "redirect:/list";
				}else {
					if(dto.getFilesize()>0) {
						Utility.deleteFile(basePath, dto.getFilename());
						
					}
					return "/error";
					
				}
			}else {
				if(dto.getFilesize()>0) {
					Utility.deleteFile(basePath, dto.getFilename());
				}
				return "/passwdError";
			}
			
			

		}
		@RequestMapping(value="/board/read",method=RequestMethod.GET)
		public String read(int num, Model model,HttpServletRequest request) {
			dao.upcount(num);
			BoardDTO dto = dao.read(num);
			
			model.addAttribute("dto", dto);
			model.addAttribute("content", dto.getContent().replaceAll("\r\n","<br>"));
		
			
			
			
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
			map.put("bbsno", num);
			
			List<BReplyDTO> rlist=rdao.list(map);
			int total= rdao.total(num);
			int nowPage = Integer.parseInt(request.getParameter("nowPage"));
			String col = request.getParameter("col");
			String word = request.getParameter("word");
					
			String paging = Utility.rpaging(total, nowPage, recordPerPage,
					col, word,num, nPage,url);
			
			model.addAttribute("rlist", rlist);
			model.addAttribute("nPage", nPage);
			model.addAttribute("paging", paging);
			
			/*댓글 처리 끝*/
			
			
			return "/board/read";
		}
		
		
		@RequestMapping(value="/board/create",method=RequestMethod.GET)
		public String create() {
			return "/board/create";
		}
		
		
		@RequestMapping(value="/board/create",method=RequestMethod.POST)
		public String create(BoardDTO dto, HttpServletRequest request) {
			
			
			String upDir= request.getRealPath("/storage");

		
			dto.setFilename(Utility.saveFileSpring(dto.getFilenameMF(), upDir));
			dto.setFilesize((int)dto.getFilenameMF().getSize());
			dto.setIp(request.getRemoteAddr());//요청주소 획득 메소드
				
			
	
			
			
			boolean flag = dao.create(dto);
	
			if(flag) {
				return "redirect:/board/list";
			}else {
				return "/error";
			}
		}
		
		@RequestMapping("/board/list")
		public String list(HttpServletRequest request, Model model) {
			
			
			String col = Utility.checkNull(request.getParameter("col"));
			String word = Utility.checkNull(request.getParameter("word"));
			if(col.equals("total"))word="";
			
			int nowPage = 1;
			int recordPerPage= 5;
			
			if(request.getParameter("nowPage")!= null) {
				nowPage =Integer.parseInt(request.getParameter("nowPage"));
				
			}
			int sno= (nowPage -1)*recordPerPage+1;
			int eno=nowPage*recordPerPage;
			
			Map map= new HashMap();
			map.put("col", col);
			map.put("word", word);
			map.put("sno", sno);
			map.put("eno", eno);
			
			//1model사용
			// BoardDAO dao = new BoardDAO();
			
			List<BoardDTO> list = dao.list(map);
			int total = dao.total(map);
			String paging=Utility.paging3(total, nowPage, recordPerPage, col, word);
			
			//2request저장 col word nowPage request에 저장하여 이동.
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("nowPage", nowPage);
			return "/board/list";
			
		}
		
		@RequestMapping(value="/board/delete", method=RequestMethod.GET)
		public String delete(int num,Model model) {
			
			boolean flag= dao.checkrefnum(num);
			
			model.addAttribute("flag", flag);
			
			return "/board/delete";
		}
		
		@RequestMapping(value="/board/delete",method=RequestMethod.POST)
			public String delete(int num, String passwd,String oldfile, HttpServletRequest request,Model model) {
		//	public String delete(Map<Integer,String> map,String oldfile, HttpServletRequest requst) {
			
				Map map = new HashMap();
				map.put("num", num);
				map.put("passwd", passwd);
				boolean pflag= dao.passCheck(map);
				boolean flag=false;
				String basePath =request.getRealPath("/storage");
				if(pflag) {
				//	dao.delete(Integer.parseInt(map.get("num")));
					flag=dao.delete(num);
					if(flag) {
					Utility.deleteFile(basePath, oldfile);
					}
					model.addAttribute("nowPage", request.getParameter("nowPage"));
					model.addAttribute("col", request.getParameter("col"));
					model.addAttribute("word", request.getParameter("word"));
					return "redirect:/list";
				}else {
					
					return "/passwdError";
				}
			}
		
		
		@RequestMapping(value="/board/reply", method=RequestMethod.GET)
		public String reply(int num,Model model) {
			
			BoardDTO dto =  dao.readReply(num);
			
			model.addAttribute("dto",dto);
			
			return "/board/reply";
		}
		@RequestMapping(value="/board/reply", method=RequestMethod.POST)
		public String reply(HttpServletRequest request, BoardDTO dto,Model model) {
			
			String basePath = request.getRealPath("/storage");
			dto.setFilename(Utility.saveFileSpring(dto.getFilenameMF(), basePath ));
			dto.setFilesize((int)dto.getFilenameMF().getSize());
			dto.setIp(request.getRemoteAddr());
			
			boolean flag= mgr.reply(dto);
			if(flag) {
				return "redirect:/board/list";
			}
			else {
				return "/error";
			}
			
		}
}
