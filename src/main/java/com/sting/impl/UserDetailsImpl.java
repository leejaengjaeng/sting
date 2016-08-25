package com.sting.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.sting.vo.*;

public class UserDetailsImpl extends User {

	public UserDetailsImpl(UserVo user, List<GrantedAuthority> auths) {
		
		super(user.getId(),user.getPassword(), auths);
		// TODO Auto-generated constructor stub
		System.out.println(user.getId()+","+user.getPassword()+","+auths);
		
	}
	/*
	private static Collection<? extends GrantedAuthority> auth(UserVo user)
	{
		List<GrantedAuthority> auth = new ArrayList<>();
		
		auth.add(new SimpleGrantedAuthority(user.getRole()));
		return auth;
	}
	*/
}
