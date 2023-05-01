package com.springmvc.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springmvc.domain.boardDTO;
import com.springmvc.service.BoardService;
import com.springmvc.service.HosService;
import com.springmvc.service.NoticeService;

@Controller
@RequestMapping("/")
 public class homecontroller {
	
	@Autowired
	BoardService bs;
	
	@Autowired
	NoticeService ns;
	
	@Autowired
	HosService hs;

	@RequestMapping
	public String index() {
		return "index";
	}
	@GetMapping("/home")
	public String home() {
		return "index";
	}
	@GetMapping("/boardwrite")	//게시글 작성 페이지
	public String boardwrite(@ModelAttribute("board") boardDTO board,Model model) {
		return "boardwrite";
	}
	
	@PostMapping("/boardwrite")	//게시글 등록
	public String wrtie(@ModelAttribute("board") boardDTO board,Model model,HttpServletRequest req) {
		if(board.getBoard_type().equals("commu") || board.getBoard_type().equals("qna")) {
			bs.writeboard(board,req);
		}
		else if(board.getBoard_type().equals("notice") || board.getBoard_type().equals("event")) {
			ns.writeboard(board, req);
		}
		else {
		}
		return "redirect:/home";
	}
}