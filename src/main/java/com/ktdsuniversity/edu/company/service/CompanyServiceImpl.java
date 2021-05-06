package com.ktdsuniversity.edu.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ktdsuniversity.edu.company.vo.CompanyVO;
import com.ktdsuniversity.edu.common.paging.Criteria;
import com.ktdsuniversity.edu.company.dao.CompanyDAO;

@Service("companyService")
@Transactional(propagation = Propagation.REQUIRED)
public class CompanyServiceImpl implements CompanyService {

	@Autowired
	CompanyDAO companyDAO;

	@Override
	public List listBySearchCompanies(CompanyVO companyVO) throws DataAccessException {
		List companiesBySearchList = null;
		companiesBySearchList = companyDAO.selectBySearchCompaniesList(companyVO);
		return companiesBySearchList;
	}

	@Override
	public List listCompanies() throws DataAccessException {
		List companiesList = null;
		companiesList = companyDAO.selectAllCompanyList();
		return companiesList;
	}

	// 기준 나누는 메서드
	@Override
	public List listCriteria(Criteria criteria) throws DataAccessException {
		return companyDAO.listCriteria(criteria);
	}

	// 검색에 의해 나눠지는 메서드
	@Override
	public List listBySearchCompanies(String searchType, String searchText) throws DataAccessException {
		List membersBySearchList = null;
		membersBySearchList = companyDAO.selectBySearchCompanies(searchType, searchText);
		return membersBySearchList;
	}

	// 검색과 기준에 의해 리스트 나눠지는 메서드
	@Override
	public List listCriteriaBySearch(Criteria criteria) throws DataAccessException {
		List membersCriteriaBySearch = null;
		membersCriteriaBySearch = companyDAO.selectCriteriaBySearch(criteria);
		return membersCriteriaBySearch;
	}

}
