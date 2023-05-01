package com.springmvc.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.domain.memberDTO;

public interface MemberService {
	//회원가입기능
	public void join(memberDTO dto, Model model);
	//로그인기능	
	public void chklogin(String email, String pw,HttpSession session,ModelAndView mav);
	//로그아웃기능
	public void logout(HttpSession session);
	//회원정보수정 기능
	public void updatemember(memberDTO member);
	//마이페이지에서 해당 회원이 맞는지 확인하는 기능
	public String chkuser(memberDTO member,Model model,  String chkpw);
	//세션에 저장된 닉네임과 일치하는 멤버객체반환하는 기능
	public void getmemberByname(memberDTO member, Model model);
	//전체 회원정보를 가져오는 기능
	public void getallmember(Model model);
	//num과 일치하는 회원정보 모델에 담는 기능
	public void getmemberBynum(int num, Model model);
	//이메일중복체크 기능
	public void chkemail(Model model);
	//닉네임중복체크 기능
	public void chkname(Model model);
	//회원 삭제 기능
	public void deletemember(int num);
	
	
}