package com.hello.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hello.entity.User;
import com.hello.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	@ModelAttribute
	public void getUserById(@RequestParam(value="id", required=false) Integer id, Model model){
		if(id!=null){
			User user = userService.getUserById(id);
			model.addAttribute("user", user);
		}
	}
	
	@RequestMapping("/userManage")
	public String userManage(){
		return "userManage";
	}
	
	/*	
	 * RESTful API
		User findById(int id); - GET /user/id
		List<User> findAll(); - GET /user
		void save(User user); - POST /user
		void update(User user); - PUT /user
		void delete(int id); - DELETE /user/id

	 */
	@ResponseBody
	@RequestMapping(value="/user/{id}", method=RequestMethod.GET)
	public User getUserById(@PathVariable Integer id){
		return userService.getUserById(id);
	}
	
	@ResponseBody
	@RequestMapping(value="/user", method=RequestMethod.GET)
	public List<User> getAllUser(){
		return userService.getAllUser();
	}
	
	@RequestMapping(value="/user", method=RequestMethod.POST)
	public void save(User user){
		userService.save(user);
	}
	
	@RequestMapping(value="/user", method=RequestMethod.PUT)
	public void update(@ModelAttribute("user") User user){
		userService.update(user);
	}
	
	@RequestMapping(value="/user/{id}", method=RequestMethod.DELETE)
	public void delete(@PathVariable Integer id){
		userService.delete(id);
	}
	
}
