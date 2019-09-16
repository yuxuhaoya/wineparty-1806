package com.buba.wineparty1806.service.impl;

import com.buba.wineparty1806.dao.LoginDao;
import com.buba.wineparty1806.pojo.Area;
import com.buba.wineparty1806.pojo.User;
import com.buba.wineparty1806.service.LoginService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class LoginServiceImpl implements LoginService {
    @Resource
    private LoginDao loginDao;

    @Override
    public User findlogin(String usercode, String password) {
        return loginDao.findlogin(usercode,password);
    }

    @Override
    public List<User> finduser(Integer areaId) {
        return loginDao.finduser(areaId);
    }

    @Override
    public int adduser(User user) {
        return loginDao.adduser(user);
    }

    @Override
    public int addarea(Area area) {
        return loginDao.addarea(area);
    }
}
