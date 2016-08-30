package com.sting.dao;

import com.sting.vo.UserVo;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserDao {
	
	public List<UserVo> getNotPermitList();
	public void userPermit(String uid);
	public UserVo getUserById(String id);
	public void makeuser(HashMap<String,String> map);
	public int checkid(String id);
	
}
