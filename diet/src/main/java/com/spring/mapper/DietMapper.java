package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.FoodDTO;
import com.spring.domain.UserActiveDTO;
import com.spring.domain.UserDTO;
import com.spring.domain.UserEatDTO;

public interface DietMapper {
	public int getUserCode();
	public int insertUser(UserDTO dto);
	public int checkUser(UserDTO dto);
	public UserDTO getUser(int userCode);
	public List<FoodDTO> getFood();
	public int insertUserEat(UserEatDTO dto);
	public List<UserEatDTO> readEatDate(@Param("sdfDate00") String sdfDate00,@Param("sdfDate24")String sdfDate24,@Param("userCode")int userCode);
	public int addActivity(UserActiveDTO dto);
	public List<UserActiveDTO> readActiveDate(@Param("sdfDate00") String sdfDate00,@Param("sdfDate24")String sdfDate24,@Param("userCode")int userCode);
}
