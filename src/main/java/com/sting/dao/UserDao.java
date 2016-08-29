package com.sting.dao;

import com.sting.vo.UserVo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserDao {
	
	public UserVo getUserById(String id);
	public void makeuser(String id);
	public int checkid(String id);
}
