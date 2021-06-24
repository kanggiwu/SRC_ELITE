package com.srcelite.finalerp.web.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class ProjectHistoryController extends MultiActionController {
	ProjectHistoryLogic projectHistoryLogic = null;

	public void setProjectHistoryLogic(ProjectHistoryLogic projectHistoryLogic) {
		this.projectHistoryLogic = projectHistoryLogic;
	}
	//프로젝트이력관리 리스트 조회
	public ModelAndView getProjectHistoryList(HttpServletRequest request, HttpServletResponse response) 	{return null;}
	//프로젝트이력관리 상세 조회
	public ModelAndView getDetailProjectHistory(HttpServletRequest request, HttpServletResponse response) 	{return null;}
	// 프로젝트이력관리  추가
	public ModelAndView insertProjectHistory(HttpServletRequest request, HttpServletResponse response)      {return null;}

}
