package com.vti.DTO;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.Getter;

@Data
@Getter
public class AccountDTO {
	private short id;

	private String fullname;

	private String username;

	private String email;

	private String password;

	private String type;

	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date createDate;
	
	public enum Type {
	MANAGER, ADMIN;
}

	public AccountDTO(short id, String fullname, String username, String email, String password, String type, Date createDate) {
		this.id = id;
		this.fullname = fullname;
		this.username = username;
		this.email = email;
		this.password = password;
		this.type = type;
		this.createDate = createDate;
	}

	public AccountDTO() {
		super();
	}

}
