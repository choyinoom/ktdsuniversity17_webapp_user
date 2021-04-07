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
import com.ktdsuniversity.edu.board.vo.ImageVO;

@Service("boardService")
@Transactional(propagation = Propagation.REQUIRED)
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDAO boardDAO;

	public List<ArticleVO> listArticles() throws Exception {
		List<ArticleVO> articlesList = boardDAO.selectAllArticlesList();
		return articlesList;
	}

	// ���� �̹��� �߰��ϱ�
	@Override
	public int addNewArticle(Map articleMap) throws Exception {
		return boardDAO.insertNewArticle(articleMap);
	}

	// ���� �̹��� �߰��ϱ�
	/*
	 * @Override public int addNewArticle(Map articleMap) throws Exception{ int
	 * articleNO = boardDAO.insertNewArticle(articleMap);
	 * articleMap.put("articleNO", articleNO); boardDAO.insertNewImage(articleMap);
	 * return articleNO; }
	 */

	// ���� ���� ���̱�
	@Override
	public Map viewArticle(int articleNO) throws Exception {
		Map articleMap = new HashMap();
		ArticleVO articleVO = boardDAO.selectArticle(articleNO);
		if (articleVO.getImageFileName() != null) {
			List<ImageVO> imageFileList = boardDAO.selectImageFileList(articleNO);
			articleMap.put("imageFileList", imageFileList);
		}

		articleMap.put("article", articleVO);

		return articleMap;
	}

	/*
	 * //���� ���� ���̱�
	 * 
	 * @Override public ArticleVO viewArticle(int articleNO) throws Exception {
	 * ArticleVO articleVO = boardDAO.selectArticle(articleNO); return articleVO; }
	 */

	@Override
	public void modArticle(Map articleMap) throws Exception {
		boardDAO.updateArticle(articleMap);
	}

	@Override
	public void removeArticle(int articleNO) throws Exception {
		boardDAO.deleteArticle(articleNO);
	}

}
