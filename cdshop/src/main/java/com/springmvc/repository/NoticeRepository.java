package com.springmvc.repository;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.springmvc.domain.boardDTO;
import com.springmvc.domain.criteria;
import com.springmvc.domain.pageDTO;

public interface NoticeRepository {

	//글쓰기 기능(공지사항, 이벤트)
	public void writeboard(boardDTO board,HttpServletRequest req);
	//공지사항 전체 게시글 가져오기
	public List<boardDTO> getnoticeboardlist(pageDTO page);
	//이벤트 전체 게시글 가져오기
	public List<boardDTO> geteventboardlist(pageDTO page);
	//공지사항 게시글 가져오기
	public boardDTO getnoticeboardview(int num, HttpServletRequest req);
	//이벤트 게시글 가져오기
	public boardDTO geteventboardview(int num, HttpServletRequest req);
	//공지사항, 이벤트 게시글 수정하기
	public void updateboard(boardDTO board, HttpServletRequest req);
	//공지사항 게시글 검색하기
	public List<boardDTO> getnoticesearch(String content, pageDTO page);
	//이벤트 게시글 검색하기
	public List<boardDTO> geteventsearch(String content, pageDTO page);
	//이벤트 게시글 추천하기
	public void eventrecom(int num, String recom);
	//공지사항 게시글 조회수 증가
	public void noticeviewhit(int num);
	//이벤트 게시글 조회수 증가
	public void eventviewhit(int num);
	//공지사항 게시글 삭제
	public void deletenoticeboard(int num);
	//이벤트 게시글 삭제
	public void deleteeventboard(int num);
	//공지사항 전체 게시글 개수
	public int getnoticecount();
	//이벤트 전체 게시글 개수
	public int geteventcount();
	//검색한 공지사항 게시글 개수
	public int getnoticesearchcount(String content);
	//검색한 이벤트 게시글 개수
	public int geteventsearchcount(String content);
}