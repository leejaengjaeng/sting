package com.sting.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
	@Autowired ServletContext sc;


	
	
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
	@RequestMapping("/reponsequestion")
	public String responsequestion(Model model){
		return "qna/answer";
		
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
	@RequestMapping(value="/sendmail", method=RequestMethod.POST)
	@ResponseBody
	 public Object sendmail4(@RequestParam("title")String title
	   ) throws IOException, EmailException{
	 
	  
	  System.out.println(title);
	  SimpleEmail email = new SimpleEmail();

	  email.setCharset("euc-kr"); // 한글 인코딩 
	  email.setHostName("smtp.worksmobile.com"); //SMTP서버 설정
	  email.setSmtpPort(587);  //포트번호
	  email.setAuthentication("starpic@starpic.kr", "dkdleldj1"); //메일인증  
	  email.setSSL(true);   //모르겠음
	  email.setTLS(true);
	  email.setMsg("aaaaaaa"); // 메일 제목
	  email.setDebug(true);
	  email.setContent("simple 메일 naverTest입니다", "text/plain; charset=euc-kr");
	  email.setSubject("TestMail");
	
	  try {
		  
	   email.setFrom("starpic@starpic.kr");
	   email.addTo("wooyoomisutgaru@gmail.com"); // 수신자 추가
	   email.addTo("10_hall@naver.com");
	   email.send();
	   
	  } catch (EmailException e) {
	   
	   e.printStackTrace();
	   System.out.println("에러");
	   return "FAIL";
	  }
	  return "OK";
	 }
	

}