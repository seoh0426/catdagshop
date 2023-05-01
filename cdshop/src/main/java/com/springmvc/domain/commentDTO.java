package com.springmvc.domain;

public class commentDTO {
	private int num;			//댓글 번호
	private String board_type;	//게시판 종류
	private String name;		//댓글 작성자
	private int bnum;			//댓글을 단 게시글 번호
	private String comment;		//댓글 내용
	private String regist;		//댓글 작성시간
	private int parent_num;		//댓글의 부모번호
	private int depth;			//댓글 깊이
	private int order;			//댓글 순서
	
	@Override
	public String toString() {
		return "commentDTO [num="+num+", board_type="+board_type+", name="+name+", bnum="+bnum+", content="+comment+", regist="+regist+", depth="+depth+", order="+order+" ]";
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getBoard_type() {
		return board_type;
	}
	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getRegist() {
		return regist;
	}
	public void setRegist(String regist) {
		this.regist = regist;
	}
	
	public int getParent_num() {
		return parent_num;
	}
	public void setParent_num(int parent_num) {
		this.parent_num = parent_num;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getOrder() {
		return order;
	}
	public void setOrder(int order) {
		this.order = order;
	}
	
	
}