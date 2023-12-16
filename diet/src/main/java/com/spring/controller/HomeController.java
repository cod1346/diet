package com.spring.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.spring.domain.FoodDTO;
import com.spring.domain.UserActiveDTO;
import com.spring.domain.UserDTO;
import com.spring.domain.UserEatDTO;
import com.spring.domain.UserKcalDTO;
import com.spring.service.DietService;

import lombok.extern.slf4j.Slf4j;

@Controller @Slf4j
public class HomeController {
	
		@Autowired
		private DietService service;
		
		@GetMapping("/")
		public String home() {
			log.info("home요청");
			return "home";
		}
		@PostMapping("/test")
		public String test(UserDTO dto,Model model) {
			List<FoodDTO> list = service.getFood();
			System.out.println(dto);
			log.info("test요청");
			UserDTO dto1 = service.getUser(dto.getUserCode());
			model.addAttribute("dto",dto1);
			model.addAttribute("list",list);
			return "test";
		}
		@GetMapping("/register")
		public String register() {
			log.info("register요청");
			return "register";
		}
		@GetMapping("/getCode")
		public ResponseEntity<Integer> getCode(){
			int userCode = service.getUserCode();
			return new ResponseEntity<>(userCode,HttpStatus.OK);
		}
		@PostMapping("/register")
		public String registerPost(UserDTO dto) {
			System.out.println(dto);
			service.insertUser(dto);
			return "redirect:/"; 
		}
		@PostMapping("/checkUser")
		public ResponseEntity<String> checkUser(@RequestBody UserDTO dto){
			System.out.println(dto);
			if(service.checkUser(dto)==1) {
				return new ResponseEntity<>(HttpStatus.OK);
			}else {
				return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
		}
		@PostMapping("/addEat")
		public ResponseEntity<String> addEat(@RequestBody UserEatDTO dto){
			System.out.println(dto);
			String dateString = dto.getEatDate();

			String cleanedDate = dateString.replaceAll("[^0-9]", "");
			System.out.println(cleanedDate);
			dto.setEatDate(cleanedDate);
			service.insertUserEat(dto);
			return new ResponseEntity<String>(HttpStatus.OK);
		}
		@GetMapping("/readEatDate")
		public ResponseEntity<UserKcalDTO> readEatDate(@Param("eatDate") String eatDate,@Param("userCode") int userCode){
			eatDate = eatDate.replaceAll("[^0-9]", "");
			String sdfDate00 = eatDate+"-00";
			String sdfDate24 = eatDate+"-23";
			List<UserEatDTO> eatList = service.readEatDate(sdfDate00, sdfDate24,userCode);
			List<UserActiveDTO> actList=service.readActiveDate(sdfDate00, sdfDate24, userCode);
			UserKcalDTO list = new UserKcalDTO();
			list.setActiveList(actList);
			list.setEatList(eatList);

			System.out.println(list);
			return new ResponseEntity<>(list,HttpStatus.OK);
			
		}
		@GetMapping("/getMonthCal")
		public ResponseEntity<UserKcalDTO> getMonthCal(@Param("month") String month,@Param("lastDay") String lastDay,@Param("userCode")int userCode){
			String sdfDate00 = month+"01-00";
			String sdfDate24 = month+lastDay+"-23";
			List<UserEatDTO> eatList=service.readEatDate(sdfDate00, sdfDate24,userCode);
			List<UserActiveDTO> actList=service.readActiveDate(sdfDate00, sdfDate24, userCode);
			UserKcalDTO list = new UserKcalDTO();
			list.setActiveList(actList);
			list.setEatList(eatList);
			System.out.println(actList);
			return new ResponseEntity<>(list,HttpStatus.OK);
		}
		@PostMapping("/addActive")
		public ResponseEntity<String> addActive(@RequestBody UserActiveDTO dto){
			System.out.println("dto : "+dto);
			String dateString = dto.getActiveDate();
			String cleanedDate = dateString.replaceAll("[^0-9]", "");
			System.out.println(cleanedDate);
			dto.setActiveDate(cleanedDate);
			service.addActivity(dto);
			return new ResponseEntity<String>(HttpStatus.OK);
		}
		
}
