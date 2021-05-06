package com.ktdsuniversity.edu.board.vo;


import java.util.List;

import org.springframework.stereotype.Component;

@Component("articleVO")
public class ArticleVO {
	private int id;
	private String title;
	private String joinDate;
	private String contents;
	private char file;
	private String important;
	private int hits;
	
	private List<ArticleFileVO> articleFiles;
	
	public ArticleVO() {
	
	}

	public ArticleVO(int id, String title, String joinDate, String contents, char file, String important, int hits, List<ArticleFileVO> articleFiles) {
		this.id = id;
		this.title = title;
		this.joinDate = joinDate;
		this.contents = contents;
		this.file = file;
		this.important = important;
		this.hits = hits;
		this.articleFiles = articleFiles;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public char getFile() {
		return file;
	}

	public void setFile(char file) {
		this.file = file;
	}

	public String getImportant() {
		return important;
	}

	public void setImportant(String important) {
		this.important = important;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public List<ArticleFileVO> getArticleFiles() {
		return articleFiles;
	}

	public void setArticleFileVO(List<ArticleFileVO> articleFiles) {
		System.out.println("prprprpprprprp");
		this.articleFiles = articleFiles;
	}
	
	
}
