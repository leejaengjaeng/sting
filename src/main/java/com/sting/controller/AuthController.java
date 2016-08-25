package com.sting.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
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
		
		System.out.println(userId); 
		
		UserVo currentUser = userDao.getUserById(userId);

		System.out.println(currentUser); 

		model.addAttribute("currentUser", currentUser);
		
		//沅뚰븳�� �븯�굹�뵫留� 媛�吏꾨떎怨� 媛��젙
//		String auth = authorities.get(0).toString();

	//	model.addAttribute("auth", auth);
	//	System.out.println(auth);
		
/*
		
		if(auth == "ROLE_ADMIN")
		{
			//萸붽� �뀑 �븯湲�
		}
		else if(auth == "ROLE_STAR")
		{
			
		}
		else if(auth == "ROLE_SNSSTAR")
		{
			
		}
		else if(auth == "ROLE_MANAGEMENT")
		{
			
		}
		else if(auth == "ROLE_COMPANY")
		{
			
		}
		else
		{
			//�떦�떊�� �늻援ъ떗�땲源�~
		}
*/		
		return "home/main";
	}
}

