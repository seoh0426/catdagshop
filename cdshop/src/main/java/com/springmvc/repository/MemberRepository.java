package com.springmvc.repository;


import java.util.List;

import com.springmvc.domain.memberDTO;

public interface MemberRepository {
	//회원가입기능
	public void join(memberDTO dto);
	//DB에서 전체회원가져와서 List에 담아놓음
	public void getmemberlist();
	//로그인기능
	public memberDTO chkmember(String email, String pw);
	//회원정보수정기능
	public void updatemember(memberDTO member);
	//세션에 저장된 닉네임과 일치하는 멤버객체반환하는 기능
	public memberDTO getmemberByname(String name);
	//전체 회원목록을 반환하는 기능
	public List<memberDTO> getallmemberlist();
	//num과 일치하는 회원정보 반환하는 기능
	public memberDTO getmemberBynum(int num);
	//회원가입시 이메일 중복체크 기능
	public int chkemail(String email);
	//회원가입시 닉네임 중복체크 기능
	public int chkname(String name);
	//회원 삭제
	public void deletemember(int num);
}