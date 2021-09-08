package com.vti.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "`ExamSet`", catalog = "MockProject")
public class ExamSet implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private short id;
	
	private String name;
	
	private short Creator;
	
	private Date createDate;
	
	
}
