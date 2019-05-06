package com.spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.spring.dao.MessageMapper;
import com.spring.dao.UserMapper;
import com.spring.entity.Message;
import com.spring.entity.User;
import com.spring.resp.PageReq;

@Service
public class MessageService {

	@Autowired
	private MessageMapper messageMapper;
	@Autowired
	private UserMapper userMapper;
	
	public void save(Message notice){
		if(notice.getId()==null){
			messageMapper.insert(notice);
		}else{
			messageMapper.updateByPrimaryKeySelective(notice);
		}
	}
	
	public void saveBack(Message notice,User user){
		Message msg=this.getMessageObj(notice.getId());
		notice.setUserId(msg.getSendId());
		notice.setSendId(user.getId().longValue());
		notice.setState(0);
		messageMapper.insert(notice);
		 msg=new Message();
		msg.setId(notice.getId());
		msg.setState(1);
		messageMapper.updateByPrimaryKeySelective(msg); 
	}
	
	
	public Message getMessageObj(Long id){
		Message msg= messageMapper.selectByPrimaryKey(id);
		if(msg.getState()==0){
			Message	message=new Message();
			message.setId(id);
			message.setState(1);
			messageMapper.updateByPrimaryKeySelective(message);
		}
		return msg;
	}
	
	
	public PageInfo<Message> findByPage(PageReq page,User user){
		PageHelper.startPage(page.getPage(), page.getLimit(),true);
		Map<String, Object> param=new HashMap<>();
		if(user.getRoleId()==1){
			param.put("userId",user.getRoleId());
		}else{
			param.put("userId",user.getId());
		}
		List<Message> list=messageMapper.findByPage(param);
		list.forEach(m->{
			User users=userMapper.selectByPrimaryKey(m.getSendId().intValue());
			m.setSendName(users.getName());
			if(m.getState()==0){
				m.setStateMsg("未回复");
			}else{
				m.setStateMsg("已回复");
			}
		});
		PageInfo<Message> pageList=new PageInfo<>(list);
		return pageList;
	}
	
	
	public void updateRead(String[] ids){
		if(ids!=null){
			for(String id:ids){
				Message msg=new Message();
				msg.setId(Long.parseLong(id));
				msg.setState(1);
				messageMapper.updateByPrimaryKeySelective(msg);
			}
		}
	}
	
	
	public void delete(String[] ids){
		if(ids!=null){
			for(String id:ids){
				messageMapper.deleteByPrimaryKey(Long.parseLong(id));
			}
		}
	}
}
