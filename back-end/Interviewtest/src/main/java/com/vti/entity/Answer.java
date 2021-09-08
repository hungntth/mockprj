package com.vti.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "`Answer`", catalog = "MockProject")
public class Answer {
	private static final long serialVersionUID = 1L;
	
	private short id;
	
	private String content;
	
	private short questionID;
	
	private boolean isCorrect;
	
	private String creator;
	
	private Date createDate;
	
}
