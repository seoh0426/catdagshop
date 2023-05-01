package com.springmvc.controller;

import java.io.File;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.domain.productDTO;
import com.springmvc.exception.CategoryException;
import com.springmvc.exception.productIdException;
import com.springmvc.service.productService;

@Controller
@RequestMapping("/shopmain")
public class productcontroller {
	@Autowired
	productService ps;
		
	//카테고리안 페이지 눌렀을때 화면
	@GetMapping("/all")
	public ModelAndView productlist(Model model) {
		ModelAndView modelandview = new ModelAndView();
		List<productDTO> list = ps.getAllProductList();
		for(productDTO dto : list) {
			System.out.println(dto.getProductId());
		}
		modelandview.addObject("productlist", list);
		modelandview.setViewName("shopslide");
		return modelandview;
	}
	
	//상품상세 페이지 이동
	@GetMapping("/productview")
	public String productview(@RequestParam("id") String productId, Model model) {
		System.out.println("너 productview 들어옴?");
		productDTO productById = ps.getProductById(productId);
		System.out.println(productById);
		System.out.println(productById.getTitlement());
		model.addAttribute("product", productById);
		return "productpage";
	}
	
	//상품추가페이지
	@GetMapping("/add") 
	public String requestAddproductForm(@ModelAttribute("NewProduct") productDTO product) {
		return "productadd";
	}
	
	//상품추가등록
	@PostMapping("/add") 
	public String submitAddNewProduct(@Valid @ModelAttribute("NewProduct") productDTO product, BindingResult result) {
		System.out.println("path상품 추가 들어왔니?");
		if(result.hasErrors()) {
			System.out.println("add if문");
			return "productadd";
		}
		
		MultipartFile detailimage = product.getDetailimage();
		System.out.println("detailimage 넣었니" + detailimage);
		String saveName = detailimage.getOriginalFilename();
		System.out.println("originalname 넣었니" + saveName);
		File saveFile = new File("D:/KSH/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/cdshop/resources/img", saveName);
		System.out.println("파일 업로드에 들어갔니" + saveFile);
		if (detailimage != null && !detailimage.isEmpty()) {
			System.out.println("예외처리 if문");
			try {
				detailimage.transferTo(saveFile);
				product.setDfilename(saveName);
			}catch (Exception e) {
				throw new RuntimeException("상품 이미지 업도르가 실패하였습니다.", e);
			}
		}
		MultipartFile titleimage = product.getTitleimage();
		System.out.println("detailimage 넣었니" + titleimage);
		String saveName1 = titleimage.getOriginalFilename();
		System.out.println("originalname 넣었니" + saveName1);
		File saveFile1 = new File("D:/KSH/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/cdshop/resources/img", saveName1);
		System.out.println("파일 업로드에 들어갔니" + saveFile1);
		if (titleimage != null && !titleimage.isEmpty()) {
			System.out.println("예외처리 if문");
			try {
				titleimage.transferTo(saveFile1);
				product.setTfilename(saveName1);
			}catch (Exception e) {
				throw new RuntimeException("상품 이미지 업도르가 실패하였습니다.", e);
			}
		}
		
		ps.setNewProduct(product);
		System.out.println("product" + product);
		return "redirect:/shopmain/all"; // 전체 상품페이지말고 등록한 상품의 페이지 띄우도록 바꾸기
	}
	
	// 상품수정페이지
	@GetMapping("/update") 
	public String getUpdateProductForm(@ModelAttribute("updateProduct") productDTO product, @RequestParam("id") String productId, Model model) {
		productDTO  productById = ps.getProductById(productId);
		model.addAttribute("product", productById);
		return "updateproductpage";
		
	}
	
	//상품수정등록
	@PostMapping("/update") 
	public String submitUpdateProductForm(@ModelAttribute("updateProduct") productDTO product) {
		MultipartFile dfileimage = product.getDetailimage();
		System.out.println("updatecontroller-d 파일이미지 가지고 오니? :" + dfileimage);
		String rootDirectory = "C:/KSH/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/cdshop/resources/img";
		System.out.println("updatecontroller-d 파일 이미지 들어가니? :" + rootDirectory);
		if (dfileimage != null && !dfileimage.isEmpty()) {
			System.out.println("updatecontroller-if문 들어가니? :");
			try {
				String dfnam = dfileimage.getOriginalFilename();
				System.out.println("updatecontroller-dfnam 이름 들어가니? :" + dfnam);
				dfileimage.transferTo(new File("C:/KSH/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/cdshop/resources/img" + dfnam));
				product.setDfilename(dfnam);
			}catch (Exception e) {
				throw new RuntimeException("Product Image saving failed", e);
			}
		}
		
		MultipartFile tfileimage = product.getTitleimage();
		System.out.println("updatecontroller-t 파일이미지 가지고 오니? :" + tfileimage);
		String rootDirectory1 = "C:/KSH/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/cdshop/resources/img";
		System.out.println("updatecontroller-t 파일 이미지 들어가니? :" + rootDirectory1);
		if (tfileimage != null && !tfileimage.isEmpty()) {
			System.out.println("updatecontroller-if문 들어가니? :");
			try {
				String tfnam = tfileimage.getOriginalFilename();
				System.out.println("updatecontroller-dfnam 이름 들어가니? :" + tfnam);
				tfileimage.transferTo(new File("C:/KSH/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/cdshop/resources/img" + tfnam));
				product.setTfilename(tfnam);
			}catch (Exception e) {
				throw new RuntimeException("Product Image saving failed", e);
			}
		}
		ps.setUpdateProduct(product);
		System.out.println("updateproduct" + product);
		product.getProductId();
		
		return "redirect:/shopmain/productview?id=" + product.getProductId(); 
		
	}
	
	//상품삭제
	@RequestMapping(value="/delete")
	public String getDeleteProductForm(Model model, @RequestParam("id") String productId) {
		ps.setDeleteProduct(productId);
		return "redirect:/shopmain/all";
	}
	
	// shop 관리 상품 삭제
	@GetMapping("/mgndelete")
	public String getMgnDelete(Model model, @RequestParam("id") String productId) {
		ps.setDeleteProduct(productId);
		return "redirect:/mypage/mgnshop";
	}
	
	//카테고리별 매핑 한거(전체list 페이지마다 가져와서 c:if로 해당카테고리만 추출해서 씀
	//강아지사료 페이지
	@GetMapping("/dogfood")
	public ModelAndView p_dogfood(Model model) {
		ModelAndView modelandview = new ModelAndView();
		List<productDTO> list = ps.getAllProductList();
		for(productDTO dto : list) {
			System.out.println(dto.getProductId());
		}
		modelandview.addObject("productlist", list);
		modelandview.setViewName("p_dogfood");
		return modelandview;
	}
	//강아지 간식 페이지
	@GetMapping("/dogsnack")
	public ModelAndView p_dogsnack(Model model) {
		ModelAndView modelandview = new ModelAndView();
		List<productDTO> list = ps.getAllProductList();
		for(productDTO dto : list) {
			System.out.println(dto.getProductId());
		}
		modelandview.addObject("productlist", list);
		modelandview.setViewName("p_dogsnack");
		return modelandview;
	}
	
	//강아지용품 페이지
	@GetMapping("/dogsup")
	public ModelAndView p_dogsup(Model model) {
		ModelAndView modelandview = new ModelAndView();
		List<productDTO> list = ps.getAllProductList();
		for(productDTO dto : list) {
			System.out.println(dto.getProductId());
		}
		modelandview.addObject("productlist", list);
		modelandview.setViewName("p_dogsup");
		return modelandview;
	}
	
	//강아지 장난감 페이지
	@GetMapping("/dogtoy")
	public ModelAndView p_dogtoy(Model model) {
		ModelAndView modelandview = new ModelAndView();
		List<productDTO> list = ps.getAllProductList();
		for(productDTO dto : list) {
			System.out.println(dto.getProductId());
		}
		modelandview.addObject("productlist", list);
		modelandview.setViewName("p_dogtoy");
		return modelandview;
	}
	
	//고양이 사료 페이지
	@GetMapping("/catfood")
	public ModelAndView p_catfood(Model model) {
		ModelAndView modelandview = new ModelAndView();
		List<productDTO> list = ps.getAllProductList();
		for(productDTO dto : list) {
			System.out.println(dto.getProductId());
		}
		modelandview.addObject("productlist", list);
		modelandview.setViewName("p_catfood");
		return modelandview;
	}
	
	//고양이 간식 페이지
	@GetMapping("/catsnack")
	public ModelAndView p_catsnack(Model model) {
		ModelAndView modelandview = new ModelAndView();
		List<productDTO> list = ps.getAllProductList();
		for(productDTO dto : list) {
			System.out.println(dto.getProductId());
		}
		modelandview.addObject("productlist", list);
		modelandview.setViewName("p_catsnack");
		return modelandview;
	}
	
	//고양이 용품 페이지
	@GetMapping("/catsup")
	public ModelAndView p_catsup(Model model) {
		ModelAndView modelandview = new ModelAndView();
		List<productDTO> list = ps.getAllProductList();
		for(productDTO dto : list) {
			System.out.println(dto.getProductId());
		}
		modelandview.addObject("productlist", list);
		modelandview.setViewName("p_catsup");
		return modelandview;
	}
	
	//고양이 장난감 페이지
	@GetMapping("/cattoy")
	public ModelAndView p_cattoy(Model model) {
		ModelAndView modelandview = new ModelAndView();
		List<productDTO> list = ps.getAllProductList();
		for(productDTO dto : list) {
			System.out.println(dto.getProductId());
		}
		modelandview.addObject("productlist", list);
		modelandview.setViewName("p_cattoy");
		return modelandview;
	}
	
}