package com.spring.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@AllArgsConstructor
@NoArgsConstructor
@Getter @Setter
public class UserActiveDTO {
	
	private int userCode;
	private String type;
	private int slope;
	private int speed;
	private int time;
	private String activeDate;
	private int kcal;
}


















