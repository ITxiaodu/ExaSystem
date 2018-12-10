package com.team.controller;

import com.team.code.PageJsonResult;
import com.team.pojo.Team;
import com.team.service.Team_service;
import com.team.until.SearchInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("team")
public class Team_controller {
    private int count;
    @Resource
    Team_service team_service;

    @RequestMapping("toTeamInfo")
    public String toTeamInfo(ModelMap m){
        return "Team/teamInfo";
    }

    @RequestMapping("toTeamUp")
    public String toTeamUpdate(ModelMap m){
        return "Team/teamUpdate";
    }

    @RequestMapping(value = "toTeamUp",params = "teamName")
    public String toTeamUpdate2(String teamName,ModelMap m) throws UnsupportedEncodingException {
        System.out.println(URLDecoder.decode(teamName,"UTF-8"));
        List<Team> list = team_service.getTeamForName(URLDecoder.decode(teamName,"UTF-8"));
        m.put("list",list);
        return toTeamUpdate(m);
    }

    @RequestMapping("getAll")
    @ResponseBody
    public PageJsonResult getAllTeam(Integer pageSize, Integer pageNumber, String searchText, SearchInfo info){
        if (searchText!=null&&searchText.length()>=0) info.setWhere("where teamName like '%"+searchText+"%'");
        else info.setWhere("");
        info.setPageSize(pageSize);
        info.setPageNumber(pageNumber);
        List list = team_service.getAllTeam(info);
        count = team_service.getTeamCount();
        PageJsonResult pageJson = new PageJsonResult();
        pageJson.setTotal(count);
        pageJson.setRows(list);
        return pageJson;
    }
    @RequestMapping("inTeam")
    public String inTeam(Team team,ModelMap m){
        team_service.insert(team);
        return toTeamInfo(m);
    }
    @RequestMapping("delTeam")
    @ResponseBody
    public Map delTeam(@Param("teamName") String teamName){
        String[] teamNames = teamName.split(",");
        for(int i=0;i<teamNames.length;i++){
            team_service.delTeam(teamNames[i]);
        }
        Map map = new HashMap();
        map.put("result","1");
        return map;
    }
    @RequestMapping("update")
    public String updateTeam(Team team,ModelMap m){
        if (team_service.updateTeam(team)==1){
            return toTeamInfo(m);
        }
        return "";
    }
}
