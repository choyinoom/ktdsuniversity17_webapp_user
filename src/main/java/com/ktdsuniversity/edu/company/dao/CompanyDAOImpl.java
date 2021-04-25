package com.ktdsuniversity.edu.company.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.company.vo.CompanyVO;
import com.ktdsuniversity.edu.common.paging.Criteria;
import com.ktdsuniversity.edu.member.vo.MemberVO;

@Repository("companyDAO")
public class CompanyDAOImpl implements CompanyDAO{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List selectBySearchCompaniesList(CompanyVO companyVO) throws DataAccessException {
		List<CompanyVO> companiesBySearchList = null;
		companiesBySearchList = sqlSession.selectList("mapper.company.selectBySearchCompaniesList", companyVO);
		return companiesBySearchList;
	}
	
	@Override
	public List selectAllCompanyList() throws DataAccessException {
		List<CompanyVO> companyList = null;
		companyList = sqlSession.selectList("mapper.company.selectAllCompaniesList");
		return companyList;
	}
	
	@Override
	public List selectBySearchCompanies(String searchType, String searchText) throws DataAccessException {
		List<MemberVO> completionBySearchList = null;
		Map<String, String> mapSearch = new HashMap<String, String>();
		mapSearch.put("searchType", searchType);
		mapSearch.put("searchText", searchText);
		completionBySearchList = sqlSession.selectList("mapper.company.selectBySearchCompaniesList", mapSearch);
		return completionBySearchList;
	}
	
	//페이징 리스트 뽑아오기 메서드
	@Override
	public List<CompanyVO> listPaging(int page) throws DataAccessException {
		if (page <= 0) {
			page = 1;
		}
		page = (page - 1) * 10;
		return sqlSession.selectList("mapper.company.selectCompletionByPaging", page);
	}
	
	// 페이지 기준 설정 메서드
	@Override
	public List<CompanyVO> listCriteria(Criteria criteria) throws DataAccessException {
		return sqlSession.selectList("mapper.company.listCriteria", criteria);
	}
	
	//criteria에 의해 리스트 나누는 메서드
	@Override
	public List selectCriteriaBySearch(Criteria criteria) throws DataAccessException {
		return sqlSession.selectList("mapper.company.selectCriteriaBySearchCompanyList", criteria);
	}
}
