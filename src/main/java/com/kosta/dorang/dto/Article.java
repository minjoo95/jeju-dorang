package com.kosta.dorang.dto;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class Article {
  	private Integer id;
    private String title;
    private String content;

    public Article() {
    }

    public Article(Integer id, String title, String content) {
        this.id = id;
        this.title = title;
        this.content = content;
    }

    public Article(String title, String content) {
        this.title = title;
        this.content = content;
    }

	@Override
	public String toString() {
		return "Article [id=" + id + ", title=" + title + ", content=" + content + "]";
	}
    
    
}