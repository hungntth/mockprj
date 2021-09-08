package com.vti.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data

@Entity
@Table(name = "`Question`", catalog = "MockProject")
public class Question implements Serializable{
	private static final long  serialVersionUID = 1L;
	@Column(name = "QuestionID")
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private short id;
	
	@Column(name = "Content", length = 300, nullable = false, unique = false, updatable = true)
	private String content;
	
	private short creator;
	
	private Date createDate;
	
}
