package com.springmvc.service;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.springmvc.domain.boardDTO;
import com.springmvc.domain.commentDTO;
import com.springmvc.domain.criteria;
import com.springmvc.domain.pageDTO;
import com.springmvc.repository.BoardRepositoty;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardRepositoty br;

	//글쓰기
	@Override //글쓰기
	public void writeboard(boardDTO board,HttpServletRequest req) {		
		br.writeboard(board,req);
	}

	//전체게시판목록기능
	@Override
	public void getallboardlist(Model model,criteria cri) {
		int total = br.getallcount();
		pageDTO page = new pageDTO(cri, total);
		List<boardDTO> boardlist = br.getallboardlist(page);
		List<boardDTO> bestrecomlist = br.getrecomboard();
		model.addAttribute("boardlist",boardlist);
		model.addAttribute("bestrecomlist",bestrecomlist);
		model.addAttribute("page",page);
	}
	
	//자랑해요 게시판 전체 게시글 가져오기
	@Override
	public void getcommuboardlist(Model model, criteria cri) {
		int total = br.getcommucount();
		pageDTO page = new pageDTO(cri, total);
		List<boardDTO> boardlist = br.getcommuboardlist(page);
		model.addAttribute("boardlist",boardlist);
		model.addAttribute("page",page);
	}
	
	//Q&A 게시판 전체 게시글 가져오기
	@Override
	public void getqnaboardlist(Model model, criteria cri) {
		int total = br.getqnacount();
		pageDTO page = new pageDTO(cri, total);
		List<boardDTO> boardlist = br.getqnaboardlist(page);
		model.addAttribute("boardlist",boardlist);
		model.addAttribute("page",page); 
	}
	
	//추천해요 게시판 전체 게시글 가져오기
	@Override
	public void getarecomboardlist(Model model,criteria cri) {
		int total = br.getrecomcount();
		pageDTO page = new pageDTO(cri, total);
		List<boardDTO> boardlist = br.getrecomboardlist(page);
		model.addAttribute("boardlist",boardlist);
		model.addAttribute("page",page);
	}
	
	 //자랑해요 게시판 정렬(최신순(기본), 인기순, 조회순)
	@Override
	public void getsortcommuboardlist(Model model, criteria cri, String sort) {
		int total = br.getcommucount();
		pageDTO page = new pageDTO(cri, total);
		List<boardDTO> boardlist = br.getsortcommuboardlist(page, sort);
		model.addAttribute("boardlist",boardlist);
		model.addAttribute("page",page);
	}
	
	//Q&A 게시판 정렬(최신순(기본), 인기순, 조회순)
	@Override
	public void getsortqnaboardlist(Model model, criteria cri, String sort) {
		int total = br.getqnacount();
		pageDTO page = new pageDTO(cri, total);
		List<boardDTO> boardlist = br.getsortqnaboardlist(page, sort);
		model.addAttribute("boardlist",boardlist);
		model.addAttribute("page",page);
	}
	
	 //자랑해요 게시글 상세 페이지 가져오기
	@Override
	public void getcommuboardview(Model model,  HttpServletRequest req) {
		int num =  (int)model.getAttribute("num");
		boardDTO board = br.getcommuboardview(num, req);
		br.commuviewhit(num);
		model.addAttribute("board",board);	
	}
	
	//Q&A 게시글 상세 페이지 가져오기
	@Override
	public void getqnaboardview(Model model, HttpServletRequest req) {
		int num =  (int)model.getAttribute("num");
		boardDTO board = br.getqnaboardview(num, req);
		br.qnaviewhit(num);
		model.addAttribute("board",board);
	}
	
	//자랑해요 게시글수정
	@Override
	public void updatecommuboard(boardDTO board, HttpServletRequest req) {
		boardDTO fileboard = br.getcommuboardview(board.getNum(), req);
		board.setFiles(fileboard.getFiles());
		br.updateboard(board, req);
	}
	
	//Q&A 게시글 수정
	@Override
	public void updateqnaboard(boardDTO board, HttpServletRequest req) {
		boardDTO fileboard = br.getqnaboardview(board.getNum(), req);
		board.setFiles(fileboard.getFiles());
		br.updateboard(board, req);
	}

	//게시글번호로 추천해요 게시글 가져오기
	@Override
	public boardDTO getcommuboardByNum(int num,  HttpServletRequest req) {
		boardDTO board = br.getcommuboardview(num, req);
		if(board.getBoard_type().equals("자랑해요")) {
			board.setBoard_type("commu");
		}
		if(board.getTagvalue().equals("고양이")) {
			board.setAnimal_type("cat");
		}
		if(board.getTagvalue().equals("강아지")) {
			board.setAnimal_type("dog");
		}
		return board;
	}
	
	//게시글번호로 Q&A 게시글 가져오기
	public boardDTO getqnaboardByNum(int num, HttpServletRequest req) {
		boardDTO board = br.getqnaboardview(num, req);
		if(board.getBoard_type().equals("Q&A")) {
			board.setBoard_type("qna");
		}
		if(board.getTagvalue().equals("고양이")) {
			board.setAnimal_type("cat");
		}
		if(board.getTagvalue().equals("강아지")) {
			board.setAnimal_type("dog");
		}
		return board;
	}

	//자랑해요 게시글 삭제
	@Override
	public void deletecommuboard(int num) {		
		br.deletecommuboard(num);		
	}
	
	//Q&A 게시글 삭제
	@Override
	public void deleteqnaboard(int num) {
		br.deleteqnaboard(num);
	}
	
	//전체 게시글 검색
	@Override
	public void search(Model model, String content, criteria cri) {
		int total = br.getallsearchcount(content);
		pageDTO page = new pageDTO(cri, total);
		List<boardDTO> boardlist = br.getallsearch(content, page);
		for(boardDTO board : boardlist) {
			System.out.println(board.toString());
		}
		model.addAttribute("search",content);
		model.addAttribute("boardlist",boardlist);
		model.addAttribute("page",page);
	}
	
	//자랑해요 게시글 검색
	@Override
	public void commusearch(Model model, String content, criteria cri) {
		int total = br.getcommusearchcount(content);
		pageDTO page = new pageDTO(cri, total);
		List<boardDTO> boardlist = br.getcommusearch(content, page);
		for(boardDTO board : boardlist) {
			System.out.println("서비스_자랑해요_검색보드: "+board.toString());
		}
		model.addAttribute("search",content);
		model.addAttribute("boardlist",boardlist);
		model.addAttribute("page",page);
	}
	
	//Q&A 게시글 검색
	@Override
	public void qnasearch(Model model, String content, criteria cri) {
		int total = br.getqnasearchcount(content);
		pageDTO page = new pageDTO(cri, total);
		List<boardDTO> boardlist = br.getqnasearch(content, page);
		model.addAttribute("search",content);
		model.addAttribute("boardlist",boardlist);
		model.addAttribute("page",page);
	}

	//추천해요 검색 기능
	@Override
	public void recomsearch(Model model, String content, criteria cri) {
		int total = br.getrecomcount();
		pageDTO page = new pageDTO(cri, total);
		List<boardDTO> boardlist = br.getrecomsearch(content, page);
		
		model.addAttribute("search",content);
		model.addAttribute("boardlist",boardlist);
		model.addAttribute("page",page);
	}
	
	//추천해요 게시글 가져오기
	@Override
	public void recomboard(Model model) {
		List<boardDTO> recomlist = br.getrecomboard();
		model.addAttribute("recomlist",recomlist);		
	}
	
	//자랑해요 추천 기능
	@Override
	public void commurecom(Model model, int pageNum, int num, String recom, HttpServletRequest req) {
		br.commurecom(num, recom);
		boardDTO board = br.getcommuboardview(num, req);
		model.addAttribute("num",num);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("board",board);
		
	}
	
	//Q&A 추천 기능
	@Override
	public void qnarecom(Model model, int pageNum, int num, String recom, HttpServletRequest req) {
		br.qnarecom(num, recom);
		boardDTO board = br.getqnaboardview(num, req);
		model.addAttribute("num",num);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("board",board);
		
	}

	//댓글 등록
	@Override
	public void writecomment(commentDTO comment) {
		br.writecomment(comment);
	}
	
	//게시글의 댓글목록 가져오기
	@Override
	public List<commentDTO> getcommentlist(commentDTO comment) {
		return br.getcommentlist(comment);
	}
	
	//댓글 삭제
	@Override
	public void deletecomment(commentDTO comment) {
		br.deletecomment(comment);
	}
	

	/*
	 * @Override //만들었으나 아직 활용을 안함 public JSONArray sortboard(Model model,
	 * HttpServletRequest req) { br.boardlist(model, req); List<boardDTO> boardlist
	 * = (List<boardDTO>) model.getAttribute("boardlist"); JSONArray jboardlist =
	 * new JSONArray(); for(boardDTO board : boardlist) { JSONObject jboard = new
	 * JSONObject(); jboard.put("num", board.getNum()); jboard.put("name",
	 * board.getName()); jboard.put("board_type", board.getBoard_type());
	 * jboard.put("animal_type", board.getAnimal_type()); jboard.put("title",
	 * board.getTitle()); jboard.put("content", board.getContent());
	 * jboard.put("regist_day", board.getRegist_day()); jboard.put("hit",
	 * board.getHit()); jboard.put("filename", board.getFilename());
	 * jboard.put("tag_src", board.getTag_src()); jboard.put("tag_value",
	 * board.getTag_value()); jboard.put("tag_calregist", board.getCalregist());
	 * jboard.put("tag_recom", board.getRecom()); jboardlist.put(jboard); } return
	 * jboardlist; }
	 */
	
	
	
}