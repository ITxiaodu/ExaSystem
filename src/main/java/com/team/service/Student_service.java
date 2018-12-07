package com.team.service;

import com.team.pojo.FeedBack;
import com.team.pojo.Student;
import com.team.pojo.User;
import com.team.until.SearchInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface Student_service {
    public Map FindUser(User user);
    public List<Student> getAllStu(SearchInfo info);
    public int getCount ();
    public int insert(Student stu);
    public int delete(@Param("stuNumber")String stuNumber);
    public List<FeedBack> getAllFeedback(SearchInfo info);
    public int getCountForBack ();
    public List<FeedBack> getBackInfo(@Param("stuNumber")String stuNumber);
    public List<FeedBack> getBackInfo2(String id);
    public int reply(FeedBack feedBack);
    public int reply2(FeedBack feedBack);
    public int delFeedBack(@Param("stuNumber") String stuNumber);
    public int delFeedBack2(String id);
    public List<Student> getStuByid(String id);
    public int updateStu(Student student);
}
