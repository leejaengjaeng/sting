package com.sting.controller;

import java.util.HashMap;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import javax.servlet.http.HttpServletRequest;
import com.sting.dao.*;
import com.sting.service.UserAuthService;
import com.sting.vo.UserVo;

@Controller
public class MainController {
	
	@Autowired
	UserDao userMapper;
	@Autowired
	UserAuthService userAuth;
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@RequestMapping("/")
	public String index(Model model)
	{
		logger.debug("jinuk");
		return "home/index";
		
	}
	
	@RequestMapping("/login")
	public String tt(Model model)
	{
		return "home/login";
	}
	
	@RequestMapping("/admin")
	@ResponseBody
	public String adminP()
	{
		return "admin Page";

	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public String hh()
	{
		return "fuck";
	}
	@RequestMapping("/agree")
	public String agree(){
		return "signup/checkagree";
	}
	
	@RequestMapping("/signupintro")
	public String goSignup(){
		return "signup/signupIntro";
	}
	
	@RequestMapping("/companySignup")
	public String companySignup(){
		return "signup/companySignup";
	}
	@RequestMapping(value="/signupinput",method=RequestMethod.POST)
	public String signupinput(UserVo uv){
		userMapper.makeuser(uv.getId());
		System.out.println("aaaa"+uv.getId());
		logger.info("aa");
		return "home/index";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/checkid", method = RequestMethod.POST)
	public HashMap<String, Object> checkId(@RequestParam HashMap<String, Object> param) {
	    logger.info("checkid join");
	    System.out.println(param);
	    System.out.println("id is "+param.get("id"));
	 
	    //your logic
	 
	    HashMap<String, Object> hashmap = new HashMap<String, Object>();
	    hashmap.put("KEY", "YES");
	     
	    return hashmap;
	}
}

