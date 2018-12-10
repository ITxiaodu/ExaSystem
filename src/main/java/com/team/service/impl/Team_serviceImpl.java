package com.team.service.impl;

import com.team.dao.Team_dao;
import com.team.pojo.Team;
import com.team.service.Team_service;
import com.team.until.SearchInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class Team_serviceImpl implements Team_service{
    @Resource
    Team_dao team_dao;
    @Override
    public List<Team> getAllTeam(SearchInfo info){
        return team_dao.getAllTeam(info);
    }
    @Override
    public int getTeamCount(){
        return team_dao.getTeamCount();
    }
    @Override
    public int insert(Team team){
        return team_dao.insert(team);
    }
    @Override
    public int delTeam(String teamName){
        return  team_dao.delTeam(teamName);
    }
    @Override
    public List<Team> getTeamForName(String teamName){
        return team_dao.getTeamForName(teamName);
    }
    @Override
    public int updateTeam(Team team){
        return team_dao.updateTeam(team);
    }

}
