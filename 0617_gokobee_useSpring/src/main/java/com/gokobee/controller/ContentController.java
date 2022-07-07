package com.gokobee.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.gokobee.controller.Constant;
import com.gokobee.dao.MybatisDAO;
import com.gokobee.utils.UploadFileUtils;
import com.gokobee.vo.UserInfoVO;

import net.sf.json.JSONArray;

import com.gokobee.vo.CategoryVO;
import com.gokobee.vo.ContentVO;


@Controller
public class ContentController {
	
	private static final Logger logger = LoggerFactory.getLogger(ContentController.class);
	
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
	@RequestMapping(value = "/contentRegister", method = RequestMethod.GET)
	public String contentRegister(Locale locale, Model model) {
		System.out.println("ContentController의 contentRegister() 메소드");
		return "/content/contentRegister";
	}
	
	@RequestMapping(value= "/contentRegisterOK")
	public String contentRegisterOK(Locale locale, Model model, MultipartFile file, ContentVO contentVO) throws IOException, Exception {
		System.out.println("ContentController의 contentRegisterOK() 메소드");
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		 fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		contentVO.setContentImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		contentVO.setContentThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		mapper.contentRegister(contentVO);
		return "redirect:/";
	}
	
	@RequestMapping(value="/shop/list")
	public String selectList(Model model) {
		System.out.println("ContentController의 selectList() 메소드");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		List<ContentVO> list = null;
		list = mapper.selectList();
		model.addAttribute("list", list);
		return "/shop/list";
	}
	
	@RequestMapping(value="/shop/view")
	public String getView(Model model, @RequestParam("n") int contentNum) {
		System.out.println("ContentController의 getView() 메소드");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		ContentVO content = mapper.myContentView(contentNum);
		model.addAttribute("content", content);
		//System.out.println("getview: " + content);
		return "/shop/view";
	}
	
}
	


