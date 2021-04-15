package com.ktdsuniversity.edu.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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

	static final int PAGE_CHUNK = 10;
	
	public List<ArticleVO> listArticles(int pageNo) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", 1 + PAGE_CHUNK*(pageNo - 1));
		map.put("end", PAGE_CHUNK * pageNo);
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

	@Override
	public Map<String, Object> viewArticle(int articleId) throws Exception {
		Map<String, Object> articleMap = new HashMap<String, Object>();
		ArticleVO articleVO = boardDAO.selectArticle(articleId);
		articleMap.put("article", articleVO);
		return articleMap;
	}

	@Override
	public int findTotalPages() throws Exception {
		int totalNotices = boardDAO.countAllNotices();
		return (int)Math.ceil(totalNotices/(double)PAGE_CHUNK);
	}

	@Override
	public int countAllNotices() throws Exception {
		return boardDAO.countAllNotices();
	}
	
	/*
	 * //���� ���� ���̱�
	 * 
	 * @Override public ArticleVO viewArticle(int articleNO) throws Exception {
	 * ArticleVO articleVO = boardDAO.selectArticle(articleNO); return articleVO; }
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
