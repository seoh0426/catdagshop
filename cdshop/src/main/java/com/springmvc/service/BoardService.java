package com.springmvc.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.springmvc.domain.boardDTO;
import com.springmvc.domain.commentDTO;
import com.springmvc.domain.criteria;

public interface BoardService {	
	//글쓰기 기능
	public void writeboard(boardDTO board,HttpServletRequest req);
	//전체 게시글 가져오기 기능
	public void getallboardlist(Model model,criteria cri);
	//자랑해요 전체 게시글 가져오기 기능
	public void getcommuboardlist(Model model, criteria cri);
	//Q&A 전체 게시글 가져오기 기능
	public void getqnaboardlist(Model model, criteria cri);
	//자랑해요 게시판 정렬 기능
	public void getsortcommuboardlist(Model model, criteria cri, String sort);
	//Q&A 게시판 정렬 기능
	public void getsortqnaboardlist(Model model, criteria cri, String sort);
	//자랑해요 게시글 가져오기
	public void getcommuboardview(Model model,  HttpServletRequest req);
	//Q&A 게시글 가져오기
	public void getqnaboardview(Model model, HttpServletRequest req);
	//추천해요 게시글 가져오기
	public void getarecomboardlist(Model model,criteria cri);
	//자랑해요 게시글 수정하기
	public void updatecommuboard(boardDTO board, HttpServletRequest req);
	//Q&A 게시글 수정하기
	public void updateqnaboard(boardDTO board, HttpServletRequest req);
	//게시글 번호로 해당 추천해요 게시글 가져오기
	public boardDTO getcommuboardByNum(int num,  HttpServletRequest req);
	//게시글 번호로 해당 Q&A 게시글 가져오기
	public boardDTO getqnaboardByNum(int num, HttpServletRequest req);
	//자랑해요 게시글 삭제 기능
	public void deletecommuboard(int num);
	//Q&A 게시글 삭제 기능
	public void deleteqnaboard(int num);
	//전체 게시글 검색하기 기능
	public void search(Model model, String content, criteria cri);
	//자랑해요 게시글 검색하기 기능
	public void commusearch(Model model, String content, criteria cri);
	//Q&A 게시글 검색하기 기능
	public void qnasearch(Model model, String content, criteria cri);
	//추천해요 게시글 검색하기 기능
	public void recomsearch(Model model, String content, criteria cri);
	//자랑해요 추천 기능
	public void commurecom(Model model, int pageNum, int num, String recom, HttpServletRequest req);
	//Q&A 추천 기능
	public void qnarecom(Model model, int pageNum, int num, String recom, HttpServletRequest req);
	//인기글 가져오기
	public void recomboard(Model model);
	//댓글 등록
	public void writecomment(commentDTO comment);
	//게시글의 댓글 가져오기
	public List<commentDTO> getcommentlist(commentDTO comment);
	//댓글 삭제
	public void deletecomment(commentDTO comment);
	
	
	/* public JSONArray sortboard(Model model,HttpServletRequest req); */
	
	
}