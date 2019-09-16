package com.buba.wineparty1806.service.impl;

import com.buba.wineparty1806.dao.AreaDao;
import com.buba.wineparty1806.pojo.Area;
import com.buba.wineparty1806.pojo.Shandong;
import com.buba.wineparty1806.pojo.Tp;
import com.buba.wineparty1806.service.AreaService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AreaServiceImpl implements AreaService {
    @Resource
    private AreaDao areaDao;

    @Override
    public List<Area> findAll() {
        return areaDao.findAll();
    }

    @Override
    public int addshandong(Shandong shandong) {
        return areaDao.addshandong(shandong);
    }

    @Override
    public List<Shandong> findshandong() {
        return areaDao.findshandong();
    }

    @Override
    public Shandong findsd(Integer id) {
        return areaDao.findsd(id);
    }

    @Override
    public int updshandong(Shandong shandong) {
        return areaDao.updshandong(shandong);
    }

    @Override
    public int updCard(Tp tp) {
        return areaDao.updCard(tp);
    }

    @Override
    public int updatearea(Integer id, String name) {
        return areaDao.updatearea(id,name);
    }

    @Override
    public int delete(Integer[] id) {
        return areaDao.delete(id);
    }

    @Override
    public List<Shandong> findshandongshi() {
        return areaDao.findshandongshi();
    }

    @Override
    public PageInfo<Shandong> dpdaochu(Integer limit, Integer offset) {
        PageHelper.startPage(limit,offset);
        List<Shandong> list = areaDao.daochu();
        PageInfo<Shandong> info = new PageInfo<>(list);
        return info;
    }
}
