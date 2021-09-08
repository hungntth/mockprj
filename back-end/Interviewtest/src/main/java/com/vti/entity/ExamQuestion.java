package com.vti.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "`ExamQuestion`", catalog = "MockProject")
public class ExamQuestion implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private short id;
	
	private short questionID;
	
}
