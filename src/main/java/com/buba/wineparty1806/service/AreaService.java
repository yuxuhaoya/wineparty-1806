package com.buba.wineparty1806.service;

import com.buba.wineparty1806.pojo.Area;
import com.buba.wineparty1806.pojo.Shandong;
import com.buba.wineparty1806.pojo.Tp;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface AreaService {
    List<Area> findAll();

    int addshandong(Shandong shandong);

    List<Shandong> findshandong();

    Shandong findsd(Integer id);

    int updshandong(Shandong shandong);

    int updCard(Tp tp);

    int updatearea(Integer id, String name);

    int delete(Integer[] id);

    List<Shandong> findshandongshi();

    PageInfo<Shandong> dpdaochu(Integer limit, Integer offset);
}
