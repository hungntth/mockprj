package com.vti.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "`Exam`", catalog = "MockProject")
public class Exam implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private short id;
	
	private String code;
	
	private short categoryID;
	
	private short creator;
	
	private Date createDate;
	
	
}
