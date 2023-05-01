package com.springmvc.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springmvc.domain.boardDTO;
import com.springmvc.domain.criteria;
import com.springmvc.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class noticecontroller {
	
	@Autowired
	NoticeService ns;
	
	@Autowired
	criteria cri;

	//공지사항 게시판 이동
	@RequestMapping("{num}")
	public String notice(@PathVariable("num")int num, Model model) {
		cri.setPagenum(num);
		ns.getnoticeboardlist(model, cri);
		return "notice";
	}
	
	//공지사항 게시글 이동
	@GetMapping("/view/{pageNum}/{num}")
	public String noticeview(@PathVariable("pageNum") int pageNum,@PathVariable("num") int num, Model model, HttpServletRequest req) {
		model.addAttribute("num",num);
		model.addAttribute("pageNum",pageNum);
		ns.getnoticeboardview(model, req);
		return "noticeview";
	}
	
	//이벤트 게시판 이동
	@GetMapping("/event/{num}")
	public String event(@PathVariable("num")int num, Model model) {
		cri.setPagenum(num);
		ns.geteventboardlist(model, cri);
		return "event";
	}
	
	//이벤트 게시글 이동
	@GetMapping("/event/view/{pageNum}/{num}")
	public String eventview(@PathVariable("pageNum") int pageNum,@PathVariable("num") int num, Model model, HttpServletRequest req) {
		model.addAttribute("num",num);
		model.addAttribute("pageNum",pageNum);
		ns.geteventboardview(model, req);
		return "eventview";
	}
	
	//공지사항 게시글 수정 페이지 이동
	@GetMapping("/view/{pageNum}/updatenotice/{num}")
	public String updatenoticeboardview(@PathVariable("pageNum") int pageNum,@PathVariable("num") int num,@ModelAttribute("updateboard") boardDTO board,Model model,HttpServletRequest req) {
		boardDTO updateboard = ns.getnoticeboardByNum(num, req);
		model.addAttribute("updateboard",updateboard);
		model.addAttribute("num",num);
		model.addAttribute("pageNum",pageNum);
		return "updateboard";
	}
	
	//공지사항 게시글 수정 기능
	@PostMapping("/view/{pageNum}/updatenotice/{num}")
	public String updatenoticeaction(@PathVariable("num") String num,@PathVariable("pageNum") String pageNum,@ModelAttribute("updateboard") boardDTO board,Model model,HttpServletRequest req) {
		ns.updatenoticeboard(board, req);
		return "redirect:/notice/"+pageNum;
	}
	
	
	//이벤트 게시글 수정
	@GetMapping("/event/view/{pageNum}/updatenotice/{num}")
	public String updateeventboardview(@PathVariable("pageNum") int pageNum,@PathVariable("num") int num,@ModelAttribute("updateboard") boardDTO board,Model model,HttpServletRequest req) {
		ns.geteventboardByNum(num, req);
		model.addAttribute("updateboard",board);
		model.addAttribute("num",num);
		model.addAttribute("pageNum",pageNum);
		return "updateboard";
	}
	
	//이벤트 게시글 수정 기능
		@PostMapping("/event/view/{pageNum}/updatenotice/{num}")
		public String updateeventaction(@PathVariable("num") String num,@PathVariable("pageNum") String pageNum,@ModelAttribute("updateboard") boardDTO board,Model model,HttpServletRequest req) {
			ns.updateeventboard(board, req);
			return "redirect:/event/"+pageNum;
		}
	
	//공지사항 게시글 삭제
	@GetMapping("/view/{pageNum}/deleteboard/{num}")	
	public String deletenoticeboard(@PathVariable("num") int num,@PathVariable("pageNum") String pageNum) {
		ns.deletenoticeboard(num);
		return "redirect:/notice/"+pageNum;
	}
	
	//이벤트 게시글 삭제
	@GetMapping("/event/view/{pageNum}/deleteboard/{num}")	
	public String deleteeventboard(@PathVariable("num") int num,@PathVariable("pageNum") String pageNum) {
		ns.deleteeventboard(num);
		return "redirect:/event/"+pageNum;
	}
	
	//공지사항 게시글 검색
	@PostMapping("/search")	
	public String noticesearch(Model model, HttpServletRequest req, criteria cri) {
		String content = req.getParameter("content");
		ns.noticesearch(model, content, cri);
		return "notice";
	}
	
	//공지사항 게시글 검색 페이징 처리
	@GetMapping("/search/{search}/{pageNum}")	
	public String noticesearchpage(@PathVariable("search") String search, @PathVariable("pageNum") int pageNum,Model model, criteria cri) {
		cri.setPagenum(pageNum);
		ns.noticesearch(model, search, cri);
		return "notice";
	}
	
	
	//이벤트 게시글 검색
	@PostMapping("/event/search")	
	public String eventsearch(Model model, HttpServletRequest req, criteria cri) {
		String content = req.getParameter("content");
		ns.eventsearch(model, content, cri);
		return "event";
	}
	
	//이벤트 게시글 검색 페이징 처리
	@GetMapping("/event/search/{search}/{pageNum}")	
	public String eventsearchpage(@PathVariable("search") String search, @PathVariable("pageNum") int pageNum,Model model, criteria cri) {
		cri.setPagenum(pageNum);
		ns.eventsearch(model, search, cri);
		return "event";
	}
	
	//이벤트 게시글 추천
	@GetMapping("/event/view/{pageNum}/{num}/{recom}")	
	public String eventrecom(@PathVariable("pageNum") int pageNum,@PathVariable("num") int num, @PathVariable("recom")String recom,Model model, HttpServletRequest req) {
		ns.eventrecom(model, pageNum, num, recom, req);
		return "eventview";
	}
		
}