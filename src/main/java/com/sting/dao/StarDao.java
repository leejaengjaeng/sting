package com.sting.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import com.sting.vo.StarVo;

@Mapper
public interface StarDao {
	public StarVo getCompanyById(String id);
	public void makestar(HashMap<String,String> map);
}
