package com.ktdsuniversity.edu.company.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.ktdsuniversity.edu.common.paging.Criteria;
import com.ktdsuniversity.edu.company.vo.CompanyVO;

public interface CompanyService {

	public List listBySearchCompanies(CompanyVO companyVO) throws DataAccessException;

	public List listCompanies() throws DataAccessException;

	public List listCriteria(Criteria criteria) throws DataAccessException;

	public List listBySearchCompanies(String searchType, String searchText) throws DataAccessException;

	public List listCriteriaBySearch(Criteria criteria) throws DataAccessException;

}
