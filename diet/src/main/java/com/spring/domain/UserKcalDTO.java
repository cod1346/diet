package com.spring.domain;


import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@AllArgsConstructor
@NoArgsConstructor
@Getter @Setter
public class UserKcalDTO {
	private List<UserEatDTO> eatList;
    private List<UserActiveDTO> activeList;
	
}


















