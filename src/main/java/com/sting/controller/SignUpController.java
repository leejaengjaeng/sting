package com.sting.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sting.dao.CompanyDao;
import com.sting.dao.UserDao;
import com.sting.vo.UserVo;
import com.sting.vo.CompanyVo;
@Controller
@RequestMapping("/signup")
public class SignUpController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	
	@Autowired UserDao userMapper;
	@Autowired CompanyDao companyMapper;
	
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
	public String signupinput(UserVo uv,CompanyVo cv,HttpServletRequest request){
		String email=request.getParameter("email1")+request.getParameter("email2");
		
		System.out.println(uv.getUid());
		
		HashMap<String,String> map=new HashMap<String,String>();
		map.put("id", uv.getId());
		map.put("phonenumber", uv.getPhone());
		map.put("password", uv.getPassword());
		map.put("email", email);
		map.put("addr1", request.getParameter("addr1"));
		map.put("addr2", request.getParameter("addr2"));
		map.put("addr3", request.getParameter("addr3"));
		map.put("role", "1");
		userMapper.makeuser(map);
		//System.out.println(cv.getCompany_name());
		
		UserVo Uid=userMapper.getUserById(uv.getId());
		int uid=Uid.getUid();
		
		HashMap<String,String> mapcom=new HashMap<String,String>();
		mapcom.put("company_name", cv.getCompany_name());
		mapcom.put("Uid", Integer.toString(uid));
		mapcom.put("registration_number", cv.getRegistration_number());
		mapcom.put("manager_name", cv.getManager_name());
		mapcom.put("manager_phonenumber", cv.getManager_phonenumber());
		mapcom.put("interestproduct", cv.getInterestproduct());
		mapcom.put("typeofcompany",cv.getTypeofcompany());
		
		companyMapper.makecompany(mapcom);
		return "redirect:/";
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
