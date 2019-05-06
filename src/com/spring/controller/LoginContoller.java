package com.spring.controller;

import com.spring.constant.Constants;
import com.spring.entity.User;
import com.spring.resp.ResponseDataBody;
import com.spring.service.UserService;
import com.spring.util.CodeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.RenderedImage;
import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping("login")
public class LoginContoller extends BaseContoller{

	@Autowired
	private UserService userService;
	
	@PostMapping("in")
	@ResponseBody
	public ResponseDataBody<Object> login(String account,String psw,String userCode,HttpSession session){
		String code = session.getAttribute("randCheckCode").toString().toUpperCase();
		if(!code.equals(userCode.toUpperCase())){
			return errorData("验证码错误");
		}
		 User user=userService.loginUser(account, psw);
		 if(user==null){
			 return  errorData("用户名密码不正确");
		 }
		 session.setAttribute(Constants.loginUser, user);
		return successData();
	}
	
	
	@PostMapping("out")
	@ResponseBody
	public ResponseDataBody<Object> logout(HttpSession session){
		 session.removeAttribute(Constants.loginUser);
		return successData();
	}
	
	@PostMapping("register")
	@ResponseBody
	public ResponseDataBody<Object> register(User user,HttpSession session){

		String code = session.getAttribute("randCheckCode").toString().toUpperCase();
		String userCode = user.getCode().toUpperCase();
		if(!code.equals(userCode)){
			return errorData("验证码错误");
		}
		boolean flag=userService.valiadeAccount(user.getAccount());
		if(flag){
			return errorData("账户已经存在");
		}
		user.setRoleId(2);
		userService.saveUser(user);
		return successData();
	}

	@RequestMapping("getCode")
	public void toReg(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "No-cache");
		response.setDateHeader("Expires", 0);
		//指定生成的响应图片,一定不能缺少这句话,否则错误.
		response.setContentType("image/jpeg");
		Map<String, Object> map = CodeUtil.generateCodeAndPic();
		HttpSession session=request.getSession(true);
		// 把当前生成的验证码存在session中，当用户输入后进行对比
		session.setAttribute("randCheckCode", map.get("code"));
		ImageIO.write((RenderedImage)map.get("codePic"),"JPEG",response.getOutputStream());
	}
}
