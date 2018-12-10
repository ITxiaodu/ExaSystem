package com.team.service;

import com.team.pojo.ProFile;
import com.team.until.SearchInfo;

import java.util.List;

public interface ProExa_service {
    public int getCountForFile();
    public List<ProFile> getAllTeam(SearchInfo info);
    public String getTeamName(String stuNumber);
    public int UploadInsert(ProFile proFile);
}
