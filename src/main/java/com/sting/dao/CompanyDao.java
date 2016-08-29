package com.sting.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import com.sting.vo.CompanyVo;

@Mapper
public interface CompanyDao {
	public CompanyVo getCompanyById(String id);
	public void makecompany(HashMap<String,String> map);
}
