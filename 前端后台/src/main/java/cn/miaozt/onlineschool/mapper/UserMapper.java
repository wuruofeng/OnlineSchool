package cn.miaozt.onlineschool.mapper;

import java.util.List;

import cn.miaozt.onlineschool.model.User;

public interface UserMapper {
	
	List<User> getAll();
	
	User getOne(Long id);

	User getOneByUserName(String username);

	User login(String username,String password);

	void insert(User user);

	void update(User user);

	void delete(Long id);

}