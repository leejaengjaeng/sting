package com.sting.controller;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sting.dao.NoticeDao;
import com.sting.dao.QnaDao;
import com.sting.dao.UserDao;
import com.sting.vo.NoticeVo;
import com.sting.vo.QnaVo;
import com.sting.vo.UserVo;

import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;


@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	UserDao userDao;
	@Autowired
	QnaDao Qnamapper;
	@Autowired
	HttpSession session;
	
	@RequestMapping(value="/adminMenu/Menu_req",method=RequestMethod.GET)
	@ResponseBody
	public List<UserVo> reqList()
	{
		List<UserVo> unPermitedList = userDao.getNotPermitList();
		
		return unPermitedList;
	}
	
	@RequestMapping(value="/adminMenu/userPermitOk",method=RequestMethod.POST)
	@ResponseBody
	public String permit(@RequestParam("uid")String uid)
	{
		System.out.println(uid);
		userDao.userPermit(uid);
		return uid+" deleted!";
	}
	
	
	@RequestMapping("/askquestion")
	public String askquestion(Model model){
		return "qna/question";
		
	}
	@RequestMapping(value="/adminMenu/QnaList",method=RequestMethod.GET)
	@ResponseBody
	public List<QnaVo> QnaList(){
		List<QnaVo> qnalist = Qnamapper.getQnaList();
		return qnalist;
	}

	
	@RequestMapping(value="/savequestion", method=RequestMethod.POST)
	public String savequestion(Model model,HttpServletRequest request,QnaVo qv){
		//Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String userId = SecurityContextHolder.getContext().getAuthentication().getName();
		HashMap<String,String> map =new HashMap();
		UserVo uv=userDao.getUserById(userId);
		System.out.println(Integer.toString(uv.getUid()));
		
		map.put("uid", Integer.toString(uv.getUid()));
		map.put("title", qv.getTitle());
		map.put("content",qv.getContent() );
		
		Qnamapper.makequestion(map);
		return "redirect:/";
	}
	
	

}