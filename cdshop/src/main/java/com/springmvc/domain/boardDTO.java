package com.springmvc.domain;

import java.util.Arrays;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class boardDTO {
	
	private int num;
	private int cbnum;
	private int qbnum;
	private String name;
	private String board_type;
	private String animal_type;
	private String title;
	private String content;
	private String regist_day;
	private int hit;
	private List<MultipartFile> fileimages;
	private String[] filenames;
	private String filename;	
	private String tagsrc;
	private String tagvalue;
	private String calregist;
	private int recom;
	private List<fileDTO> files;
	
	
	
	
	@Override
	public String toString() {
	return "boardDTO [num=" + num + ", cbnum=" + cbnum + ", qbnum=" + qbnum + ", name=" + name + ", board_type="
	+ board_type + ", animal_type=" + animal_type + ", title=" + title + ", content=" + content
	+ ", regist_day=" + regist_day + ", hit=" + hit + ", fileimages=" + fileimages + ", filenames="
	+ Arrays.toString(filenames) + ", filename=" + filename + ", tagsrc=" + tagsrc + ", tagvalue=" + tagvalue
	+ ", calregist=" + calregist + ", recom=" + recom + ", files=" + files + "]";
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	public int getCbnum() {
		return cbnum;
	}
	public void setCbnum(int cbnum) {
		this.cbnum = cbnum;
	}
	public int getQbnum() {
		return qbnum;
	}
	public void setQbnum(int qbnum) {
		this.qbnum = qbnum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getBoard_type() {
		return board_type;
	}
	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegist_day() {
		return regist_day;
	}
	public void setRegist_day(String regist_day) {
		this.regist_day = regist_day;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getAnimal_type() {
		return animal_type;
	}
	public void setAnimal_type(String animal_type) {
		this.animal_type = animal_type;
	}
	public List<MultipartFile> getFileimages() {
		return fileimages;
	}

	public void setFileimages(List<MultipartFile> fileimage) {
		this.fileimages = fileimage;
	}
	public String[] getFilenames() {
		return filenames;
	}
	public void setFilenames(String[] filenames) {
		this.filenames = filenames;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	public String getTagsrc() {
		return tagsrc;
	}
	public void setTagsrc(String tagsrc) {
		this.tagsrc = tagsrc;
	}
	public String getTagvalue() {
		return tagvalue;
	}
	public void setTagvalue(String tagvalue) {
		this.tagvalue = tagvalue;
	}
	public String getCalregist() {
		return calregist;
	}
	public void setCalregist(String calregist) {
		this.calregist = calregist;
	}
	
	
	public int getRecom() {
		return recom;
	}
	public void setRecom(int recom) {
		this.recom = recom;
	}

	public List<fileDTO> getFiles() {
		return files;
	}

	public void setFiles(List<fileDTO> files) {
		this.files = files;
	}

	

	
	
	
	
	
	
	
	
	
	
}