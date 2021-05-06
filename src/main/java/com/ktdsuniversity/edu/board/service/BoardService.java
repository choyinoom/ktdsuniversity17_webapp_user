package com.ktdsuniversity.edu.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.ktdsuniversity.edu.board.vo.ArticleVO;
import com.ktdsuniversity.edu.board.vo.ArticleFileVO;

public interface BoardService {
	public List<ArticleVO> listArticles(int pageNo, int pagingSize) throws Exception;
	public ArticleVO viewArticle(int articleId) throws Exception;
	public ArticleFileVO viewArticleFile(int articleId) throws DataAccessException;
	public int countAllNotices() throws Exception;
	public List<ArticleVO> listArticlesBy(int pageNo ,int pagingSize, String searchText) throws DataAccessException;
	public int addHits(ArticleVO articleVO) throws DataAccessException;
	public int countNoticesBy(String searchText) throws Exception;

	
}
