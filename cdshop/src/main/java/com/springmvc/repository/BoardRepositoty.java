package com.springmvc.repository;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import com.springmvc.domain.boardDTO;
import com.springmvc.domain.commentDTO;
import com.springmvc.domain.pageDTO;

public interface BoardRepositoty {
	
	//글쓰기 기능
	public void writeboard(boardDTO board,HttpServletRequest req);
	//전체 게시글 가져오기 기능
	public List<boardDTO> getallboardlist(pageDTO page);
	//자랑해요게시글 가져오기 기능
	public List<boardDTO> getcommuboardlist(pageDTO page);
	//Q&A게시글 가져오기 기능
	public List<boardDTO> getqnaboardlist(pageDTO page);
	//추천해요 게시글 가져오기 기능
	public List<boardDTO> getrecomboardlist(pageDTO page);
	//자랑해요 게시글 정렬 기능
	public List<boardDTO> getsortcommuboardlist(pageDTO page, String sort);
	//Q&A 게시글 정렬 기능
	public List<boardDTO> getsortqnaboardlist(pageDTO page, String sort);
	//자랑해요 게시글 상세페이지 가져오기 기능
	public boardDTO getcommuboardview(int num, HttpServletRequest req);
	//Q&A 게시글 상세페이지 가져오기 기능
	public boardDTO getqnaboardview(int num, HttpServletRequest req);
	//자랑해요 게시글 조회수 증가 기능
	public void commuviewhit(int num);
	//Q&A 게시글 조회수 증가
	public void qnaviewhit(int num);
	//자랑해요 게시글 삭제
	public void deletecommuboard(int num);
	//Q&A 게시글 삭제 
	public void deleteqnaboard(int num);
	//게시글 수정
	public void updateboard(boardDTO board, HttpServletRequest req);
	//전체게시글 검색
	public List<boardDTO> getallsearch(String content, pageDTO page);
	//자랑해요 게시글 검색
	public List<boardDTO> getcommusearch(String content, pageDTO page);
	//Q&A 게시글 검색
	public List<boardDTO> getqnasearch(String content, pageDTO page);
	//추천해요 게시글 검색
	public List<boardDTO> getrecomsearch(String content, pageDTO page);
	//자랑해요 게시글 추천
	public void commurecom(int num, String recom);
	//Q&A 게시글 추천
	public void qnarecom(int num, String recom);
	//인기글(추천수 10개이상) 3개 가져오기
	public List<boardDTO> getrecomboard();
	//전체 게시글 개수
	public int getallcount();
	//자랑해요 게시글 개수
	public int getcommucount();
	//Q&A 게시글 개수
	public int getqnacount();
	//추천해요 게시글 개수
	public int getrecomcount();
	//검색한 전체 게시글 개수
	public int getallsearchcount(String content);
	//검색한 자랑해요 게시글 개수
	public int getcommusearchcount(String content);
	//검색한 Q&A 게시글 개수
	public int getqnasearchcount(String content);
	//댓글 등록
	public void writecomment(commentDTO comment);
	//게시글의 댓글목록 가져오기
	public List<commentDTO> getcommentlist(commentDTO comment);
	//댓글 삭제
	public void deletecomment(commentDTO comment);
}