package com.pos.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pos.dao.UserDao;
import com.pos.dto.User;
import com.pos.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	 
	@GetMapping("/register")  // 회원가입 페이지 
	public String register() {
		return "/register";
	}
	
	@GetMapping("/changePassword")
	public String changePw() {
		return "changePassword";
	}
	
	// 아이디 중복 확인.
	@RequestMapping(value = "/register/idCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String idCheck(String userId) {
		int result = userService.idCheck(userId);
		if(result != 0) {
			return "아이디가 이미 존재합니다.";
		}else {
			return "사용 가능한 아이디입니다.";
		}
	}
	
	// 비밀번호 변경.
	@RequestMapping(value = "/changePw.do", method = RequestMethod.POST)
	@ResponseBody
	public int changePwPost(@RequestParam(value="userId")String userId,@RequestParam(value="newPw")String newPw) {
		int result = userService.changePw(userId, newPw);
		return result;
	}
	
	// 비밀번호 변경 후 로그아웃 -> 변경 비밀번호로 다시 로그인.
	@RequestMapping(value = "/changeComplete.do", method = RequestMethod.POST)
	public String changeComplete(HttpServletRequest request)throws Exception {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect: /"; //다시 로그인
	}


	 // 회원가입 완료시 메인 화면으로 이동.
	@RequestMapping(value = "/register/complete.do", method = RequestMethod.POST)
	public String registerAction(@ModelAttribute User user) {
		System.out.print(user.toString());
		userService.register(user);
	
		return "redirect: /";
	}
	
	// 로그아웃
	@RequestMapping(value="/logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}
	
	
	
}
