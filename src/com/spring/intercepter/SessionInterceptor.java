package com.spring.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.constant.Constants;
import com.spring.entity.User;

public class SessionInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session= request.getSession();
		User user=(User) session.getAttribute(Constants.loginUser);
		if(user==null){
	        response.sendRedirect("http://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/login.jsp");  
	        return false;  
		}
		return super.preHandle(request, response, handler);
	}
 

}
