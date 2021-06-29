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
	public Map<String,Object> getOrganizationChart(Map<String,Object> pmap) {
		return null;
	}
	//조직도 수정
	public void updateOrganizationChart(Map<String,Object> pmap) {
		
	}
	//사원정보 리스트조회
	public List<Map<String,Object>>  getEmployeeList(Map<String,Object> pmap)      {
		List<Map<String,Object>> boardList = null;
		boardList = humanResourceDao.getEmployeeList(pmap);
		return boardList;
		}
	//사원정보 상세조회
	public List<Map<String,Object>>  getDetailEmployee(Map<String,Object> pmap)          {
		List<Map<String,Object>> boardDetail = null;
		boardDetail = humanResourceDao.getEmployeeDetail(pmap);
		return boardDetail;}
	//사원정보 수정
	public void updateEmployee(Map<String,Object> pmap) {
		
	}
	//사원정보 추가
	public int insertEmployee(Map<String,Object> pmap)                            {
		int result = 0;
		result = humanResourceDao.insertEmployee(pmap);
		return result;
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
