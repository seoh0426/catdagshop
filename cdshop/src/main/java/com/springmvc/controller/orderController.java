package com.springmvc.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.domain.memberDTO;
import com.springmvc.domain.orderDTO;
import com.springmvc.service.orderService;

@Controller
@RequestMapping(value="/order")
public class orderController {
   @Autowired
   private orderService os;
   
   @RequestMapping
   public String requestOrder(@ModelAttribute orderDTO order, HttpSession session) {
      System.out.println("ordercontroller 들어왔늬");
      String name = (String) session.getAttribute("name");
      System.out.println("ordercontroller session name : " + name);
      order.setName(name);
      return "redirect:/order/add";
   }
   
   // 장바구니에서 주문하기누르면 주문목록으로 상품추가
   @GetMapping("/add")
   public String NewOrder(@RequestParam("list") ArrayList<String> list, @RequestParam("totalPrice") int totalPrice, orderDTO order, HttpSession session, memberDTO member) {
      String name = (String) session.getAttribute("name");
      // b_date에 들어갈 주문날짜시간 포맷팅
      Date date = new Date();
      SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      String today = f.format(date);
      order.setOrderdate(today);
      // 주문번호 만들기
      int num = member.getNum(); //멤버 num
      long curTime = System.currentTimeMillis(); //currenttime 써서 ms시간 가져오기
      String onum = "s"+curTime+"_"+"m"+ num;
      order.setOnum(onum);
      System.out.println(onum);
      // cart에서 가져온 list 값 setNewOrder에 넘기기 
      for(int i = 0; i < list.size(); i++)
      {
    	  String productname = list.get(i);
    	  System.out.println(productname + " ==== 이거 들고 db갔다 올게");
    	  os.setNewOrder(productname, name, totalPrice, order, onum);
      }
      System.out.println("ordercontroller session name : " + name);
      System.out.println("ordercontroller add totalPrice : " + totalPrice);
      return "redirect:/order/list";
   }
   
   //주문목록 띄우기
   @RequestMapping("/list")
   public ModelAndView orderlist(HttpSession session, Model model) {
	  System.out.println("ordercontroller list 들어왔늬");
      String name = (String) session.getAttribute("name");
      ModelAndView mav = new ModelAndView();
      List<orderDTO> list = os.getAllOrderList(name);
      mav.addObject("orderlist", list);
      mav.setViewName("mypageorder");
      return mav;
   }
   
   //주문목록 상세보기
   @RequestMapping("/orderprolist")
   public ModelAndView orderprolist (HttpSession session, Model model, @RequestParam("onum") String onum) {
	   System.out.println("ordercontroller orderprolist 들어왔늬");
	   System.out.println("onum : " + onum);
	   ModelAndView mav = new ModelAndView();
	   List<orderDTO> orderlist = os.getOrderprolist(onum);
	   mav.addObject("orderprolist", orderlist);
	   mav.setViewName("orderlistview");
	   return mav;
   }
   
}
