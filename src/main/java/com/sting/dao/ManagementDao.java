package com.sting.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import com.sting.vo.ManagementVo;

@Mapper
public interface ManagementDao {
	public ManagementVo getManagementById(String id);
	public void makemanagement(HashMap<String,String> map);
}
