package edu.nk.pker.biz.impl;

import java.util.List;

import edu.nk.pker.biz.IUserBiz;
import edu.nk.pker.model.dao.UserHome;
import edu.nk.pker.model.po.User;

public class UserBizImpl implements IUserBiz {

	private UserHome userHome;
	
	public UserBizImpl() {
		super();
		// TODO Auto-generated constructor stub
		this.userHome = new UserHome();
	}
	
	public boolean add(User user) {
		// TODO Auto-generated method stub
		return false;
	}

	public List<User> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean deleteById(int uid) {
		// TODO Auto-generated method stub
		return false;
	}

	public User findById(int uid) {
		// TODO Auto-generated method stub
		return null;
	}

	public User findByUsername(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	public User findByEmail(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean modify(User user) {
		// TODO Auto-generated method stub
		return false;
	}

	public int register(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	public User isLogin(String username, String password) {
		// TODO Auto-generated method stub
		return this.userHome.selectByObjet(username, password);
	}

	public List<User> findAllFollow(int uid) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<User> findAllFollower(int uid) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<User> findAllNotFollow(int uid) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<User> findByObject(String obj) {
		// TODO Auto-generated method stub
		return null;
	}

	public int getPraiseCount(int uid) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int getCollectCount(int uid) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}