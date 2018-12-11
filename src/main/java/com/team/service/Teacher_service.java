package com.team.service;

import com.team.pojo.Teacher;
import com.team.until.SearchInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface Teacher_service {
    public List<Teacher> getAllTeacher(SearchInfo info);
    public int getCount();
    public int insert(Teacher teacher);
    public int delete(@Param("teaName") String teaName);
}
