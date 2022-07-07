package com.gokobee.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.gokobee.controller.Constant;
import com.gokobee.dao.MybatisDAO;
import com.gokobee.vo.UserInfoVO;

@Controller
public class UserInfoController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserInfoController.class);
	
	private JdbcTemplate template;

	public JdbcTemplate getTemplate() {
		return template;
	}

	@Autowired
	public void setTemplate(JdbcTemplate template) {

		this.template = template;

		Constant.template = this.template;
	}
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	BCryptPasswordEncoder passEncoder;

	@RequestMapping(value = "/userRegister")
	public String userRegister(HttpServletRequest request, Model model) {
		System.out.println("HomeController 클래스의 userRegister() 메소드");
		return "/userInfo/userRegister";
	}
	@RequestMapping(value = "/userRegisterCheck", method = RequestMethod.POST)
	public String userRegisterCheck(HttpServletRequest request, Model model, UserInfoVO userInfoVO) {
		//System.out.println(userInfoVO);
		HttpSession session = request.getSession();
		String userID = request.getParameter("userID");
		String userPassword = request.getParameter("userPassword");
		String confirmPassword = request.getParameter("confirmPassword");
		String msg = "";
		model.addAttribute("userID", userID);
		model.addAttribute("userPassword", userPassword);
		model.addAttribute("confirmPassword", confirmPassword);
		if (userPassword.equals(confirmPassword)) {
			return "redirect:userRegisterOK";
		} else {
			msg = "입력하신 패스워드가 일치하지 않습니다.";
			session.setAttribute("msg",msg);
			return "errorPage";
		}
	}
	
	@RequestMapping(value = "/userRegisterOK")
	public String userRegisterOK(HttpServletRequest request, Model model, UserInfoVO userInfoVO) {
		System.out.println("HomeController 클래스의 userRegisterOK() 메소드");
		System.out.println(userInfoVO);
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		String userPassword = userInfoVO.getUserPassword();
		String encryptionPassword = passEncoder.encode(userPassword);
		userInfoVO.setUserPassword(encryptionPassword);
		
		mapper.userRegister(userInfoVO);
		return "redirect:/";	
	}
	
	@RequestMapping(value = "/login")
	public String login(HttpServletRequest request, Model model, UserInfoVO userInfoVO) {
		System.out.println("HomeController 클래스의 login() 메소드");
		model.addAttribute("userInfoVO", userInfoVO);
		return "/userInfo/login";
	}
	
	@RequestMapping(value = "/loginCheck")
	public String loginCheck(HttpServletRequest request, Model model, UserInfoVO userInfoVO) {
		System.out.println("HomeController 클래스의 loginOK() 메소드");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		HttpSession session = request.getSession();
		session.setAttribute("userInfo", userInfoVO);
		String msg= "";
		try {	
			UserInfoVO login = mapper.login(userInfoVO);
			boolean passMatch = passEncoder.matches(userInfoVO.getUserPassword(), login.getUserPassword());
			if (login != null && passMatch) {
				session.setAttribute("userInfo", login);
				} else {
				msg = "패스워드를 잘못 입력하셨습니다.";
				session.setAttribute("msg",msg);
				return "errorPage";
			}		
		} catch (NullPointerException e) {
			msg = "등록된 아이디가 없습니다.";
			session.setAttribute("msg",msg);
			return "errorPage";
		}
		return "redirect:/";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, Model model) {
		System.out.println("HomeController 클래스의 logout() 메소드");
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}
}
	


