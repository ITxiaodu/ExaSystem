package com.team.service;

import com.team.pojo.Team;
import com.team.until.SearchInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface Team_service {
    public List<Team> getAllTeam(SearchInfo info);
    public int getTeamCount();
    public int insert(Team team);
    public int delTeam(@Param("teamName") String teamName);
    public List<Team> getTeamForName(@Param("teamName") String teamName);
    public int updateTeam(Team team);
}
