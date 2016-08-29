package com.sting.dao;

import com.sting.vo.UserVo;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserDao {
	
	public UserVo getUserById(String id);
	public void makeuser(HashMap<String,String> map);
	public int checkid(String id);
}
