/**
 * 
 */
package com.rid.service;

import java.util.List;

import com.rid.model.User;


/**
 * @author Riddhima
 *
 */

public interface UserServiceI {
	public User add(User base);
	public User get(Integer id);
	public User update(User user);
	public User delete(User user);
	public List<User> search();
	public List<User> list();
	
}
