package com.rid.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.rid.model.User;

public class UserServiceImpl  implements UserServiceI {

	static Map<Integer, User> map=new HashMap<Integer, User>();

	@Override
	public User add(User user) {
		System.out.println("add call");
		Integer id=this.map.size()+1;
		user.setId(id);
		this.map.put(id,user);
		return user;
	}
	
	@Override
	public User get(Integer id) {
		System.out.println("get call");
		return this.map.get(id);
	}

	@Override
	public User update(User user) {
		System.out.println("update call");
		this.map.put(user.getId(),user);
		return user;
	}

	@Override
	public User delete(User user) {
		System.out.println("delete call");
		this.map.remove(user.getId());
		return user;
	}

	@Override
	public List<User> search() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> list() {
		
		System.out.println(this.map.values());
		
		List l =new ArrayList<User>(this.map.values());
		return l;
	}

}
