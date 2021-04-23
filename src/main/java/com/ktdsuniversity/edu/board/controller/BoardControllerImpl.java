package com.ktdsuniversity.edu.board.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ktdsuniversity.edu.board.service.BoardService;
import com.ktdsuniversity.edu.board.vo.ArticleVO;
import com.ktdsuniversity.edu.board.vo.ArticleFileVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

@Controller("boardController")
public class BoardControllerImpl implements BoardController {
	private static final String ARTICLE_IMAGE_REPO = "D:\\board\\article_image";
	@Autowired
	private BoardService boardService;
	@Autowired
	private ArticleVO articleVO;

	/* 공지사항 글을 불러오는 메서드 */
	@Override
	@RequestMapping(value = "/customer/listNotices.do", method = RequestMethod.GET)
	public ModelAndView listArticles(@RequestParam("pageNo") int pageNo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String) request.getAttribute("viewName");
		String pagingSize = (String) request.getAttribute("pagingSize");
		String searchText = (String) request.getParameter("searchText");
		
		if (pagingSize == null)
			pagingSize = "10";
		List<ArticleVO> articlesList = null;
		int noticesCnt = 0;
		if (searchText != null) {
			articlesList = boardService.listArticlesBy(pageNo, Integer.parseInt(pagingSize), searchText);
			noticesCnt = boardService.countNoticesBy(searchText);
		} else {
			articlesList = boardService.listArticles(pageNo, Integer.parseInt(pagingSize));
			noticesCnt = boardService.countAllNotices();
		}
			
		ModelAndView mav = new ModelAndView(viewName);		
		mav.addObject("articlesList", articlesList);
		mav.addObject("noticesCnt", noticesCnt);
		mav.addObject("pageNo", pageNo);
		return mav;
			
		}
		

	/* 공지사항 페이지네이션을 위한 ajax */
	@RequestMapping(value="/ajax/customer/listNotices", method= RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getArticles(@RequestParam("pageNo") int pageNo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String searchText = (String) request.getParameter("searchText");
		int pagingSize = Integer.parseInt(request.getParameter("pagingSize"));
		Map<String, Object> result = new HashMap<String, Object>();
		List<ArticleVO> articlesList = null;
		int noticesCnt = 0;	
		if (searchText.length() != 0) {
			articlesList = boardService.listArticlesBy(pageNo, pagingSize, searchText);
			noticesCnt = boardService.countNoticesBy(searchText);
		} else {
			articlesList = boardService.listArticles(pageNo, pagingSize);
			noticesCnt = boardService.countAllNotices();
		}
		result.put("articlesList", articlesList);
		result.put("noticesCnt", noticesCnt);
		result.put("pageNo", pageNo);
		return result;
	}
	
	/* 공지사항 상세내용을 보여주기 위한 메서드*/
	@Override
	@RequestMapping(value = "/customer/viewNotice.do", method = RequestMethod.GET)
	public ModelAndView viewArticle(@RequestParam("articleId") int articleId, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		ArticleVO vo = boardService.viewArticle(articleId);
		boardService.addHits(vo);
		ArticleFileVO filevo = boardService.viewArticleFile(articleId);
		mav.addObject("articleId",articleId);
		mav.addObject("vo", vo);
		mav.addObject("filevo", filevo);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/customer/faq.do")
	public String viewFaq(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/customer/faq";
	}
	
	// �븳 媛� �씠誘몄� 湲��벐湲�
//	@Override
//	@RequestMapping(value = "/board/addNewArticle.do", method = RequestMethod.POST)
//	@ResponseBody
//	public ResponseEntity addNewArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
//			throws Exception {
//		multipartRequest.setCharacterEncoding("utf-8");
//		Map<String, Object> articleMap = new HashMap<String, Object>();
//		Enumeration enu = multipartRequest.getParameterNames();
//		while (enu.hasMoreElements()) {
//			String name = (String) enu.nextElement();
//			String value = multipartRequest.getParameter(name);
//			articleMap.put(name, value);
//		}
//
//		String imageFileName = upload(multipartRequest);
//		HttpSession session = multipartRequest.getSession();
//		MemberVO memberVO = (MemberVO) session.getAttribute("member");
//		String id = memberVO.getId();
//		articleMap.put("parentNO", 0);
//		articleMap.put("id", id);
//		articleMap.put("imageFileName", imageFileName);
//
//		String message;
//		ResponseEntity resEnt = null;
//		HttpHeaders responseHeaders = new HttpHeaders();
//		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
//		try {
//			int articleNO = boardService.addNewArticle(articleMap);
//			if (imageFileName != null && imageFileName.length() != 0) {
//				File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
//				File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + articleNO);
//				FileUtils.moveFileToDirectory(srcFile, destDir, true);
//			}
//
//			message = "<script>";
//			message += " alert('�깉湲��쓣 異붽��뻽�뒿�땲�떎.');";
//			message += " location.href='" + multipartRequest.getContextPath() + "/board/listArticles.do'; ";
//			message += " </script>";
//			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
//		} catch (Exception e) {
//			File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
//			srcFile.delete();
//
//			message = " <script>";
//			message += " alert('�삤瑜섍� 諛쒖깮�뻽�뒿�땲�떎. �떎�떆 �떆�룄�빐 二쇱꽭�슂');');";
//			message += " location.href='" + multipartRequest.getContextPath() + "/board/articleForm.do'; ";
//			message += " </script>";
//			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
//			e.printStackTrace();
//		}
//		return resEnt;
//	}



	/*
	 * //�떎以� �씠誘몄� 蹂댁뿬二쇨린
	 * 
	 * @RequestMapping(value="/board/viewArticle.do" ,method = RequestMethod.GET)
	 * public ModelAndView viewArticle(@RequestParam("articleNO") int articleNO,
	 * HttpServletRequest request, HttpServletResponse response) throws Exception{
	 * String viewName = (String)request.getAttribute("viewName"); Map
	 * articleMap=boardService.viewArticle(articleNO); ModelAndView mav = new
	 * ModelAndView(); mav.setViewName(viewName); mav.addObject("articleMap",
	 * articleMap); return mav; }
	 */

	// �븳 媛� �씠誘몄� �닔�젙 湲곕뒫
//	@RequestMapping(value = "/board/modArticle.do", method = RequestMethod.POST)
//	@ResponseBody
//	public ResponseEntity modArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
//			throws Exception {
//		multipartRequest.setCharacterEncoding("utf-8");
//		Map<String, Object> articleMap = new HashMap<String, Object>();
//		Enumeration enu = multipartRequest.getParameterNames();
//		while (enu.hasMoreElements()) {
//			String name = (String) enu.nextElement();
//			String value = multipartRequest.getParameter(name);
//			articleMap.put(name, value);
//		}
//
//		String imageFileName = upload(multipartRequest);
//		HttpSession session = multipartRequest.getSession();
//		MemberVO memberVO = (MemberVO) session.getAttribute("member");
//		String id = memberVO.getId();
//		articleMap.put("id", id);
//		articleMap.put("imageFileName", imageFileName);
//
//		String articleNO = (String) articleMap.get("articleNO");
//		String message;
//		ResponseEntity resEnt = null;
//		HttpHeaders responseHeaders = new HttpHeaders();
//		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
//		try {
//			boardService.modArticle(articleMap);
//			if (imageFileName != null && imageFileName.length() != 0) {
//				File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
//				File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + articleNO);
//				FileUtils.moveFileToDirectory(srcFile, destDir, true);
//
//				String originalFileName = (String) articleMap.get("originalFileName");
//				File oldFile = new File(ARTICLE_IMAGE_REPO + "\\" + articleNO + "\\" + originalFileName);
//				oldFile.delete();
//			}
//			message = "<script>";
//			message += " alert('湲��쓣 �닔�젙�뻽�뒿�땲�떎.');";
//			message += " location.href='" + multipartRequest.getContextPath() + "/board/viewArticle.do?articleNO="
//					+ articleNO + "';";
//			message += " </script>";
//			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
//		} catch (Exception e) {
//			File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
//			srcFile.delete();
//			message = "<script>";
//			message += " alert('�삤瑜섍� 諛쒖깮�뻽�뒿�땲�떎.�떎�떆 �닔�젙�빐二쇱꽭�슂');";
//			message += " location.href='" + multipartRequest.getContextPath() + "/board/viewArticle.do?articleNO="
//					+ articleNO + "';";
//			message += " </script>";
//			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
//		}
//		return resEnt;
//	}

//	@Override
//	@RequestMapping(value = "/board/removeArticle.do", method = RequestMethod.POST)
//	@ResponseBody
//	public ResponseEntity removeArticle(@RequestParam("articleNO") int articleNO, HttpServletRequest request,
//			HttpServletResponse response) throws Exception {
//		response.setContentType("text/html; charset=UTF-8");
//		String message;
//		ResponseEntity resEnt = null;
//		HttpHeaders responseHeaders = new HttpHeaders();
//		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
//		try {
//			boardService.removeArticle(articleNO);
//			File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + articleNO);
//			FileUtils.deleteDirectory(destDir);
//
//			message = "<script>";
//			message += " alert('湲��쓣 �궘�젣�뻽�뒿�땲�떎.');";
//			message += " location.href='" + request.getContextPath() + "/board/listArticles.do';";
//			message += " </script>";
//			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
//
//		} catch (Exception e) {
//			message = "<script>";
//			message += " alert('�옉�뾽以� �삤瑜섍� 諛쒖깮�뻽�뒿�땲�떎.�떎�떆 �떆�룄�빐 二쇱꽭�슂.');";
//			message += " location.href='" + request.getContextPath() + "/board/listArticles.do';";
//			message += " </script>";
//			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
//			e.printStackTrace();
//		}
//		return resEnt;
//	}

	/*
	 * //�떎以� �씠誘몄� 湲� 異붽��븯湲�
	 * 
	 * @Override
	 * 
	 * @RequestMapping(value="/board/addNewArticle.do" ,method = RequestMethod.POST)
	 * 
	 * @ResponseBody public ResponseEntity addNewArticle(MultipartHttpServletRequest
	 * multipartRequest, HttpServletResponse response) throws Exception {
	 * multipartRequest.setCharacterEncoding("utf-8"); String imageFileName=null;
	 * 
	 * Map articleMap = new HashMap(); Enumeration
	 * enu=multipartRequest.getParameterNames(); while(enu.hasMoreElements()){
	 * String name=(String)enu.nextElement(); String
	 * value=multipartRequest.getParameter(name); articleMap.put(name,value); }
	 * 
	 * //濡쒓렇�씤 �떆 �꽭�뀡�뿉 ���옣�맂 �쉶�썝 �젙蹂댁뿉�꽌 湲��벖�씠 �븘�씠�뵒瑜� �뼸�뼱���꽌 Map�뿉 ���옣�빀�땲�떎. HttpSession session =
	 * multipartRequest.getSession(); MemberVO memberVO = (MemberVO)
	 * session.getAttribute("member"); String id = memberVO.getId();
	 * articleMap.put("id",id);
	 * 
	 * 
	 * List<String> fileList =upload(multipartRequest); List<ImageVO> imageFileList
	 * = new ArrayList<ImageVO>(); if(fileList!= null && fileList.size()!=0) {
	 * for(String fileName : fileList) { ImageVO imageVO = new ImageVO();
	 * imageVO.setImageFileName(fileName); imageFileList.add(imageVO); }
	 * articleMap.put("imageFileList", imageFileList); } String message;
	 * ResponseEntity resEnt=null; HttpHeaders responseHeaders = new HttpHeaders();
	 * responseHeaders.add("Content-Type", "text/html; charset=utf-8"); try { int
	 * articleNO = boardService.addNewArticle(articleMap); if(imageFileList!=null &&
	 * imageFileList.size()!=0) { for(ImageVO imageVO:imageFileList) { imageFileName
	 * = imageVO.getImageFileName(); File srcFile = new
	 * File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName); File destDir = new
	 * File(ARTICLE_IMAGE_REPO+"\\"+articleNO); //destDir.mkdirs();
	 * FileUtils.moveFileToDirectory(srcFile, destDir,true); } }
	 * 
	 * message = "<script>"; message += " alert('�깉湲��쓣 異붽��뻽�뒿�땲�떎.');"; message +=
	 * " location.href='"+multipartRequest.getContextPath()
	 * +"/board/listArticles.do'; "; message +=" </script>"; resEnt = new
	 * ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	 * 
	 * 
	 * }catch(Exception e) { if(imageFileList!=null && imageFileList.size()!=0) {
	 * for(ImageVO imageVO:imageFileList) { imageFileName =
	 * imageVO.getImageFileName(); File srcFile = new
	 * File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName); srcFile.delete(); }
	 * }
	 * 
	 * 
	 * message = " <script>"; message +=" alert('�삤瑜섍� 諛쒖깮�뻽�뒿�땲�떎. �떎�떆 �떆�룄�빐 二쇱꽭�슂');');";
	 * message +=" location.href='"+multipartRequest.getContextPath()
	 * +"/board/articleForm.do'; "; message +=" </script>"; resEnt = new
	 * ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	 * e.printStackTrace(); } return resEnt; }
	 * 
	 */

//	@RequestMapping(value = "/board/*Form.do", method = RequestMethod.GET)
//	private ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		String viewName = (String) request.getAttribute("viewName");
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName(viewName);
//		return mav;
//	}

	// �븳媛� �씠誘몄� �뾽濡쒕뱶�븯湲�
//	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception {
//		String imageFileName = null;
//		Iterator<String> fileNames = multipartRequest.getFileNames();
//
//		while (fileNames.hasNext()) {
//			String fileName = fileNames.next();
//			MultipartFile mFile = multipartRequest.getFile(fileName);
//			imageFileName = mFile.getOriginalFilename();
//			File file = new File(ARTICLE_IMAGE_REPO + "\\" + fileName);
//			if (mFile.getSize() != 0) { // File Null Check
//				if (!file.exists()) { // 寃쎈줈�긽�뿉 �뙆�씪�씠 議댁옱�븯吏� �븡�쓣 寃쎌슦
//					if (file.getParentFile().mkdirs()) { // 寃쎈줈�뿉 �빐�떦�븯�뒗 �뵒�젆�넗由щ뱾�쓣 �깮�꽦
//						file.createNewFile(); // �씠�썑 �뙆�씪 �깮�꽦
//					}
//				}
//				mFile.transferTo(new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName)); // �엫�떆濡� ���옣�맂
//																										// multipartFile�쓣
//																										// �떎�젣 �뙆�씪濡� �쟾�넚
//			}
//		}
//		return imageFileName;
//	}
	
	/* FAQ 페이지 */
	@RequestMapping(value = { "customer/faq.do" }, method = RequestMethod.GET)
	private String main(HttpServletRequest request, HttpServletResponse response) {

		return "/customer/faq";

	}
	
	@RequestMapping(value = { "customer/faqMember.do" }, method = RequestMethod.GET)
	private String faqMember(HttpServletRequest request, HttpServletResponse response) {

		return "/customer/faqMember";

	}
	
	@RequestMapping(value = { "customer/faqCourse.do" }, method = RequestMethod.GET)
	private String faqCourse(HttpServletRequest request, HttpServletResponse response) {

		return "/customer/faqCourse";

	}
	
	@RequestMapping(value = { "customer/faqEdu.do" }, method = RequestMethod.GET)
	private String faqEdu(HttpServletRequest request, HttpServletResponse response) {

		return "/customer/faqEdu";

	}
	
	@RequestMapping(value = { "customer/faqSuryo.do" }, method = RequestMethod.GET)
	private String faqSuryo(HttpServletRequest request, HttpServletResponse response) {

		return "/customer/faqSuryo";

	}
	
	@RequestMapping(value = { "customer/faqElse.do" }, method = RequestMethod.GET)
	private String faqElse(HttpServletRequest request, HttpServletResponse response) {

		return "/customer/faqElse";

	}



	
	
}
