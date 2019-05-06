package com.spring.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.spring.constant.Constants;
import com.spring.entity.Train;
import com.spring.entity.TrainOrder;
import com.spring.entity.User;
import com.spring.exception.BusinessException;
import com.spring.resp.OrderReq;
import com.spring.resp.PageReq;
import com.spring.resp.ResponseDataBody;
import com.spring.service.OrderService;

@Controller
@RequestMapping("order")
public class OrderContoller extends BaseContoller{

	@Autowired
	private OrderService orderService;
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    dateFormat.setLenient(false);
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));//true:允许输入空值，false:不能为空值
	}
	
	@GetMapping("{url}")
	public String defaultUrl(@PathVariable("url") String url){
		logger.info("默认url="+url);
		return "order/"+url;
	}
	
	
	@RequestMapping("book")
	public String book(OrderReq req,HttpServletRequest request){
		Train train=orderService.book(req);
		request.setAttribute("train", train);
		request.setAttribute("nowDate", req.getNowDate());
		if(req.getOrderId()!=null){
			request.setAttribute("orderId", req.getOrderId());
		}
		return "front/book";
	}
	
	
	@RequestMapping("sign")
	public String sign(OrderReq req,HttpServletRequest request){
		TrainOrder order=orderService.getOderObj(req.getOrderId());
		request.setAttribute("order", order);
		request.setAttribute("nowDate", req.getNowDate());
		return "front/sign";
	}
	
	
	@PostMapping("save")
	@ResponseBody
	public ResponseDataBody<Object> save(OrderReq req,HttpSession session){
		User user=(User) session.getAttribute(Constants.loginUser);
		try {
			orderService.saveOrder(req, user);
		} catch (BusinessException e) {
			return errorData(e.getMessage());
		}
		 return successData();
	}
	
	
	
	@GetMapping("list")
	@ResponseBody
	public ResponseDataBody<List<TrainOrder>> list(PageReq page,String start,String end,HttpSession session){
		User user=(User) session.getAttribute(Constants.loginUser);
		 Map<String, Object> param=new HashMap<>();
		 if(StringUtils.isNotEmpty(start)){
			 param.put("start", start);
		 }
		 if(StringUtils.isNotEmpty(end)){
			 param.put("end", end);
		 }
		 if(user.getRoleId()!=1){
			 param.put("userId", user.getId());
		 }
		 PageInfo<TrainOrder> info=orderService.findByPage(page, param);
		 return successData(info.getTotal(),info.getList());
	}
	
	
	@PostMapping("update")
	@ResponseBody
	public ResponseDataBody<Object> update(long id,Integer state,HttpSession session){
		User user=(User) session.getAttribute(Constants.loginUser);
		try {
			TrainOrder order=new TrainOrder();
			order.setId(id);
			order.setState(state);
			orderService.update(order);
		} catch (BusinessException e) {
			return errorData(e.getMessage());
		}
		 return successData();
	}
	
}
