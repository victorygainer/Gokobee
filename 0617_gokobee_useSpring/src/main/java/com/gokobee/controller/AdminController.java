package com.gokobee.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gokobee.controller.Constant;
import com.gokobee.dao.MybatisDAO;
import com.gokobee.utils.UploadFileUtils;
import com.gokobee.vo.ContentVO;
import com.gokobee.vo.ReservationVO;
import com.gokobee.vo.UserInfoVO;


@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
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
	
	@RequestMapping(value = "/admin/index")
	public String admin(Locale locale, Model model, UserInfoVO userInfoVO) {
		System.out.println("AdminController�� admin() �޼ҵ�");
		System.out.println(userInfoVO);
		model.addAttribute("userInfoVO", userInfoVO);
	return "/admin/index";
	}
	
	@RequestMapping(value = "/admin/contentList", method = RequestMethod.GET)
	public String contentList(HttpServletRequest request, Model model) {
		System.out.println("HomeController Ŭ������ contentList() �޼ҵ�");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		String userID = request.getParameter("userID");
		System.out.println(userID);			
		List<ContentVO> contentList = mapper.myContentList(userID);
		System.out.println(contentList);
		model.addAttribute("contentList",contentList);
	return "/admin/contentList";
	}
	
	@RequestMapping(value = "admin/content/view", method = RequestMethod.GET)
	public String getContentView(Model model, @RequestParam("n") int contentNum) {
		System.out.println("ContentController Ŭ������ getContentView() �޼ҵ�");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		//System.out.println(contentNum);
		ContentVO content = mapper.myContentView(contentNum);
		model.addAttribute("content", content);
		System.out.println(content);
	return "/admin/content/view";
	}
	
	@RequestMapping(value = "/admin/content/modify", method = RequestMethod.GET)
	public String contentModify(Locale locale, Model model, @RequestParam("n") int contentNum) {
		System.out.println("ContentController�� contentModify() �޼ҵ�");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		ContentVO content = mapper.myContentView(contentNum);
		model.addAttribute("content", content);
		return "/admin/content/modify";
	}
	
	// ������ ����
	@RequestMapping(value = "/admin/content/contentUpdate", method = RequestMethod.POST)
	public String contentUpdate(Locale locale, MultipartFile file, HttpServletRequest request, Model model, ContentVO contentVO) throws IOException, Exception {
		System.out.println("ContentController�� contentUpdate() �޼ҵ�");
		//System.out.println(file);
		//System.out.println(request);
		
		
		//���ο� ������ ��ϵǾ����� Ȯ��
		 if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
		  // ���� ������ ����
		  new File(uploadPath + request.getParameter("contentImg")).delete();
		  new File(uploadPath + request.getParameter("contentThumbImg")).delete();
		  
		  // ���� ÷���� ������ ���
		  String imgUploadPath = uploadPath + File.separator + "imgUpload";
		  String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		  String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		  
		  contentVO.setContentImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		  contentVO.setContentThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		  
		 } else {  // ���ο� ������ ��ϵ��� �ʾҴٸ�
		  // ���� �̹����� �״�� ���
		  contentVO.setContentImg(request.getParameter("contentImg"));
		  contentVO.setContentThumbImg(request.getParameter("contentThumbImg"));
		  
		 }
		 
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		mapper.contentUpdate(contentVO);
		return "redirect:/admin/index";
	}
	
	@RequestMapping(value = "admin/content/delete", method = RequestMethod.GET)
	public String contentDelete(Locale locale, Model model, @RequestParam("n") int contentNum) {
		System.out.println("AdminController�� contentDelete() �޼ҵ�");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		mapper.contentDelete(contentNum);
		return "redirect:/admin/index";
	}
	
	@ResponseBody
	@RequestMapping(value = "ckImgUpload", method =  {RequestMethod.GET, RequestMethod.POST})
	public String postCKEditorImgUpload(Model model, 
	        @RequestParam(value="upload", required = false) MultipartFile fileload,
	        HttpServletRequest request)  throws Exception {
		System.out.println("AdminController�� postCKEditorImgUpload �޼ҵ�");
		String ctx = request.getContextPath();
	    System.out.println("ctx: " + ctx);
		UUID uid = UUID.randomUUID();
		// �����̸�
		String filename = fileload.getOriginalFilename();
		
		request.setCharacterEncoding("utf-8");
		
		System.out.println("filename: " + filename);
		//���� ��� ����
	    String fuploadPath = uploadPath + "/ckUpload";
	    //System.out.println("fuploadPath: " + fuploadPath);
	    String newfilename = uid + "_" + filename;
	    //System.out.println(newfilename);
	    //���ε� ����	    
	    File file = new File(fuploadPath + "/" + newfilename);
	    System.out.println(fuploadPath + "/" + newfilename);
	    
	    try {
	        //���� ������ ���ε� �Ǵ� �κ�
	        FileUtils.writeByteArrayToFile(file, fileload.getBytes() );	        
	        return "{ \"uploaded\" : true, \"url\" : \"" + ctx + "/ckUpload/" + newfilename + "\" }";
	    } catch (IOException e) {
	        // TODO Auto-generated catch block
	    	return "{ \"uploaded\" : false, \"error\": { \"message\": \"���ε� �� ������ �߻��߽��ϴ�. �ٽ� �õ��� �ּ���.\" } }";
	    }
		
	}
		@RequestMapping(value = "/admin/myContentResList", method = RequestMethod.GET)
		public String myContentResList(HttpServletRequest request, Model model) {
			System.out.println("HomeController Ŭ������ myContentResList() �޼ҵ�");
			MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
			String contentOwner = request.getParameter("userID");
			//System.out.println(contentOwner);			
			List<ReservationVO> myContentResList = mapper.myContentResList(contentOwner);
			//System.out.println(myContentResList);
			model.addAttribute("myContentResList",myContentResList);
		return "/admin/reservation/myContentResList";
	}
		
		@RequestMapping(value = "/admin/myOrderList", method = RequestMethod.GET)
		public String myOrderList(HttpServletRequest request, Model model) {
			System.out.println("HomeController Ŭ������ myOrderList() �޼ҵ�");
			MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
			String contentOwner = request.getParameter("userID");
			System.out.println(contentOwner);			
			List<ReservationVO> myOrderList = mapper.myOrderList(contentOwner);
			System.out.println(myOrderList);
			model.addAttribute("myOrderList",myOrderList);
		return "/admin/reservation/myOrderList";
	}
}



