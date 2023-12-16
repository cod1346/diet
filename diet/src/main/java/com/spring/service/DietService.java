package com.spring.service;

import java.util.List;


import com.spring.domain.FoodDTO;
import com.spring.domain.UserActiveDTO;
import com.spring.domain.UserDTO;
import com.spring.domain.UserEatDTO;

public interface DietService {
	public int getUserCode();
	public boolean insertUser(UserDTO dto);
	public int checkUser(UserDTO dto);
	public UserDTO getUser(int userCode);
	public List<FoodDTO> getFood();
	public boolean insertUserEat(UserEatDTO dto);
	public List<UserEatDTO> readEatDate(String sdfDate00,String sdfDate24,int userCode);
	public boolean addActivity(UserActiveDTO dto);
	public List<UserActiveDTO> readActiveDate(String sdfDate00,String sdfDate24,int userCode);
}
