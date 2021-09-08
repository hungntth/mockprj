package com.vti.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "`EESet`", catalog = "MockProject")
public class EESet implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private short id;
	
	private short examID;
}
