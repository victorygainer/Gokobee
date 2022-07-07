package com.gokobee.controller;


import java.util.ArrayList;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gokobee.controller.Constant;
import com.gokobee.dao.MybatisDAO;

import com.gokobee.vo.UserCommentVO;


@Controller
public class CommentController {
	
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
	
	@Resource(name="uploadPath")
	private String uploadPath;

	
	// 컨텐츠 등록
	@ResponseBody
	@RequestMapping(value = "/shop/insertComment", method = RequestMethod.GET)
	public void insertComment(Locale locale, Model model, UserCommentVO userCommentVO, 
			@RequestParam("n") int contentNum, HttpServletResponse response) throws Exception {
		System.out.println("CommentController의 insertComment() 메소드");
		//System.out.println(contentNum);
		userCommentVO.setContentNum(contentNum);
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);		
		//System.out.println(userCommentVO);
		mapper.insertComment(userCommentVO);
		int result = userCommentVO.getContentNum();
		//System.out.println("result: " + result);
		response.getWriter().write(String.valueOf(result));
		response.getWriter().write(result + "");
	}
	
	@ResponseBody
	@RequestMapping(value ="/commentList", method = RequestMethod.GET)
	public void commentList(Locale locale, Model model, UserCommentVO userCommentVO
			,@RequestParam("n") int contentNum, HttpServletResponse response) throws Exception {
		System.out.println("CommentController의 CommentList() 메소드");
		response.getWriter().write(getJSON(contentNum));
	}

	private String getJSON(@RequestParam("n") int contentNum) {
		System.out.println("CommentController의 getJSON() 메소드");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);	
		//System.out.println(contentNum);
		ArrayList<UserCommentVO> list = mapper.selectCommentList(contentNum);
		//System.out.println(list);
		StringBuffer result = new StringBuffer();
		result.append("{\"result\": [");
		for (UserCommentVO cmo : list) {
			result.append("[{\"value\": \"" + cmo.getUserID().trim() + "\"},");
			result.append("{\"value\": \"" + cmo.getCommentDes() + "\"},");
			result.append("{\"value\": \"" + cmo.getCommentDate() + "\"}],");
		}
		result.append("]}");
		//System.out.println(result);
		return result.toString();	
	}
	
}
	


