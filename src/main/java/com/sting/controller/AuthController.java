package com.sting.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sting.dao.NoticeDao;
import com.sting.dao.UserDao;
import com.sting.vo.NoticeVo;
import com.sting.vo.UserVo;

import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;


@Controller
public class AuthController {
	
	@Autowired
	UserDao userDao;
	@Autowired
	NoticeDao noticeDao;
	@Autowired
	HttpSession session;
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping("/loginProcess.do")
	public String loginProcess(Model model)
	{
		try{
			String userId = SecurityContextHolder.getContext().getAuthentication().getName();		
			UserVo currentUser = userDao.getUserById(userId);
			// 인증 정보가 없으면 userId = anonymousUser
			// currnetUser = null
			List<NoticeVo> top2Notice = noticeDao.getTop2Notice();
			
			for(int i=0;i<top2Notice.size();i++)
			{
				String tmpDate = top2Notice.get(i).getDate();
				top2Notice.get(i).setDate(tmpDate.substring(0,10));
			}


			session.setAttribute("currentUser", currentUser);
			session.setAttribute("top2Notice", top2Notice);

			return "redirect:/";		
		}
		catch(Exception e)
		{
			System.out.println("gi");
			logger.info("비정상 접근입니다(/loginProcess.do): "+e.getMessage());
			return "redirect:/";
		}
	}
	
	@RequestMapping("/logoutProcess.do")
	public String logoutProcess(HttpServletRequest req, HttpServletResponse res)
	{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(auth != null)
		{
			new SecurityContextLogoutHandler().logout(req, res, auth);
		}
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping("/authError")
	@ResponseBody
	public String authError()
	{
		return "you can not see this";
	}

}

