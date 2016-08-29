package com.sting.dao;

import com.sting.vo.NoticeVo;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeDao {
	
	public List<NoticeVo> getTop2Notice();
	
	//a부터 cnt 개 까지 Notice를 가지고옴
	public List<NoticeVo> getAtoCntinNotice(int a, int cnt);
	
	public NoticeVo getNoticeByNid(String id);
	
	public void updateHitById(String id);
}
