package com.hello.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hello.entity.User;
import com.hello.mapper.UserMapper;

@Transactional
@Service
public class UserService {
	@Autowired
	private UserMapper userMapper;

	public User getUserById(Integer id) {
		return userMapper.findById(id);
	}

	public List<User> getAllUser() {
		return userMapper.findAll();
	}

	public void save(User user) {
		userMapper.save(user);
	}

	public void update(User user) {
		userMapper.update(user);
	}

	public void delete(Integer id) {
		userMapper.delete(id);
	}
	
}
