package com.springmvc.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.domain.boardDTO;
import com.springmvc.domain.commentDTO;
import com.springmvc.domain.criteria;
import com.springmvc.service.BoardService;

@Controller
@RequestMapping("/board")
public class boardcontroller {
	
	@Autowired
	BoardService bs;

	 //전체 게시판 이동
	@RequestMapping("/")
	public String board(Model model,HttpServletRequest req, criteria cri) {
		bs.getallboardlist(model, cri);
		return "board/";
	}
	
	//페이징된 전체 게시판 이동
	@GetMapping("/{num}")
	public String boardnum(@PathVariable("num")int num, Model model,HttpServletRequest req, criteria cri) {
		cri.setPagenum(num);
		bs.getallboardlist(model, cri);
		return "board";
	}
	
	 //커뮤니티 게시판 이동
	@GetMapping("/commu/{num}")
	public String commuboard(@PathVariable("num")int num,Model model, criteria cri) {
		cri.setPagenum(num);
		bs.getcommuboardlist(model, cri);
		return "commuboard";
	}
	
	//자랑해요 게시글 상세 페이지
	@GetMapping("/commu/view/{pageNum}/{num}")
	public String commuview(@PathVariable("pageNum") int pageNum,@PathVariable("num") int num, Model model, HttpServletRequest req) {
		model.addAttribute("num",num);
		model.addAttribute("pageNum",pageNum);
		bs.getcommuboardview(model, req);
		return "commuboardview";
	}
	
	//자랑해요 게시글 수정 페이지
	@GetMapping("/commu/view/{pageNum}/updateboard/{num}") 
	public ModelAndView updatecommuboardview(@PathVariable("pageNum") int pageNum,@PathVariable("num") int num,@ModelAttribute("updateboard") boardDTO board,Model model,HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		board = bs.getcommuboardByNum(num , req);
		mav.addObject("updateboard",board);				
		mav.addObject("num",num);
		mav.addObject("pageNum",pageNum);
		mav.setViewName("updateboard");
		return mav;
	}
	
	//Q&A 게시글 수정 페이지
	@GetMapping("/qna/view/{pageNum}/updateboard/{num}") 
	public ModelAndView updateqnaboardview(@PathVariable("pageNum") int pageNum,@PathVariable("num") int num,@ModelAttribute("updateboard") boardDTO board,Model model,HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		board = bs.getqnaboardByNum(num , req);
		mav.addObject("updateboard",board);				
		mav.addObject("num",num);
		mav.addObject("pageNum",pageNum);
		mav.setViewName("updateboard");
		return mav;
	}
	
	//게시글 수정 기능
	@PostMapping("/commu/view/{pageNum}/updateboard/{num}") 
	public String updatecommuboard(@PathVariable("num") String num,@PathVariable("pageNum") String pageNum,@ModelAttribute("updateboard") boardDTO board,Model model,HttpServletRequest req) {
		bs.updatecommuboard(board, req);
		return "redirect:/board/"+pageNum;
	}
	
	//게시글 수정 기능
	@PostMapping("/qna/view/{pageNum}/updateboard/{num}") 
	public String updateqnaboard(@PathVariable("num") String num,@PathVariable("pageNum") String pageNum,@ModelAttribute("updateboard") boardDTO board,Model model,HttpServletRequest req) {
		bs.updateqnaboard(board, req);
		return "redirect:/board/"+pageNum;
	}
	
	//자랑해요 게시글 삭제
	@GetMapping("/commu/view/{pageNum}/deleteboard/{num}")	
	public String deletecommuboard(@PathVariable("num") int num,@PathVariable("pageNum") String pageNum) {
		bs.deletecommuboard(num);
		return "redirect:/board/"+pageNum;
	}
	
	//Q&A 게시글 삭제
	@GetMapping("/qna/view/{pageNum}/deleteboard/{num}")	
	public String deleteqnaboard(@PathVariable("num") int num,@PathVariable("pageNum") String pageNum) {
		bs.deleteqnaboard(num);
		return "redirect:/board/"+pageNum;
	}
	
	//자랑해요 추천기능
	@GetMapping("/commu/view/{pageNum}/{num}/{recom}")	
	public String commurecom(@PathVariable("pageNum") int pageNum,@PathVariable("num") int num, @PathVariable("recom")String recom,Model model, HttpServletRequest req) {
		bs.commurecom(model, pageNum, num, recom, req);
		return "commuboardview";
	}
	
	//Q&A 추천기능
	@GetMapping("/qna/view/{pageNum}/{num}/{recom}")	
	public String qnarecom(@PathVariable("pageNum") int pageNum,@PathVariable("num") int num, @PathVariable("recom")String recom,Model model, HttpServletRequest req) {
		bs.qnarecom(model, pageNum, num, recom, req);
		return "qnaboardview";
	}
	
	//자랑해요 게시판 정렬 기능
	@GetMapping("/commu/{sort}/1")	
	public String commusort(@PathVariable("sort")String sort, Model model, criteria cri) {
		model.addAttribute("sort", sort);
		bs.getsortcommuboardlist(model, cri, sort);
		return "commuboard";
	}
	
	//정렬된 자랑해요 게시판 페이징처리
	@GetMapping("/commu/{sort}/{num}")	
	public String commusortpage(@PathVariable("sort")String sort, @PathVariable("num")int num, Model model, criteria cri) {
		cri.setPagenum(num);
		model.addAttribute("sort",sort);
		bs.getsortcommuboardlist(model, cri, sort);
		return "commuboard";
	}
	
	//Q&A 게시판
	@GetMapping("/qna/{num}") 
	public String qnaboard(@PathVariable("num")int num, Model model, criteria cri) {
		cri.setPagenum(num);
		bs.getqnaboardlist(model, cri);
		return "qnaboard";
	}
	
	//Q&A 게시글 상세 페이지
	@GetMapping("/qna/view/{pageNum}/{num}")	
	public String qnaview(@PathVariable("pageNum") int pageNum,@PathVariable("num") int num,Model model, HttpServletRequest req) {
		model.addAttribute("num",num);
		bs.getqnaboardview(model, req);
		return "qnaboardview";
	}
	
	//전체게시글 제목 or 내용 검색
	@PostMapping("/search") 
	public String serach(Model model, HttpServletRequest req, criteria cri) {
		String content = req.getParameter("content");
		bs.search(model, content, cri);
		return "board";
	}
	
	//자랑해요 게시글 제목 or 내용 검색
	@PostMapping("/commu/search")	
	public String commusearch(Model model, HttpServletRequest req, criteria cri) {
		String content = req.getParameter("content");
		bs.commusearch(model, content, cri);
		return "commuboard";
	}
	
	//Q&A 게시글 제목 or 내용 검색
	@PostMapping("/qna/search")		
	public String qnasearch(Model model, HttpServletRequest req, criteria cri) {
		String content = req.getParameter("content");
		bs.qnasearch(model, content, cri);
		return "qnaboard";
	}
	
	//전체게시판 검색 페이징처리
	@GetMapping("/{search}/{pageNum}")	
	public String boardsearch(@PathVariable("search") String search, @PathVariable("pageNum") int pageNum,Model model, criteria cri) {
		cri.setPagenum(pageNum);
		bs.search(model, search, cri);
		return "board";
	}
	
	//자랑해요 게시판 검색 페이징처리
	@GetMapping("/commu/search/{search}/{pageNum}")	
	public String commusearchpage(@PathVariable("search") String search, @PathVariable("pageNum") int pageNum,Model model, criteria cri) {
		cri.setPagenum(pageNum);
		bs.commusearch(model, search, cri);
		return "commuboard";
	}
	
	//Q&A 게시판 검색 페이징처리
	@GetMapping("/qna/search/{search}/{pageNum}")	
	public String qnasearchpage(@PathVariable("search") String search, @PathVariable("pageNum") int pageNum,Model model, criteria cri) {
		cri.setPagenum(pageNum);
		bs.qnasearch(model, search, cri);
		return "qnaboard";
	}
	
	//Q&A 정렬 기능
	@GetMapping("/qna/{sort}/1")	
	public String qnasort(@PathVariable("sort")String sort, Model model, criteria cri) {
		model.addAttribute("sort",sort);
		bs.getsortqnaboardlist(model, cri, sort);
		return "qnaboard";		
	}
	
	//정렬된 Q&A 게시판 페이징 처리
	@GetMapping("/qna/{sort}/{num}")	
	public String qnasortpage(@PathVariable("sort")String sort, @PathVariable("num")int num, Model model, criteria cri) {
		cri.setPagenum(num);
		model.addAttribute("sort",sort);
		bs.getsortqnaboardlist(model, cri, sort);
		return "qnaboard";
	}
	
	//추천해요 게시판
	@GetMapping("/recom") 
	public String recomboard(Model model, criteria cri) {
		bs.getarecomboardlist(model, cri);
		return "recomboard";
	}
	
	//추천해요 검색 기능
	@PostMapping("/recom/search")	
	public String recomsearch(Model model, HttpServletRequest req, criteria cri) {
		String content = req.getParameter("content");
		bs.recomsearch(model, content, cri);
		return "recomboard";
	}
	
	//추천해요 게시판 검색 페이징처리
	@GetMapping("/recom/search/{search}/{num}")	
	public String recomsearchpage(@PathVariable("search") String search, @PathVariable("pageNum") int pageNum,Model model, criteria cri) {
		cri.setPagenum(pageNum);
		bs.recomsearch(model, search, cri);
		return "recomboard";
	}
	
	//댓글 달기
	@PostMapping("/addcomment")
	@ResponseBody
	public String addcomment(@ModelAttribute("commentDTO")commentDTO comment) {
		System.out.println("등록"+comment.toString());
		bs.writecomment(comment);
		return "success";
	}
	
	//게시글의 댓글목록 가져오기
	@GetMapping("/getcommentlist")
	@ResponseBody
	public List<commentDTO> getcommentlist(@ModelAttribute("commentDTO")commentDTO comment) {
		System.out.println("댓글목록");
		return bs.getcommentlist(comment);
	}
	
	//댓글 삭제
	@PostMapping("/deletecomment")
	@ResponseBody
	public String deletecomment(@ModelAttribute("commentDTO")commentDTO comment) {
		System.out.println("삭제"+comment.toString());	
		bs.deletecomment(comment);
		return "success";
	}
}