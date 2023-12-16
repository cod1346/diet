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
public class UserEatDTO {
	
	private int userCode;
	private String eatType;
	private String foodName;
	private int kcal;
	private String eatDate;
}


















