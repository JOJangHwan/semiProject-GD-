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
	private int userNo; // 회원번호0
	private String userId; //회워 아이디0
	private String password; //회원 비밀번호0
	private String phone; //회원 전화번호0
	private String email; //회원 이메일0
	private char gender; //회원 성별 0
	private String nickName; //회원 닉네임0
	private Date enrollDate;//등록날짜0
	private String address; //회원 주소
	private int age; //회원 나이0

}
