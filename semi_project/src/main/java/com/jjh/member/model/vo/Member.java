package com.jjh.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	
	private String userId;
	private String password;
	private String phone;
	private String email;
	private char gender;
	private String nickName;
	private Date enrollDate;
	private String address;
	private int age;

}
