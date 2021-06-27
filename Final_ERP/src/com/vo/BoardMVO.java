package com.vo;

public class BoardMVO {
	private int    bm_no     =0;//  
	private String bm_writer ="";//  
	private String bm_title  ="";//  
	private String bm_content="";//  
	private String bm_email  ="";//  
	private int    bm_hit    =0;//  
	private String bm_date   ="";//  
	private int    bm_group  =0;//  
	private int    bm_pos    =0;//  
	private int    bm_step   =0;//  
	private String bm_pw     ="";//  
	private BoardSVO bsVO = null;
	private int    bs_seq =0;//  
	private String bs_file="";//  
	private double bs_size=0.0;//  	
	public int getBm_no() {
		return bm_no;
	}
	public void setBm_no(int bm_no) {
		this.bm_no = bm_no;
	}
	public String getBm_writer() {
		return bm_writer;
	}
	public void setBm_writer(String bm_writer) {
		this.bm_writer = bm_writer;
	}
	public String getBm_title() {
		return bm_title;
	}
	public void setBm_title(String bm_title) {
		this.bm_title = bm_title;
	}
	public String getBm_content() {
		return bm_content;
	}
	public void setBm_content(String bm_content) {
		this.bm_content = bm_content;
	}
	public String getBm_email() {
		return bm_email;
	}
	public void setBm_email(String bm_email) {
		this.bm_email = bm_email;
	}
	public int getBm_hit() {
		return bm_hit;
	}
	public void setBm_hit(int bm_hit) {
		this.bm_hit = bm_hit;
	}
	public String getBm_date() {
		return bm_date;
	}
	public void setBm_date(String bm_date) {
		this.bm_date = bm_date;
	}
	public int getBm_group() {
		return bm_group;
	}
	public void setBm_group(int bm_group) {
		this.bm_group = bm_group;
	}
	public int getBm_pos() {
		return bm_pos;
	}
	public void setBm_pos(int bm_pos) {
		this.bm_pos = bm_pos;
	}
	public int getBm_step() {
		return bm_step;
	}
	public void setBm_step(int bm_step) {
		this.bm_step = bm_step;
	}
	public String getBm_pw() {
		return bm_pw;
	}
	public void setBm_pw(String bm_pw) {
		this.bm_pw = bm_pw;
	}
	public BoardSVO getBsVO() {
		return bsVO;
	}
	public void setBsVO(BoardSVO bsVO) {
		this.bsVO = bsVO;
	}
	public int getBs_seq() {
		return bs_seq;
	}
	public void setBs_seq(int bs_seq) {
		this.bs_seq = bs_seq;
	}
	public String getBs_file() {
		return bs_file;
	}
	public void setBs_file(String bs_file) {
		this.bs_file = bs_file;
	}
	public double getBs_size() {
		return bs_size;
	}
	public void setBs_size(double bs_size) {
		this.bs_size = bs_size;
	}
}