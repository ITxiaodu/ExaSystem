package com.team.service.impl;


import com.team.dao.Pro_Dao;
import com.team.pojo.Proposi;
import com.team.service.Pro_service;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class Pro_serviceImpl implements Pro_service{
    @Resource
    Pro_Dao pro_dao;

    @Override
    public int creatPro(Proposi proposi) {
        return pro_dao.creatPro(proposi);
    }

    @Override
    public int updatePro(Proposi proposi) {
        return pro_dao.updatePro(proposi);
    }

    @Override
    public int delPro(int id) {
        return pro_dao.delPro(id);
    }

    @Override
    public List<Proposi> allPro() {
        return pro_dao.allPro();
    }

    @Override
    public Proposi getForID(int id) {
        return null;
    }

    @Override
    public int upState(int id, String state) {
        return pro_dao.upState(id, state);
    }

    @Override
    public int getCountForFile() {
        return pro_dao.getCountForFile();
    }
}
