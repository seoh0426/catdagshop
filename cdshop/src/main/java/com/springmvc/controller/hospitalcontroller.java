package com.springmvc.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hospital")
public class hospitalcontroller {

	@RequestMapping
	public String hospital() {
		return "hospitalmap";
	}
	
	@GetMapping("/reviews")
	public String hospitalreviews(HttpSession session, HttpServletResponse res) throws IOException {
		if(session.getAttribute("name") == null) {
			res.sendRedirect("/login");
		}
		return "hospitalreviews";
	}
	
	@GetMapping("/reviews/view")
	public String hospitalview() {
		return "hospitalview";
	}
}
