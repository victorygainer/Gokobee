package com.gokobee.dao;


import java.util.ArrayList;
import java.util.List;

import com.gokobee.vo.CategoryVO;
import com.gokobee.vo.ContentVO;
import com.gokobee.vo.ReservationVO;
import com.gokobee.vo.UserCommentVO;
import com.gokobee.vo.UserInfoVO;
import com.gokobee.vo.WishListListVO;
import com.gokobee.vo.WishListVO;

// mapper 연결에 사용하는 인터페이스
// 
public interface MybatisDAO {

// mapper로 사용되는 interface의 추상 메소드 형식은 resultType id(parameterType)와 같은 형식으로 만든다.
// MybatisDAO 인터페이스 추상 메소드 이름의 xml 파일의 sql 명령을 식별하는 id로 사용되고 추상 메소드의 인수로 전달된 데이터가 xml 파일의 
// sql 명령으로 전달된다.
	
	void userRegister(UserInfoVO userInfoVO);
	UserInfoVO login(UserInfoVO userInfoVO);
	List<CategoryVO> category();
	void contentRegister(ContentVO contentVO);
	List<ContentVO> myContentList(String userID);
	ContentVO myContentView(int contentNum);
	void contentUpdate(ContentVO contentVO);
	void contentDelete(int contentNum);
	List<ContentVO> selectList();
	void insertComment(UserCommentVO userCommentVO);
	ArrayList<UserCommentVO> selectCommentList(int contentNum);
	void addWishList(WishListVO wishListVO);
	List<WishListListVO> wishListList(String userID);
	void deleteWishList(int chArr);
	void reservationOK(ReservationVO reservationVO);
	List<ReservationVO> myContentResList(String contentOwner);
	List<ReservationVO> myOrderList(String contentOwner);

	
	
}
