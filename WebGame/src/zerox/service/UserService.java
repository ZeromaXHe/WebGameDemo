package zerox.service;

import zerox.bean.User;
import zerox.dao.UserDao;

public class UserService {
    public boolean register(User user) throws IllegalArgumentException{
        if("".equals(user.getUsername())||user.getUsername()==null){
            throw new IllegalArgumentException("用户名为空");
        }
        if("".equals(user.getPassword())||user.getPassword()==null){
            throw new IllegalArgumentException("密码为空");
        }
        UserDao userDao = new UserDao();
        if(userDao.contains(user)>0) return false;
        return userDao.save(user)==1;
    }
}
