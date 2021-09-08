package com.vti.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "`Point`", catalog = "MockProject")
public class Point implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private short id;
	
	private short candidateID;
	
	private short pointSQL;
	
	private short pointJAVA;
	
	private short pointIQ;
	
	private Date Date;
}
