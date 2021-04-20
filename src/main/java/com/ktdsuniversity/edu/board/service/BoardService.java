package com.ktdsuniversity.edu.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.ktdsuniversity.edu.board.vo.ArticleVO;
import com.ktdsuniversity.edu.board.vo.ArticleFileVO;

public interface BoardService {
	public List<ArticleVO> listArticles(int pageNo) throws Exception;
	public ArticleVO viewArticle(int articleId) throws Exception;
	public ArticleFileVO viewArticleFile(int articleId) throws DataAccessException;
	public int findTotalPages() throws Exception;
	public int countAllNotices() throws Exception;
	public List<ArticleVO> listBySearchArticles(int pageNo ,String searchText) throws DataAccessException;
	public int addHits(ArticleVO articleVO) throws DataAccessException;
	public List<ArticleVO> listNoticesForWelcomepage() throws Exception;

	
}
