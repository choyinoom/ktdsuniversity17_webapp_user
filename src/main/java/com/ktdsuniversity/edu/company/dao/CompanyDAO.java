package com.ktdsuniversity.edu.company.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.ktdsuniversity.edu.common.paging.Criteria;
import com.ktdsuniversity.edu.company.vo.CompanyVO;

public interface CompanyDAO {

	public List selectBySearchCompaniesList(CompanyVO companyVO) throws DataAccessException;

	public List selectAllCompanyList() throws DataAccessException;

	public List selectBySearchCompanies(String searchType, String searchText) throws DataAccessException;

	public List<CompanyVO> listPaging(int page) throws DataAccessException;

	public List<CompanyVO> listCriteria(Criteria criteria) throws DataAccessException;

	public List selectCriteriaBySearch(Criteria criteria) throws DataAccessException;

}
