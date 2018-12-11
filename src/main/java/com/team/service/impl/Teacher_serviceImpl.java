package com.team.service.impl;

import com.team.dao.Teacher_dao;
import com.team.pojo.Teacher;
import com.team.service.Teacher_service;
import com.team.until.SearchInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service
public class Teacher_serviceImpl implements Teacher_service{
    private int count;
    @Resource
    Teacher_dao teacher_dao;

    @Override
    public List<Teacher> getAllTeacher(SearchInfo info) {
        return teacher_dao.getAllTeacher(info);
    }

    @Override
    public int insert(Teacher teacher) {
        return teacher_dao.insert(teacher);
    }

    @Override
    public int delete(String teaName) {
        return teacher_dao.delete(teaName);
    }
    @Override
    public int getCount(){
        return teacher_dao.getCount();
    }
}
