package com.sting.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sting.dao.UserDao;
import com.sting.vo.UserVo;

import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;


@Controller
public class AuthController {
	
	@Autowired
	UserDao userDao;
	
	@RequestMapping("/loginProcess.do")
	public String loginProcess(Model model)
	{
		String userId = SecurityContextHolder.getContext().getAuthentication().getName();
		UserVo currentUser = userDao.getUserById(userId);
		model.addAttribute("currentUser", currentUser);
		return "home/main";
	}
	
	@RequestMapping("/logoutProcess.do")
	public String logoutProcess(HttpServletRequest req, HttpServletResponse res)
	{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(auth != null)
		{
			new SecurityContextLogoutHandler().logout(req, res, auth);
		}
		return "redirect:/";
	}

}

