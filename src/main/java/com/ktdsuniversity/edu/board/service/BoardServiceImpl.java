package com.ktdsuniversity.edu.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ktdsuniversity.edu.board.dao.BoardDAO;
import com.ktdsuniversity.edu.board.vo.ArticleVO;
import com.ktdsuniversity.edu.board.vo.ArticleFileVO;

@Service("boardService")
@Transactional(propagation = Propagation.REQUIRED)
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDAO boardDAO;
	
	public List<ArticleVO> listArticles(int pageNo, int pagingSize) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", 1 + pagingSize*(pageNo - 1));
		map.put("end", pagingSize * pageNo);
		List<ArticleVO> articlesList = boardDAO.selectArticlesListBy(map);
		return articlesList;
				
	}

	// ���� �̹��� �߰��ϱ�
//	@Override
//	public int addNewArticle(Map articleMap) throws Exception {
//		return boardDAO.insertNewArticle(articleMap);
//	}

	// ���� �̹��� �߰��ϱ�
	/*
	 * @Override public int addNewArticle(Map articleMap) throws Exception{ int
	 * articleNO = boardDAO.insertNewArticle(articleMap);
	 * articleMap.put("articleNO", articleNO); boardDAO.insertNewImage(articleMap);
	 * return articleNO; }
	 */

	
	// 공지사항 글 보기
	@Override
	public ArticleVO viewArticle(int articleId) throws Exception {
		return boardDAO.selectArticle(articleId);
	}
	
	// 공지사항 파일 선택 
	@Override
	public ArticleFileVO viewArticleFile(int articleId) throws DataAccessException {
		return boardDAO.selectArticleFile(articleId);
	}

	@Override
	public int countAllNotices() throws Exception {
		return boardDAO.countAllNotices();
	}
	
	// 제목 검색
	@Override
	public List<ArticleVO> listArticlesBy(int pageNo, int pagingSize, String searchText) throws DataAccessException {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", 1 + pagingSize*(pageNo - 1));
		map.put("end", pagingSize * pageNo);
		map.put("searchText", searchText);
		List<ArticleVO> articlesBySearchList = boardDAO.selectBySearchArticlesListBy(map);
		return articlesBySearchList;
	}
	
	@Override
	public int addHits(ArticleVO articleVO) throws DataAccessException {
		return boardDAO.addHits(articleVO);
	}

	@Override
	public int countNoticesBy(String searchText) throws Exception {
		return boardDAO.countNoticesBy(searchText);
	}

	/*
	 * //���� ���� ���̱�
	 * 
	 * 
	 */

//	@Override
//	public void modArticle(Map articleMap) throws Exception {
//		boardDAO.updateArticle(articleMap);
//	}
//
//	@Override
//	public void removeArticle(int articleNO) throws Exception {
//		boardDAO.deleteArticle(articleNO);
//	}

}
