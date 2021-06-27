package com.srcelite.finalerp.web.controller;

import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.srcelite.finalerp.web.logic.HumanResourceLogic;

public class HumanResourceController extends MultiActionController {
	HumanResourceLogic humanResourceLogic = null;

	public void setHumanResourceLogic(HumanResourceLogic humanResourceLogic) {
		this.humanResourceLogic = humanResourceLogic;
	}
	
}
