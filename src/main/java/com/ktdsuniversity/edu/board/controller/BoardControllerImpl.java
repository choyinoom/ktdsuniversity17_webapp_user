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
		mav.addObject("searchText", searchText);
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
		result.put("searchText", searchText);
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
