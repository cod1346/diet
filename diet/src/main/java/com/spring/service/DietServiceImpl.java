package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.FoodDTO;
import com.spring.domain.UserActiveDTO;
import com.spring.domain.UserDTO;
import com.spring.domain.UserEatDTO;
import com.spring.mapper.DietMapper;

@Service
public class DietServiceImpl implements DietService {

	@Autowired
	private DietMapper mapper;

	@Override
	public int getUserCode() {
		return mapper.getUserCode();
	}

	@Override
	public boolean insertUser(UserDTO dto) {
		return mapper.insertUser(dto)==1?true:false;
	}

	@Override
	public int checkUser(UserDTO dto) {
		return mapper.checkUser(dto);
	}

	@Override
	public UserDTO getUser(int userCode) {
		return mapper.getUser(userCode);
	}

	@Override
	public List<FoodDTO> getFood() {
		return mapper.getFood();
	}

	@Override
	public boolean insertUserEat(UserEatDTO dto) {
		return mapper.insertUserEat(dto)==1?true:false;
	}

	@Override
	public List<UserEatDTO> readEatDate(String sdfDate00, String sdfDate24, int userCode) {
		return mapper.readEatDate(sdfDate00, sdfDate24,userCode);
	}

	@Override
	public boolean addActivity(UserActiveDTO dto) {
		return mapper.addActivity(dto)==1?true:false;
	}

	@Override
	public List<UserActiveDTO> readActiveDate(String sdfDate00, String sdfDate24, int userCode) {
		return mapper.readActiveDate(sdfDate00, sdfDate24, userCode);
	}

}
