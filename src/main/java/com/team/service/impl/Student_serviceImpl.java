package com.team.service.impl;

import com.team.dao.Student_dao;
import com.team.pojo.FeedBack;
import com.team.pojo.Student;
import com.team.pojo.User;
import com.team.service.Student_service;
import com.team.until.SearchInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class Student_serviceImpl implements Student_service {
    @Resource
    Student_dao studentDao;

    @Override
    public Map FindUser(User user) {
        return studentDao.FindUser(user);
    }

    @Override
    public List<Student> getAllStu(SearchInfo info) {
        return studentDao.getAllStu(info);
    }

    @Override
    public int getCount() {
        return studentDao.getCount();
    }

    @Override
    public int insert(Student stu) {
        return studentDao.insert(stu);
    }

    @Override
    public int delete(String stuNumber) {
        return studentDao.delete(stuNumber);
    }

    @Override
    public List<FeedBack> getAllFeedback(SearchInfo info) {
        return studentDao.getAllFeedback(info);
    }

    @Override
    public int getCountForBack() {
        return studentDao.getCountForBack();
    }

    @Override
    public List<FeedBack> getBackInfo(String stuNumber) {
        return studentDao.getBackInfo(stuNumber);
    }

    @Override
    public List<FeedBack> getBackInfo2(String id) {
        return studentDao.getBackInfo2(id);
    }

    @Override
    public int reply(FeedBack feedBack) {
        return studentDao.reply(feedBack);
    }

    @Override
    public int reply2(FeedBack feedBack) {
        return studentDao.reply2(feedBack);
    }

    @Override
    public int delFeedBack(String stuNumber) {
        return studentDao.delFeedBack(stuNumber);
    }

    @Override
    public int delFeedBack2(String id) {
        return studentDao.delFeedBack2(id);
    }

    @Override
    public List<Student> getStuByid(String id) {
        return studentDao.getStuByid(id);
    }

    @Override
    public int updateStu(Student student) {
        return studentDao.updateStu(student);
    }
}
