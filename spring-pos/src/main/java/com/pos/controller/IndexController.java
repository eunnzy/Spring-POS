package com.pos.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pos.dto.User;
import com.pos.service.UserService;

@Controller
public class IndexController {
	@Autowired
	UserService userService;
	
	@GetMapping("/")
	public String index(Model model) {
		return "index";
	}
	
	@RequestMapping(value="/loginAction" , method = RequestMethod.POST)  // 회원가입 페이지
	public String login(Model model, HttpServletRequest request, HttpServletResponse response, RedirectAttributes ra) {
		HttpSession session = request.getSession();
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		
		User check = userService.login(userId, userPw);
		
		if(check == null) {   // 아이디 비밀번호 일치하지 않을 때
			int result = 0;
			ra.addFlashAttribute("result", result);
			return "redirect: /";
		}
		
		session.setAttribute("user", check);  // 일치하면
		System.out.println("로그인 성공 " + check);
		
		return "/loginAction";
	}
}
