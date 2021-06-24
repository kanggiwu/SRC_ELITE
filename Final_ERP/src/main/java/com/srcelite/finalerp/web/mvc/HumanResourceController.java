package com.srcelite.finalerp.web.mvc;

import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class HumanResourceController extends MultiActionController {
	HumanResourceLogic humanResourceLogic = null;

	public void setHumanResourceLogic(HumanResourceLogic humanResourceLogic) {
		this.humanResourceLogic = humanResourceLogic;
	}
	
}
