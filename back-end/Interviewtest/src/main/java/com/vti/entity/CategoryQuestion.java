package com.vti.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@Getter
@Setter
@NoArgsConstructor
@ToString

@Entity
@Table(name = "`CategoryQuestion`", catalog = "MockProject")
public class CategoryQuestion implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Column(name = "CategoryID")
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private short id;
	
	@Column(name = "CategoryName", nullable = false, unique = true)
	@Enumerated
	private CategoryName name;
	
	public enum CategoryName{
		SQL, JAVA, IQ;
	}
	
}
