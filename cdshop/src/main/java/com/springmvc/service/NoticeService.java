package com.springmvc.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.springmvc.domain.boardDTO;
import com.springmvc.domain.criteria;

public interface NoticeService {
	//글쓰기 기능
	public void writeboard(boardDTO board,HttpServletRequest req);
	//공지사항 전체 게시글 가져오기
	public void getnoticeboardlist(Model model, criteria cri);
	//이벤트 전체 게시글 가져오기
	public void geteventboardlist(Model model, criteria cri);
	//공지사항 게시글 가져오기
	public void getnoticeboardview(Model model, HttpServletRequest req);
	//이벤트 게시글 가져오기
	public void geteventboardview(Model model, HttpServletRequest req);
	//공지사항 게시글 수정하기
	public void updatenoticeboard(boardDTO board, HttpServletRequest req);
	//이벤트 게시글 수정하기
	public void updateeventboard(boardDTO board, HttpServletRequest req);
	//공지사항 게시글 번호로 해당 게시판의 게시글 가져오기
	public boardDTO getnoticeboardByNum(int num, HttpServletRequest req);
	//이벤트 게시글 번호로 해당 게시판의 게시글 가져오기
	public boardDTO geteventboardByNum(int num, HttpServletRequest req);
	//공지사항 게시글 검색하기
	public void noticesearch(Model model, String content, criteria cri);
	//이벤트 게시글 검색하기
	public void eventsearch(Model model, String content, criteria cri);
	//공지사항 게시글 삭제
	public void deletenoticeboard(int num);
	//이벤트 게시글 삭제
	public void deleteeventboard(int num);
	//이벤트 게시글 추천하기
	public void eventrecom(Model model, int pageNum, int num, String recom, HttpServletRequest req);

}