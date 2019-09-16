package com.buba.wineparty1806.dao;

import com.buba.wineparty1806.pojo.Area;
import com.buba.wineparty1806.pojo.Shandong;
import com.buba.wineparty1806.pojo.Tp;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AreaDao {
    List<Area> findAll();

    int addshandong(Shandong shandong);

    List<Shandong> findshandong();

    Shandong findsd(Integer id);

    int updshandong(Shandong shandong);

    int updCard(Tp tp);

    int updatearea(@Param("id") Integer id,@Param("name") String name);

    int delete(@Param("id") Integer[] id);

    List<Shandong> findshandongshi();

    List<Shandong> daochu();
}
