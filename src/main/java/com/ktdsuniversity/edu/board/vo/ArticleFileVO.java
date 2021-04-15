package com.ktdsuniversity.edu.board.vo;

public class ArticleFileVO {

	private int id;
	private String name;
	private int artId;
	
	public ArticleFileVO() {
		
	}
	
	public ArticleFileVO(int id, String name, int artId) {
		this.id = id;
		this.name = name;
		this.artId = artId;
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public int getArtId() {
		return artId;
	}
	
	public void setArtId(int artId) {
		this.artId = artId;
	}
	

	
	
}
