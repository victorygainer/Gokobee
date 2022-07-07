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

// mapper ���ῡ ����ϴ� �������̽�
// 
public interface MybatisDAO {

// mapper�� ���Ǵ� interface�� �߻� �޼ҵ� ������ resultType id(parameterType)�� ���� �������� �����.
// MybatisDAO �������̽� �߻� �޼ҵ� �̸��� xml ������ sql ����� �ĺ��ϴ� id�� ���ǰ� �߻� �޼ҵ��� �μ��� ���޵� �����Ͱ� xml ������ 
// sql ������� ���޵ȴ�.
	
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
