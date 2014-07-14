package com.rid.model;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;

import org.json.JSONObject;

public class User {
	private int id;
	private String firstName;
	private String lastName;
	private String emailId;
	private String password;
	private String userName;
	
	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	

	public User() {
		super();
	}

	public User(JSONObject json) {

		try {
			BeanInfo info = Introspector.getBeanInfo(this.getClass());
			PropertyDescriptor[] props = info.getPropertyDescriptors();
			for (int i = 0; i < props.length; i++) {
				PropertyDescriptor prop = props[i];
				Method getter = prop.getReadMethod();
				Method setter = prop.getWriteMethod();
				Class param = getter.getReturnType();
				try {
					Object setVal = null;
					if (!json.isNull(prop.getName())) {
						if (param == int.class)
							setVal = json.getInt(prop.getName());
						else if (param == long.class)
							setVal = json.getLong(prop.getName());
						else if (param == String.class)
							setVal = json.getString(prop.getName());
						else if (param == boolean.class)
							setVal = json.getBoolean(prop.getName());
						else if (param == Double.class)
							setVal = json.getDouble(prop.getName());
						else
							continue;
						setter.invoke(this, new Object[] { setVal });
						System.out
								.println(getter.invoke(this, (Object[]) null));
					}
				} catch (Exception e) {
					
					e.printStackTrace();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public String toString() {
		StringBuffer buffer = new StringBuffer(this.getClass().getSimpleName()+"[");
		Method[] ms = this.getClass().getMethods();

		String mName = null;
		for (int i = 0; i < ms.length; i++) {
			mName = ms[i].getName();
			if (mName.startsWith("get")) {
				try {
					buffer.append("\n\t" + mName + " = "
							+ ms[i].invoke(this, (Object[]) null));
				} catch (Exception e) {
				}
			}

		}
		buffer.append("]");
		return buffer.toString();
	}
	

	

}
