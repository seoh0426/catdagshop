package com.springmvc.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.springmvc.domain.boardDTO;
import com.springmvc.domain.criteria;
import com.springmvc.domain.pageDTO;
import com.springmvc.repository.NoticeRepository;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeRepository nr;
	
	//글쓰기
	@Override
	public void writeboard(boardDTO board, HttpServletRequest req) {
		nr.writeboard(board, req);
	}

	//공지사항 전체 게시글 가져오기
	@Override
	public void getnoticeboardlist(Model model, criteria cri) {
		int total = nr.getnoticecount();
		pageDTO page = new pageDTO(cri, total);
		List<boardDTO> boardlist = nr.getnoticeboardlist(page);
		model.addAttribute("boardlist",boardlist);
		model.addAttribute("page",page);
	}

	//이벤트 전체 게시글 가져오기
	@Override
	public void geteventboardlist(Model model, criteria cri) {
		int total = nr.geteventcount();
		pageDTO page = new pageDTO(cri, total);
		List<boardDTO> boardlist = nr.geteventboardlist(page);
		model.addAttribute("boardlist",boardlist);
		model.addAttribute("page",page);
	}

	//공지사항 게시글 가져오기
	@Override
	public void getnoticeboardview(Model model, HttpServletRequest req) {
		int num =  (int)model.getAttribute("num");
		boardDTO board = nr.getnoticeboardview(num, req);
		nr.noticeviewhit(num);
		model.addAttribute("board",board);
	}

	//이벤트 게시글 가져오기
	@Override
	public void geteventboardview(Model model, HttpServletRequest req) {
		int num =  (int)model.getAttribute("num");
		boardDTO board = nr.geteventboardview(num, req);
		nr.eventviewhit(num);
		model.addAttribute("board",board);
	}

	//공지사항 게시글 수정하기
	@Override
	public void updatenoticeboard(boardDTO board, HttpServletRequest req) {
		boardDTO fileboard = nr.getnoticeboardview(board.getNum(), req);
		board.setFiles(fileboard.getFiles());
		nr.updateboard(board, req);
		
	}

	//이벤트 게시글 수정하기
	@Override
	public void updateeventboard(boardDTO board, HttpServletRequest req) {
		boardDTO fileboard = nr.geteventboardview(board.getNum(), req);
		board.setFiles(fileboard.getFiles());
		nr.updateboard(board, req);
		
	}

	//공지사항 게시글 번호로 해당 게시판의 게시글 가져오기
	@Override
	public boardDTO getnoticeboardByNum(int num, HttpServletRequest req) {
		boardDTO board = nr.getnoticeboardview(num, req);
		if(board.getBoard_type().equals("공지사항")) {
			board.setBoard_type("notice");
		}
		return board;
	}

	//이벤트 게시글 번호로 해당 게시판의 게시글 가져오기
	@Override
	public boardDTO geteventboardByNum(int num, HttpServletRequest req) {
		boardDTO board = nr.geteventboardview(num, req);
		if(board.getBoard_type().equals("이벤트")) {
			board.setBoard_type("event");
		}
		if(board.getTagvalue().equals("고양이")) {
			board.setAnimal_type("cat");
		}
		if(board.getTagvalue().equals("강아지")) {
			board.setAnimal_type("dog");
		}
		return board;
	}

	//공지사항 게시글 검색하기
	@Override
	public void noticesearch(Model model, String content, criteria cri) {
		int total = nr.getnoticesearchcount(content);
		pageDTO page = new pageDTO(cri, total);
		List<boardDTO> boardlist = nr.getnoticesearch(content, page);
		model.addAttribute("search",content);
		model.addAttribute("boardlist",boardlist);
		model.addAttribute("page",page);
		
	}

	//이벤트 게시글 검색하기
	@Override
	public void eventsearch(Model model, String content, criteria cri) {
		int total = nr.geteventsearchcount(content);
		pageDTO page = new pageDTO(cri, total);
		List<boardDTO> boardlist = nr.geteventsearch(content, page);
		for(boardDTO board : boardlist) {
			System.out.println("서비스_이벤트_검색보드: "+board.toString());
		}
		model.addAttribute("search",content);
		model.addAttribute("boardlist",boardlist);
		model.addAttribute("page",page);
		
	}
	
	//공지사항 게시글 삭제
	@Override
	public void deletenoticeboard(int num) {
		nr.deletenoticeboard(num);
	}
	
	//이벤트 게시글 삭제
	@Override
	public void deleteeventboard(int num) {
		nr.deleteeventboard(num);
	}

	//이벤트 게시글 추천하기
	@Override
	public void eventrecom(Model model, int pageNum, int num, String recom, HttpServletRequest req) {
		nr.eventrecom(num, recom);
		boardDTO board = nr.geteventboardview(num, req);
		model.addAttribute("num",num);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("board",board);
		
	}

	
}