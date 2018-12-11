package com.team.controller;

import com.team.code.PageJsonResult;
import com.team.pojo.Student;
import com.team.pojo.Teacher;
import com.team.service.Teacher_service;
import com.team.until.SearchInfo;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("teacher")
public class Teacher_controller {
    private int count;
    @Resource
    Teacher_service teacher_service;

    @RequestMapping("to")
    public String toTeacher(ModelMap m){
        return "Teacher/teacher";
    }
    @RequestMapping("insert")
    public String insertTeacher(Teacher teacher, ModelMap map){
        int judge = teacher_service.insert(teacher);
        map.put("result","success");
        return toTeacherPage(map);
    }

    @RequestMapping("toTeacherPage")
    public String toTeacherPage(ModelMap map){
        return "Teacher/teacher";
    }

    @RequestMapping("getTeacher")
    @ResponseBody
    public PageJsonResult getAllTeacher(Integer pageSize, Integer pageNumber, String searchText, SearchInfo info){
        if (searchText !=null && searchText.length()>=0)
            info.setWhere("where teaName like '%" + searchText + "%'");
        else info.setWhere("");
        info.setPageSize(pageSize);
        info.setPageNumber(pageNumber);
        List list = teacher_service.getAllTeacher(info);
        count = teacher_service.getCount();
        PageJsonResult pageJson = new PageJsonResult();
        pageJson.setTotal(count);
        pageJson.setRows(list);
        return pageJson;
    }

    @RequestMapping("del")
    @ResponseBody
    public Map delTeacher(@Param("st") String st){
        Map m = new HashMap();
        String[] teaNames = st.split(",");
        for (int i = 0;i < teaNames.length;i++){
            String teacher = teaNames[1];
            teacher_service.delete(teacher);
        }
        m.put("result","1");
        return  m;
    }
}
