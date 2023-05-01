package com.springmvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.domain.memberDTO;
import com.springmvc.service.MemberService;

@Controller
@RequestMapping("/login")
public class logincontoller {
	@Autowired
	private MemberService mr;
	
	@RequestMapping //로그인 메인페이지
	public String login(@ModelAttribute("member") memberDTO member){
		return "login";
	}
	
	@GetMapping("/pwsearch") //비밀번호 찾기, 아직 구현안됨 이메일로 해쉬코드를 발급해야되는 부분이라 나중에 공부하고 구현하기
	public String pwsearch() {
		return "pw_search";
	}
	
	@PostMapping("/loginchk")	//로그인기능
	public ModelAndView loginchk(@ModelAttribute("member")memberDTO member,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mr.chklogin(member.getEmail(), member.getPw(), session,mav);		
		return mav;
	}
	
	@GetMapping("/logout")	//로그아웃 기능
	public String logout(HttpSession session) {
		mr.logout(session);
		return "redirect:/home";
	}
	
	@GetMapping("/signup") //회원가입 페이지
	public String signupForm(@ModelAttribute("member")memberDTO member) {
		return "signup";
	}
	
	@PostMapping("/signup") //회원가입 기능
	public String submitsignup(@ModelAttribute("member") memberDTO member, Model model) throws Exception {
		mr.join(member, model);
		return "login";
	}	

	
	@GetMapping("/chkemail") //이메일 중복체크
	public String chkemail(HttpServletRequest req, Model model) {
		model.addAttribute("email",req.getParameter("email"));
		return "check_email";
	}
	
	@PostMapping("/chkemail") //이메일 중복체크하고 와서 값 넘겨주기
	public String chkemail2(HttpServletRequest req, Model model) {
		model.addAttribute("email", req.getParameter("email"));
		mr.chkemail(model);
		return "check_email";
	}
	
	@GetMapping("/chkname") //닉네임 중복체크
	public String chkname(HttpServletRequest req, Model model) {
		model.addAttribute("name",req.getParameter("name"));
		return "check_name";
	}
	
	@PostMapping("/chkname") //닉네임 중복체크하고 와서 값 넘겨주기
	public String chkname2(HttpServletRequest req, Model model) {
		model.addAttribute("name",req.getParameter("name"));
		mr.chkname(model);
		return "check_name";
	}
	
	
	
	
}