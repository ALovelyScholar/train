package com.spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.spring.dao.NoticeMapper;
import com.spring.entity.Notice;
import com.spring.resp.PageReq;
import com.spring.util.DateUtil;

@Service
public class NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;
	
	
	public void save(Notice notice){
		if(notice.getId()==null){
			noticeMapper.insert(notice);
		}else{
			noticeMapper.updateByPrimaryKeySelective(notice);
		}
	}
	
	
	
	public Notice getNoticeObj(Long id){
		return noticeMapper.selectByPrimaryKey(id);
	}
	
	
	public PageInfo<Notice> findByPage(PageReq page,String title){
		PageHelper.startPage(page.getPage(), page.getLimit(),true);
		Map<String, Object> param=new HashMap<>();
		if(StringUtils.isNotEmpty(title)){
			param.put("title",title);
		}
		List<Notice> list=noticeMapper.findByPage(param);
		list.forEach(n->{
			n.setPubTime(DateUtil.format(n.getCreateTime(),"yyyy-MM-dd HH:mm"));
		});
		PageInfo<Notice> pageList=new PageInfo<>(list);
		return pageList;
	}
	
	
	
	public void delete(String[] ids){
		if(ids!=null){
			for(String id:ids){
				noticeMapper.deleteByPrimaryKey(Long.parseLong(id));
			}
		}
	}
}
