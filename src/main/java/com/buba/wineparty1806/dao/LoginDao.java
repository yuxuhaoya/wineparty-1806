package com.buba.wineparty1806.dao;

import com.buba.wineparty1806.pojo.Area;
import com.buba.wineparty1806.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LoginDao {
    User findlogin(@Param("usercode") String usercode,@Param("password") String password);

    List<User> finduser(Integer areaId);

    int adduser(User user);

    int addarea(Area area);
}
