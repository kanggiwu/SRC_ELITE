package com.vo;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class VOTest {

	public static void main(String[] args) {
		BoardMVO bmVO = new BoardMVO();
		BoardSVO bsVO = new BoardSVO();
		bsVO.setBs_file("avatar.png");
		bmVO.setBsVO(bsVO);
		BoardSVO bsVO2 = bmVO.getBsVO();
		String bs_file = bsVO2.getBs_file();
		System.out.println(bmVO.getBsVO().getBs_file());
		System.out.println(bs_file);
		Map<String,Object> rmap = new HashMap<>();
		rmap.put("mem_id", "test");
		rmap.put("mem_pw", "123");
		Object keys[] = rmap.keySet().toArray();
		Set set = rmap.keySet();
		keys = set.toArray();
		
	}

}