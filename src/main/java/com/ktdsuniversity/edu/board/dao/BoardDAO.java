package com.ktdsuniversity.edu.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.ktdsuniversity.edu.board.vo.ArticleFileVO;
import com.ktdsuniversity.edu.board.vo.ArticleVO;


public interface BoardDAO {
	public List<ArticleVO> selectArticlesListBy(Map<String, Integer> map) throws DataAccessException;
	public List<ArticleFileVO> selectArticleFileList(int articleId) throws DataAccessException;
	public ArticleVO selectArticle(int articleId) throws DataAccessException;
	public int countAllNotices() throws DataAccessException;
	public List<ArticleVO> selectArticlesListForWelcomePage() throws DataAccessException;

	// public int insertNewArticle(Map articleMap) throws DataAccessException;
	// public void insertNewImage(Map articleMap) throws DataAccessException;
	// public void updateArticle(Map articleMap) throws DataAccessException;
	// public void deleteArticle(int articleNO) throws DataAccessException;
	

	
}
