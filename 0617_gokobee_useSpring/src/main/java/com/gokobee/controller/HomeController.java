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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.gokobee.controller.Constant;
import com.gokobee.dao.MybatisDAO;
import com.gokobee.vo.UserInfoVO;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	private JdbcTemplate template;

	public JdbcTemplate getTemplate() {
		return template;
	}

	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Autowired
	public void setTemplate(JdbcTemplate template) {

		this.template = template;

		Constant.template = this.template;
	}
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, UserInfoVO userInfoVO) {
		System.out.println("HomeController의 home() 메소드");

		return "redirect:shop/list";
	}
}
	


