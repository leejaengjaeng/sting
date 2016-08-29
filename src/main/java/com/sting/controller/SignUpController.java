package com.sting.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sting.dao.UserDao;
import com.sting.vo.UserVo;
@Controller
public class SignUpController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	
	@Autowired UserDao userMapper;
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
	    String id = param.get("id").toString();
    	HashMap<String, Object> hashmap = new HashMap<String, Object>();
	    //your logic
	    if(userMapper.checkid(id)==0){
		    hashmap.put("KEY", "YES");
		    return hashmap;
	    }
	    else{
		    hashmap.put("KEY", "NO");
		    return hashmap;
	    }
	    
	     
	    
	}
}
