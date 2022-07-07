package com.gokobee.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.gokobee.vo.UserInfoVO;

public class AdminInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws IOException {
		System.out.println("AdminInterceptor() 클래스의 preHandle 메소드");
		HttpSession session = request.getSession();
		UserInfoVO userInfoVO = (UserInfoVO)session.getAttribute("userInfo");
		String ctx = request.getContextPath();

		if(userInfoVO == null) {
			response.sendRedirect(ctx + "/login");
			return false;
		}
		
		if(userInfoVO.getVerify() != 9 ) {
			response.sendRedirect(ctx + "/shop/list");
			return false;
		}

		return true;
	}

}
