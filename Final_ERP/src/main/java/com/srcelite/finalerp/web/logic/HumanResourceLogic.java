package com.srcelite.finalerp.web.logic;

import java.util.List;
import java.util.Map;

import com.srcelite.finalerp.web.dao.HumanResourceDao;

public class HumanResourceLogic {
	HumanResourceDao humanResourceDao = null;

	public void setHumanResourceDao(HumanResourceDao humanResourceDao) {
		this.humanResourceDao = humanResourceDao;
	}
	//조직도 조회
	public List<Map<String,Object>> getOrganizationChart(Map<String,Object> pmap) {
		List<Map<String,Object>> getOrganizationChart = null;
		getOrganizationChart = humanResourceDao.getOrganizationChart(pmap);
		return getOrganizationChart;
	}
	//조직도 수정
	public int updateOrganizationChart(Map<String,Object> pmap) {
		int result = 0;
		try {
			result = humanResourceDao.updateOrganizationChart(pmap);
			return result;
		} catch (Exception e) {
			throw e;
		}
	}
	//사원정보 리스트조회
	public List<Map<String,Object>>  getEmployeeList(Map<String,Object> pmap) {
		List<Map<String,Object>> boardList = null;
		boardList = humanResourceDao.getEmployeeList(pmap);
		return boardList;
		}
	//사원정보 상세조회
	public List<Map<String,Object>>  getDetailEmployee(Map<String,Object> pmap) {
		List<Map<String,Object>> boardDetail = null;
		boardDetail = humanResourceDao.getEmployeeDetail(pmap);
		return boardDetail;
		}
	//사원정보 수정
	public int updateEmployee(Map<String,Object> pmap) {
		int result = 0;
		try {
			result = humanResourceDao.updateEmployee(pmap);
			return result;
		} catch (Exception e) {
			throw e;
		}
	}
	//사원정보 추가
	public int insertEmployee(Map<String,Object> pmap) {
		int result = 0;
		try {
			result = humanResourceDao.insertEmployee(pmap);
			return result;
		} catch (Exception e) {
			throw e;
		}
	}
	public List<Map<String, Object>> getEmpLicenceList(Map<String, Object> pmap) {
		List<Map<String,Object>> licenceList = null;
		licenceList = humanResourceDao.getEmpLicenceList(pmap);
		return licenceList;
	}
	public List<Map<String, Object>> getEmpSearchList(Map<String, Object> pmap) {
		List<Map<String,Object>> boardList = null;
		boardList = humanResourceDao.getEmpSearchList(pmap);
		return boardList;
	}

}
