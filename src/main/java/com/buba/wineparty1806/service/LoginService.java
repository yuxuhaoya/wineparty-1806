package com.buba.wineparty1806.service;

import com.buba.wineparty1806.pojo.Area;
import com.buba.wineparty1806.pojo.User;

import java.util.List;

public interface LoginService {
    User findlogin(String usercode, String password);

    List<User> finduser(Integer areaId);

    int adduser(User user);

    int addarea(Area area);
}
