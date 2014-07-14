package com.rid.ctrl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.rid.model.User;
import com.rid.service.UserServiceI;
import com.rid.service.UserServiceImpl;

/**
 * Servlet implementation class UserCtrl
 */
@WebServlet("/users/*")
public class UserCtrl extends HttpServlet {
	private UserServiceI service = null;
	
	@Override
	public void init() throws ServletException {
		this.service = new UserServiceImpl();
	}

    // path {users/:id or users} method {Get}
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		String pathInfo = httpRequest.getPathInfo();
		String path = request.getPathInfo();

		Object data = null;
		//path users/:id
		if (path != null) {
			Integer id = getUserId(path);
			data = new JSONObject(service.get(id));
		}
        //path users
		if (path == null) {
			List list = service.list();
			data = new JSONArray(list);
		}
		PrintWriter writer = response.getWriter();
		response.setContentType("application/json");
		writer.write(data.toString());
		writer.close();

	}

	// path {users/:id or users} method {Post}
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		String pathInfo = httpRequest.getPathInfo();
		String path = request.getPathInfo();

		StringBuffer jb = new StringBuffer();
		String line = null;
		try {
			BufferedReader reader = request.getReader();
			while ((line = reader.readLine()) != null)
				jb.append(line);
			JSONObject jsonObject = new JSONObject(jb.toString());
			User user = new User(jsonObject);

			if (path != null) {
				Integer id = getUserId(path);
				service.update(user);
			}
			if (path == null) {
				if (user.getId() > 0)
					user = service.update(user);
				else
					user = service.add(user);
		    }
		} catch (Exception e) { /* report an error */
		}
	}
	// path {users/:id} method {Delete}
	@Override
	protected void doDelete(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String path = request.getPathInfo();
		Object data = null;
		if (path != null) {
			Integer id = getUserId(path);
			User user = new User();
			user.setId(id);
			data = new JSONObject(service.delete(user));
		}
		PrintWriter writer = response.getWriter();
		response.setContentType("application/json");
		writer.write(data.toString());
		writer.close();
	}
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		super.doPut(req, resp);
	}
	public Integer getUserId(String path) {
		try {
			String[] urldata = path.split("/");
			
			return Integer.parseInt(urldata[1]);
		} catch (Exception e) {
		}
		return 0;
	}

	
}
