package com.gokobee.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gokobee.dao.MybatisDAO;
import com.gokobee.vo.ContentVO;

@Controller
public class SearchController {
	
private static final Logger logger = LoggerFactory.getLogger(CommentController.class);
	
	private JdbcTemplate template;

	public JdbcTemplate getTemplate() {
		return template;
	}

	@Autowired
	public void setTemplate(JdbcTemplate template) {

		this.template = template;

		Constant.template = this.template;
	}
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/contentSearch", method = {RequestMethod.GET, RequestMethod.POST})
	public String contentSearch(ContentVO contentVO, Model model) {
		System.out.println("SearchController의 contentSearch() 메소드");
		//System.out.println(contentVO);
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);	
		String contentName = contentVO.getContentName();
		//System.out.println(contentName);
		List<ContentVO> list = null;
		list = mapper.contentSearch(contentName);
		//System.out.println(list);
		model.addAttribute("contentName", contentName);
		model.addAttribute("searchList",list);
		return "/shop/searchList";
	}
	
}
