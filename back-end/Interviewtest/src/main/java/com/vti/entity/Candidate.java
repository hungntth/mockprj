package com.vti.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "`Candidate`", catalog = "MockProject")
public class Candidate implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private short id;
	
	private String fullName;
	
	private String phoneNumber;
	
	private short examSetID;
	
	private boolean status;
	
	private short creator;
	
	private Date createDate;
	
	
}
