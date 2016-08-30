package com.sting.controller;

import java.io.FileOutputStream;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;

import com.sting.dao.CompanyDao;
import com.sting.dao.ManagementDao;
import com.sting.dao.UserDao;
import com.sting.vo.CompanyVo;
import com.sting.vo.ManagementVo;
import com.sting.vo.UserVo;

@Controller
@RequestMapping("/signup")
public class SignUpController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	private FileOutputStream fos;

	@Autowired
	UserDao userMapper;
	@Autowired
	CompanyDao companyMapper;
	@Autowired
	ManagementDao ManagementMapper;

	@RequestMapping("/agree")
	public String agree() {
		return "signup/checkagree";
	}

	@RequestMapping("/signupintro")
	public String goSignup() {
		return "signup/signupIntro";
	}

	@RequestMapping("/companySignup")
	public String companySignup(Model model) {
		model.addAttribute("url", "/signup/signupinputcompany");
		return "signup/signuppageCM";
	}

	@RequestMapping("/starSignup")
	public String starSignup(Model model) {
		return "signup/signuppageSS";
	}

	@RequestMapping("/managementSignup")
	public String managementSignup(Model model) {
		model.addAttribute("url", "/signup/signupinputmanagement");
		return "signup/signuppageCM";
	}

	@RequestMapping("/snsstar")
	public String snsstarSignup(Model model) {
		return "signup/signuppageSS";
	}

	@RequestMapping(value = "/signupinputcompany", method = RequestMethod.POST)
	public String signupinputcompany(UserVo uv, CompanyVo cv, HttpServletRequest request,
			@RequestParam("registration_scan") MultipartFile file) {
		String email = request.getParameter("email1") + request.getParameter("email2");

		System.out.println(uv.getUid());

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", uv.getId());
		map.put("phonenumber", uv.getPhone());
		map.put("password", uv.getPassword());
		map.put("email", email);
		map.put("addr1", request.getParameter("addr1"));
		map.put("addr2", request.getParameter("addr2"));
		map.put("addr3", request.getParameter("addr3"));
		map.put("role", "1");
		userMapper.makeuser(map);

		UserVo Uid = userMapper.getUserById(uv.getId());
		int uid = Uid.getUid();

		HashMap<String, String> mapcom = new HashMap<String, String>();
		mapcom.put("company_name", cv.getCompany_name());
		mapcom.put("Uid", Integer.toString(uid));
		mapcom.put("registration_number", cv.getRegistration_number());
		mapcom.put("manager_name", cv.getManager_name());
		mapcom.put("manager_phonenumber", cv.getManager_phonenumber());
		mapcom.put("interestproduct", cv.getInterestproduct());
		mapcom.put("typeofcompany", cv.getTypeofcompany());
		companyMapper.makecompany(mapcom);
		try {
			byte fileData[] = file.getBytes();
			int pathPoint = file.getOriginalFilename().trim().lastIndexOf(".");
			String filePoint = file.getOriginalFilename().trim().substring(pathPoint + 1,
					file.getOriginalFilename().trim().length());
			String fileType = filePoint.toLowerCase();
			fos = new FileOutputStream("C:\\scan" + "\\" + cv.getCompany_name() + "." + fileType);
			fos.write(fileData);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fos != null) {
				try {
					fos.close();
				} catch (Exception e) {
				}
			}
		} // try end;
		return "redirect:/";
	}

	@RequestMapping(value = "/signupinputmanagement", method = RequestMethod.POST)
	public String signupinputmanagement(UserVo uv, ManagementVo mv, HttpServletRequest request,
			@RequestParam("registration_scan") MultipartFile file) {
		String email = request.getParameter("email1") + request.getParameter("email2");

		//System.out.println(uv.getUid());

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", uv.getId());
		map.put("phonenumber", uv.getPhone());
		map.put("password", uv.getPassword());
		map.put("email", email);
		map.put("addr1", request.getParameter("addr1"));
		map.put("addr2", request.getParameter("addr2"));
		map.put("addr3", request.getParameter("addr3"));
		map.put("role", "1");
		userMapper.makeuser(map);

		UserVo Uid = userMapper.getUserById(uv.getId());
		int uid = Uid.getUid();

		HashMap<String, String> mapcom = new HashMap<String, String>();
		mapcom.put("company_name", mv.getCompany_name());
		mapcom.put("Uid", Integer.toString(uid));
		mapcom.put("registration_number", mv.getRegistration_number());
		mapcom.put("manager_name", mv.getManager_name());
		mapcom.put("manager_phonenumber", mv.getManager_phonenumber());
		mapcom.put("interestproduct", mv.getInterestproduct());
		mapcom.put("typeofcompany", mv.getTypeofcompany());
		ManagementMapper.makemanagement(mapcom);
		try {
			byte fileData[] = file.getBytes();
			int pathPoint = file.getOriginalFilename().trim().lastIndexOf(".");
			String filePoint = file.getOriginalFilename().trim().substring(pathPoint + 1,
					file.getOriginalFilename().trim().length());
			String fileType = filePoint.toLowerCase();
			fos = new FileOutputStream("C:\\scan" + "\\" + mv.getCompany_name() + "." + fileType);
			fos.write(fileData);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fos != null) {
				try {
					fos.close();
				} catch (Exception e) {
				}
			}
		} // try end;
		return "redirect:/";
	}

	
	@ResponseBody
	@RequestMapping(value = "/checkid", method = RequestMethod.POST)
	public HashMap<String, Object> checkId(@RequestParam HashMap<String, Object> param) {
		logger.info("checkid join");
		System.out.println(param);
		System.out.println("id is " + param.get("id"));
		String id = param.get("id").toString();
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		// your logic
		if (userMapper.checkid(id) == 0) {
			hashmap.put("KEY", "YES");
			return hashmap;
		} else {
			hashmap.put("KEY", "NO");
			return hashmap;
		}

	}

}
