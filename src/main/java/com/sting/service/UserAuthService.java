package com.sting.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.sting.dao.*;
import com.sting.impl.UserDetailsImpl;
import com.sting.vo.UserVo;

@Service("UserAuthService")
public class UserAuthService implements UserDetailsService{

	@Autowired
	UserDao userDao;
	
	//�씤利앹쓣 �쐞�빐 �뒪�봽留� �떆�걧由ы떚 �쑀��瑜� 諛섑솚
	private User buildUserForAuth(UserVo user, List<GrantedAuthority> auths)
	{
		return new User(user.getId(),user.getPassword(),
				true,true,true,true,auths);
	}
	
	//沅뚰븳�쓣 諛쏆븘�꽌 �뒪�봽留� �떆�걧由ы떚�뿉�꽌 �벐�뒗 沅뚰븳 由ъ뒪�듃濡� 諛섑솚
		//userRole�쓣 String留먭퀬 由ъ뒪�듃濡� �꽆寃⑥빞 �뿬�윭媛�吏� 濡ㅼ쓣 以꾩닚�엳�뒗�뜲 援녹씠 �슦由щ뒗 洹몃윺 �븘�슆 �뾾�쓣�벏
	private List<GrantedAuthority> buildAuth(String userRole)
	{
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		
		authorities.add(new SimpleGrantedAuthority(userRole));
		
		return authorities;
	}
	
	//�뿬湲곗꽌 諛섑솚�맂 UserDetail�쓽 援ы쁽泥대줈 AuthenticationManagerBuilder �뿉�꽌 �씤利앹쓣 泥섎━�븯�뒗�벏 
	@Override
	public UserDetails loadUserByUsername(String userid) throws UsernameNotFoundException {
		
		UserVo userVo = userDao.getUserById(userid);
		
		if(userVo == null)
		{
			throw new UsernameNotFoundException(userid);
		}
		
		// ? �씠嫄� �븞�벐�씠�뒗嫄� 媛숈��뜲?
		List<GrantedAuthority> authorities = buildAuth(userVo.getRole());
		
		System.out.println(authorities);
		
		UserDetailsImpl user = new UserDetailsImpl(userVo, authorities); 
		
		return user;
	}
	

}
