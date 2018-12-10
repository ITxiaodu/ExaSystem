package com.team.dao;

import com.team.pojo.ProFile;
import com.team.until.SearchInfo;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProExa_dao {
    @Select("SELECT COUNT(*) FROM profile")
    public int getCountForFile();
    @Select("SELECT * FROM profile ${where} ${limit}")
    public List<ProFile> getAllTeam(SearchInfo info);
    @Select("SELECT teamName FROM stu_team WHERE stuNumber =#{stuNumber}")
    public String getTeamName(String stuNumber);
    @Insert("INSERT INTO profile (teamName,proName,fileName,path,time,state) VALUES(#{teamName},#{proName},#{fileName},#{path},#{time},#{time},1)")
    public int UploadInsert(ProFile proFile);
}
