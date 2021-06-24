package com.srcelite.finalerp.web.mvc;

import java.util.List;
import java.util.Map;

public class HumanResourceLogic {
	HumanResourceDao humanResourceDao = null;

	public void setHumanResourceDao(HumanResourceDao humanResourceDao) {
		this.humanResourceDao = humanResourceDao;
	}
	//조직도 조회
	public Map<String,Object> getOrganizationChart(Map<String,Object> pmap)       {return null;}
	//조직도 수정
	public void updateOrganizationChart(Map<String,Object> pmap)                   {}
	//사원정보 리스트조회
	public List<Map<String,Object>>  getEmployeeList(Map<String,Object> pmap)      {return null;}
	//사원정보 상세조회
	public Map<String,Object>  getDetailEmployee(Map<String,Object> pmap)          {return null;}
	//사원정보 수정
	public void updateEmployee(Map<String,Object> pmap)                            {}
	//사원정보 추가
	public void insertEmployee(Map<String,Object> pmap)                            {}
}
