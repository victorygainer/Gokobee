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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.gokobee.controller.Constant;
import com.gokobee.dao.MybatisDAO;
import com.gokobee.utils.UploadFileUtils;
import com.gokobee.vo.UserInfoVO;
import com.gokobee.vo.WishListListVO;
import com.gokobee.vo.WishListVO;

import net.sf.json.JSONArray;

import com.gokobee.vo.CategoryVO;
import com.gokobee.vo.ContentVO;
import com.gokobee.vo.ReservationVO;


@Controller
public class ShopController {
	
	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);
	
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
	
	@ResponseBody
	@RequestMapping(value="/shop/view/addWishList", method =  {RequestMethod.GET, RequestMethod.POST})
	public void addWishList(HttpSession session, WishListVO wishListVO) {
		System.out.println("ShopController의 addWishList() 메소드");
		System.out.println(wishListVO);
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);		
		mapper.addWishList(wishListVO);
	} 
	
	@RequestMapping(value="/view/wishList", method =  {RequestMethod.GET, RequestMethod.POST})
	public String addWishListList(HttpSession session, HttpServletRequest request, Model model) {
		System.out.println("ShopController의 addWishListList() 메소드");
		String userID = request.getParameter("userID");
		//System.out.println(userID);
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);		
		List<WishListListVO> userWishList = mapper.wishListList(userID);
		//System.out.println(userWishList);
		model.addAttribute("wishList", userWishList);
		return "shop/wishList";
	}
	
	@ResponseBody
	@RequestMapping(value="/shop/view/deleteWishList", method =  {RequestMethod.GET, RequestMethod.POST})
	public void deleteWishList(HttpSession session, HttpServletRequest request,
			@RequestParam(value = "chbox[]") List<String> chArr, WishListListVO wishListVO) {
		System.out.println("ShopController의 deleteWishList() 메소드");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);		

		//System.out.println(wishListVO.getUserID());
		System.out.println("지울 위시리스트: " + chArr);
		String userID = wishListVO.getUserID();
		int contentNum = 0;
		System.out.println(contentNum);
		//mapper.addWishList(wishListVO);
		if (userID != null) {
			for (String i: chArr) {
				contentNum = Integer.parseInt(i);
				wishListVO.setContentNum(contentNum);
				mapper.deleteWishList(contentNum);
			}
		} 
	}
	@ResponseBody
	@RequestMapping(value="/shop/view/reservationOK", method =  {RequestMethod.GET, RequestMethod.POST})
	public void reservationOK(HttpSession session, HttpServletRequest request,
			ReservationVO reservationVO) {
		System.out.println("ShopController의 reservationOK() 메소드");
		System.out.println("reservationVO: " + reservationVO);
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);	
		mapper.reservationOK(reservationVO);
		}
	}	
	


