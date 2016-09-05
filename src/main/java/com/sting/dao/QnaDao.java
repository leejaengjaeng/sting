package com.sting.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.sting.vo.QnaVo;

@Mapper
public interface QnaDao {
	public List<QnaVo> getQnaList();
	public void makequestion(HashMap<String,String> map);
}
