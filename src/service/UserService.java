package service;

import dao.UserDao;
import dao.impl.UserDaoImpl;
import domain.User;

public class UserService {

	private UserDao dao = new UserDaoImpl();

	public User userLogin(User user) {
		return dao.findOneUserInfo(user);
	}

	public boolean userRegister(User user) {
		return dao.insertOneUserInfo(user);
	}

    public boolean changePwd(User user) {
		return dao.updatePwd(user)>0?true:false;
    }
}
