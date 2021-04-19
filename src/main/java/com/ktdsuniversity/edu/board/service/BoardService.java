package com.ktdsuniversity.edu.board.service;

import java.util.List;
import java.util.Map;

import com.ktdsuniversity.edu.board.vo.ArticleVO;

public interface BoardService {
	public List<ArticleVO> listArticles(int pageNo) throws Exception;
//	public int addNewArticle(Map articleMap) throws Exception;
	//public ArticleVO viewArticle(int articleNO) throws Exception;
	public Map<String, Object> viewArticle(int articleId) throws Exception;
//	public void modArticle(Map articleMap) throws Exception;
//	public void removeArticle(int articleNO) throws Exception;
	public int findTotalPages() throws Exception;
	public int countAllNotices() throws Exception;
	public List<ArticleVO> listNoticesForWelcomepage() throws Exception;
	
}
