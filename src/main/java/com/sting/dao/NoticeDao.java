package com.sting.dao;

import com.sting.vo.NoticeVo;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeDao {
	
	public List<NoticeVo> getTop2Notice();
	public NoticeVo getNoticeByNid(String id);
	public void updateHitById(String id);
}
