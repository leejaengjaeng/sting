package com.sting.controller;


import java.util.HashMap;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sting.dao.*;
import com.sting.service.UserAuthService;
import com.sting.vo.NoticeVo;
import com.sting.vo.UserVo;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class MainController {
		
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	private static final int pagingCnt = 10;
	
	@Autowired NoticeDao noticeDao;
	@Autowired HttpSession session;
	
	@RequestMapping("/")
	public String index(Model model)
	{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		if(auth.getName() != "anonymousUser")
		{
			model.addAttribute("path", "main");
		}
		
		return "home/index";
	}
	
	@RequestMapping("/login")
	public String login(Model model)
	{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		if(auth.getName() != "anonymousUser")
		{
			logger.debug("userId:"+auth.getName());
			return "redirect:/";
		}
		else
		{
			model.addAttribute("path","login");
			return "home/index";
		}
	}
	
//---- notice ----
	@RequestMapping("/noticeList")
	public String redirectNoticeList(Model model)
	{
		return "notice/notice";
	}
	
	@RequestMapping(value="/noticeList/{start}",method=RequestMethod.GET)
	@ResponseBody
	public List<NoticeVo> noticeList(@PathVariable int start)
	{
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		map.put("start",start);
		map.put("cnt",pagingCnt);
		List<NoticeVo> notices = noticeDao.getAtoCntinNotice(map);
		
		session.setAttribute("startP", start);

		return notices;
	}
	@RequestMapping(value="/getNoticeCnt",method=RequestMethod.GET)
	@ResponseBody
	public int getNoticeCnt()
	{
		//처음 getNotice를 부르기 전에 startP 셋팅용
		session.setAttribute("startP", 0);

		int noticeCnt = noticeDao.getNoticeCnt();
		
		if(noticeCnt%pagingCnt==0)
			return noticeCnt/pagingCnt;
		else
			return (noticeCnt/pagingCnt)+1;
	}
	
	@RequestMapping(value="/getNoticeDetail/{nid}",method=RequestMethod.GET)
	public String getNoticeDetail(Model model,@PathVariable String nid)
	{
		NoticeVo notice = noticeDao.getNoticeByNid(nid);
		model.addAttribute("noticeDetail", notice);

		noticeDao.updateHitById(nid);

		return "notice/noticeDetail";
	}
	
//---- end notice ----
	@RequestMapping("/adminLogin")
	public String adminP(Model model)
	{
		return "admin/admin";
	}
	

	
}

