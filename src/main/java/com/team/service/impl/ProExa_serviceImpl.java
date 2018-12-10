package com.team.service.impl;

import com.team.dao.ProExa_dao;
import com.team.pojo.ProFile;
import com.team.service.ProExa_service;
import com.team.until.SearchInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ProExa_serviceImpl implements ProExa_service{
    @Resource
    ProExa_dao proExa_dao;

    @Override
    public int getCountForFile() {
        return proExa_dao.getCountForFile();
    }

    @Override
    public List<ProFile> getAllTeam(SearchInfo info) {
        return proExa_dao.getAllTeam(info);
    }

    @Override
    public String getTeamName(String stuNumber) {
        return proExa_dao.getTeamName(stuNumber);
    }

    @Override
    public int UploadInsert(ProFile proFile) {
        return proExa_dao.UploadInsert(proFile);
    }
}
