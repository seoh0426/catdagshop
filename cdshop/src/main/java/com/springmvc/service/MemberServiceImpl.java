package com.springmvc.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.domain.memberDTO;
import com.springmvc.repository.MemberRepository;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberRepository mr;
	
	@Override //회원가입 기능
	public void join(memberDTO member, Model model) {
		mr.join(member);
		model.addAttribute("msg",2);
		
	}
	
	@Override	//로그인 기능
	public void chklogin(String email, String pw,HttpSession session,ModelAndView mav) {
		memberDTO member = mr.chkmember(email, pw);
		if(member.getName() != null) {
			session.setAttribute("name", member.getName());
			session.setAttribute("level", member.getLevel());
			mav.addObject("msg",1);
			mav.setViewName("index");
		}
		else {
			mav.addObject("msg", -1);
			mav.setViewName("login");
		}		
	}

	@Override	//로그아웃 기능
	public void logout(HttpSession session) {
		session.invalidate();
	}

	@Override	//회원정보수정
	public void updatemember(memberDTO member) {
		mr.updatemember(member);		
	}
	@Override	//마이페이지에서 해당 회원이 맞는지 한번 더 확인하는 작업
	public String chkuser(memberDTO member,Model model, String chkpw) {		
		if(!member.getPw().equals(chkpw)) {
			model.addAttribute("msg",-1);
			return "mypagebarrier";
		}
		return "mypage";
	}
	
	@Override	//세션에 저장된 닉네임과 일치하는 멤버객체반환하는 기능
	public void getmemberByname(memberDTO member, Model model) {
		String name = member.getName();
		member = mr.getmemberByname(name);
		model.addAttribute("member",member);
	}

	@Override	//전체 회원정보를 가져와서 모델에 담는 기능
	public void getallmember(Model model) {
		List<memberDTO> memberlist = mr.getallmemberlist();
		model.addAttribute("memberlist",memberlist);		
	}
	
	@Override	//num과 일치하는 회원정보 모델에 담는 기능
	public void getmemberBynum(int num, Model model) {
		memberDTO member = mr.getmemberBynum(num);
		model.addAttribute("member",member);		
		
	}
	
	@Override	//회원가입 시 이메일 중복체크 기능
	public void chkemail(Model model) {
		String email = (String) model.getAttribute("email");
		int msg = mr.chkemail(email);
		model.addAttribute("msg",msg);
	}
	
	@Override	//회원가입 시 닉네임 중복체크 기능
	public void chkname(Model model) {
		String name = (String) model.getAttribute("name");
		int msg = mr.chkname(name);
		model.addAttribute("msg",msg);
	}
	
	@Override 	//회원 삭제 기능
	public void deletemember(int num) {
		mr.deletemember(num);
	}
	
}