package com.ktdsuniversity.edu.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.board.vo.ArticleVO;
import com.ktdsuniversity.edu.board.vo.ArticleFileVO;


@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ArticleVO> selectArticlesListBy(Map<String, Integer> map) throws DataAccessException{
		List<ArticleVO> articlesList = sqlSession.selectList("mapper.board.selectArticlesListByPage", map);
		return articlesList;
	}

	@Override
	public int countAllNotices() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectAllArticlesCount");
	}
	
	@Override
	public ArticleVO selectArticle(int articleId) throws DataAccessException {
		ArticleVO vo = sqlSession.selectOne("mapper.board.selectArticle", articleId);
		return vo;
	}
	
	@Override
	public List<ArticleFileVO> selectArticleFileList(int articleId) throws DataAccessException {
		List<ArticleFileVO> fileList = null;
		fileList = sqlSession.selectList("mapper.board.selectFilesList", articleId);
		return fileList;
	}

	@Override
	public List<ArticleVO> selectArticlesListForWelcomePage() throws DataAccessException {
		List<ArticleVO> articlesList = sqlSession.selectList("mapper.board.selectArticlesListForWelcomePage");
		return articlesList;
	}
	
//	@Override
//	public int insertNewArticle(Map articleMap) throws DataAccessException {
//		int articleNO = selectNewArticleNO();
//		articleMap.put("articleID", articleID);
//		sqlSession.insert("mapper.board.insertNewArticle",articleMap);
//		return articleNO;
//	}
    
	//���� ���� ���ε�
	/*
	@Override
	public void insertNewImage(Map articleMap) throws DataAccessException {
		List<ImageVO> imageFileList = (ArrayList)articleMap.get("imageFileList");
		int articleNO = (Integer)articleMap.get("articleNO");
		int imageFileNO = selectNewImageFileNO();
		for(ImageVO imageVO : imageFileList){
			imageVO.setImageFileNO(++imageFileNO);
			imageVO.setArticleNO(articleNO);
		}
		sqlSession.insert("mapper.board.insertNewImage",imageFileList);
	}
	
   */
	


//	@Override
//	public void updateArticle(Map articleMap) throws DataAccessException {
//		sqlSession.update("mapper.board.updateArticle", articleMap);
//	}
//
//	@Override
//	public void deleteArticle(int articleNO) throws DataAccessException {
//		sqlSession.delete("mapper.board.deleteArticle", articleNO);
//		
//	}
	
	





//	private int selectNewArticleNO() throws DataAccessException {
//		return sqlSession.selectOne("mapper.board.selectNewArticleNO");
//	}
//	
//	private int selectNewImageFileNO() throws DataAccessException {
//		return sqlSession.selectOne("mapper.board.selectNewImageFileNO");
//	}

}
