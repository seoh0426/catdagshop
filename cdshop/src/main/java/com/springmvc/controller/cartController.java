package com.springmvc.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.domain.cartDTO;
import com.springmvc.domain.productDTO;
import com.springmvc.service.cartService;
import com.springmvc.service.productService;

@Controller
@RequestMapping(value="/cart")
public class cartController {
   @Autowired
   private cartService cs;
   
   // session에서 name 값 가져와서 add로 넘김
   @RequestMapping
   public String requestCart(@ModelAttribute cartDTO cart, HttpSession session) {
      System.out.println("cartcontroller-requestCart 들어왔니?");
      String name = (String) session.getAttribute("name");
      System.out.println("cartcontroller-name 값 가져오니? :" + name);
      cart.setName(name);
      return "redirect:/cart/add";
   }
   
   // 장바구니 상품 추가 : 상세페이지에서 수량, 상품아이디 가져와서 서비스로 넘기기
   @GetMapping("/add")
   public String NewCart(@RequestParam("productId") String productId,@RequestParam("qnt") int quantity, HttpSession session) {
      String name = (String) session.getAttribute("name");
      System.out.println("수량:" +quantity);
      cs.setNewCart(productId, name, quantity);
      return "redirect:/cart/list";
   }
   
   // 장바구니 목록 : 멤버 이름 같은거 찾아서 가져와 모델에 담아서 뷰페이지 보냄
   @RequestMapping("/list")
   public ModelAndView cartlist(HttpSession session, Model model) {
      String name = (String) session.getAttribute("name");
      ModelAndView mav = new ModelAndView();
      List<cartDTO> list = cs.getAllCartList(name);
      System.out.println(list);
      mav.addObject("cartlist", list);
      mav.setViewName("mypagecart");
      return mav;
      
   }
   
   // 장바구니에서 수량 변경 : 상품 이름이랑 변경할 수량 가지고 db가서 set
   @PostMapping("/update")
   public String submitupdateQntForm(cartDTO cart, @RequestParam("pname") String Productname, @RequestParam("quantity") int quantity, HttpSession session) {
	   System.out.println("cartcontroller-update들어왔니?");
	   System.out.println("cartcontroller-update-productname : " + Productname );
	   System.out.println("조형민바보 : " + quantity);
	   cs.setUpdateQnt(Productname, quantity);
	   return "redirect:/cart/list";
   }
   
   // 상품 개별 삭제 : db에 같은 이름 찾아서 지움
   @RequestMapping(value="/delete")
   public String getDeleteCartForm(Model model, @RequestParam("name") String productname) {
	   cs.setDeleteCart(productname);
	   return "redirect:/cart/list";
   }
   
   // 상품 전체 삭제
   @RequestMapping(value="/alldelete")
   public String getAllDeleteCartForm(Model model, @RequestParam("name") String name) {
	   cs.setAllDeleteCart(name);
	   return "redirect:/cart/list";
   }
   
//   
//   @PostMapping
//   public @ResponseBody cart create(@RequestBody cart Cart) {
//      // 웹 요청 uri가 /cart고 http메서드가 post방식이면 매핑 (사용자 요청 처리)
//      System.out.println("cartcontroller - post 얘는 언제들어오니?");
//      return cartservice.create(Cart);
//      //cart 클래스 정보를 http요청 body로 전달받아 장바구니를 새로 생성하고 http 응답 body로 전달
//   }
//   
//   @GetMapping("/{cartId}")
//   public String requestCartList(@PathVariable(value="cartId") String cartId, Model model) {
//      // 웹 요청 uri가 /cart/cartid고 http 메서드가 get방식이면 매핑
//      cart Cart = cartservice.read(cartId);
//      // 요청 uri에서 경로변수 cartid에 대해 장바구니에 등록된 모든 정보 읽어옴 
//      model.addAttribute("Cart", Cart);
//      // 읽어온거 커맨드 객체 cart 속성에 등록
//      return "mypagecart";
//      //mypagecart.jsp 뷰 페이지 반환
//   }
//   
//   @PutMapping("/{cartId}")
//   public @ResponseBody cart read(@PathVariable(value="cartId")String cartId) {
//      // 웹 요청 uri가 cart/cartid고 http 메서드가 put방식이면 매핑
//      return cartservice.read(cartId);
//      // 요청 url에서 경로변수인 장바구니id에 대해 당바구니에 등록된 모든 정보 가져옴
//   }
//   
//   @PutMapping("/add/{cartId}")
//   @ResponseStatus(value=HttpStatus.NO_CONTENT)
//   //오류 응답 상태 코드 설정
//   public void addCartByNewItem(@PathVariable String productId, HttpServletRequest request) {
//      // 장바구니 id인 세션id 가져오기
//      String sessionId = request.getSession(true).getId();
//      cart Cart = cartservice.read(sessionId);
//      //장바구니에 등록된 모든 정보 얻어오기
//      if (Cart == null)
//      Cart = cartservice.create(new cart(sessionId));
//      // 경로변수 productId에 대한 정보 얻어옴
//      productDTO product = productservice.getProductById(productId);
//      if (product == null)
//      throw new IllegalArgumentException(new productIdException(productId));
//      // productId에 대한 상품 정보를 장바구니에 등록하기
//      Cart.addcartitem(new cartitem(product));
//      cartservice.update(sessionId, Cart);
//      //세션 id에 대한 장바구니 갱신하기
//   }
//   
//   @DeleteMapping("/{cartId}")
//   @ResponseStatus(value=HttpStatus.NO_CONTENT)
//   public void deleteCartList(@PathVariable(value="cartId") String cartId) {
//      cartservice.delete(cartId);
//      // uri가 /cart/cartId이고ㅓ http 메서드가 delete 방식일때 매핑되는 요청 처리 메서드
//      // 요청 url에서 경로변수인 장바구니 id에 대해 장바구니에 등록된 모든 정보 삭제
//   }
//   
//   
}