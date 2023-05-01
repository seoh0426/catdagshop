package com.springmvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.domain.memberDTO;
import com.springmvc.domain.productDTO;
import com.springmvc.service.MemberService;
import com.springmvc.service.productService;

@Controller
@RequestMapping("/mypage")
public class mypagecontroller {
	
	@Autowired
	MemberService mr;
	
	@Autowired
	productService ps;

	@RequestMapping //마이페이지 이동
	public String mypage(@ModelAttribute("member")memberDTO member, Model model,HttpSession session) {
		member.setName((String) session.getAttribute("name"));
		mr.getmemberByname(member, model);
		return "mypagebarrier";
	}
	
	@PostMapping("/mypage")	//개인정보 수정
	public String updatemypge(@ModelAttribute("member")memberDTO member) {
		mr.updatemember(member);
		return "redirect:/mypage";
	}
	
	@GetMapping("/barrier") //마이페이지의 개인정보수정
	public String veri(@ModelAttribute("member")memberDTO member, Model model,HttpSession session) {
		member.setName((String) session.getAttribute("name"));
		mr.getmemberByname(member, model);
		return "mypagebarrier";
	}
	
	@PostMapping("/barrier")	//개인정보수정 전 한번 더 비밀번호를 입력받아 사용자가 맞는지 확인하는 기능
	public String chkuser(@ModelAttribute("member")memberDTO member, @RequestParam("chkpw") String chkpw, Model model,HttpSession session) {
		member.setName((String)session.getAttribute("name"));
		mr.getmemberByname(member, model);
		String page = mr.chkuser(member,model,chkpw);
		return page;
	}
	
	@GetMapping("/cart") //마이페이지의 장바구니 이동
	public String cart() {
		return"redirect:/cart/list";
	}
	
	@GetMapping("/chat") //마이페이지의 채팅 이동
	public String chat() {
		return "mypagechat";
	}
	
	@GetMapping("/chatting") //1:1 채팅 팝업창 띄우기
	public String chatpop() {
		return "chat";
	}
	
	@GetMapping("/order") //마이페이지의 주문목록 이동
	public String order() {
		return "mypageorder";
	}
	
	/* 관리자 기능 시작 */
	
	@GetMapping("/mgnmember")	//회원관리 페이지
	public String management(Model model) {
		mr.getallmember(model);		
		//관리자일 때만 올 수 있는 페이지
		//모든 회원의 정보를 볼 수 있고 특정 회원의 정보를 클릭하면 해당 회원의 정보를 수정하는 페이지로 이동하여 해당 회원의 정보를 수정할 수 있고
		//삭제도 가능
		//제일 중요한 기능은 회원의 등급을 변경시키는 일
		return "management";
	}
	
	@GetMapping("/mgnview/{num}")	//회원상세보기
	public String managementview(@ModelAttribute("member") memberDTO member, @PathVariable("num") int num, Model model) {
		mr.getmemberBynum(num, model);
		return "managementdetail2";
	}
	
	@PostMapping("/mgnview/{num}")	//회원정보수정
	public String updatemanagementview(@ModelAttribute("member") memberDTO member, @PathVariable("num") int num, Model model) {
		mr.updatemember(member);
		return "redirect:/mypage/mgnmember";
	}
	
	@GetMapping("/mgndelete/{num}")	//회원 삭제
	public String deletemanagement(@PathVariable("num")int num) {
		mr.deletemember(num);
		return "redirect:/mypage/mgnmember";
	}
	
	@GetMapping("/mgncommu")	//커뮤니티 관리
	public String managementcommu() {
		return "";
	}
	
	@GetMapping("/mgnnotice")	//공지사항 관리
	public String managementnotice() {
		return "";
	}
	
	@GetMapping("/mgnhos")	//우리동네병원 관리
	public String managementhos() {
		return "";
	}
	
	@GetMapping("/mgnshop")	//shop관리
	public ModelAndView managementshop(Model model) {
		ModelAndView mav = new ModelAndView();
		List<productDTO> productlist = ps.getAllProductList();
		System.out.println("shop관리 list: " + productlist);
		mav.addObject("productlist", productlist);
		mav.setViewName("managementshop");
		return mav;
	}
	
}