package com.team.dao;

import com.team.pojo.FeedBack;
import com.team.pojo.Student;
import com.team.pojo.User;
import com.team.until.SearchInfo;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;

@Repository
public interface Student_dao {
    @Select("SELECT * FROM user WHERE name=#{name}")
    public Map FindUser(User user);
    @Select("SELECT * FROM t_stunumber ${where} ${limit}")
    public List<Student> getAllStu(SearchInfo info);
    @Select("SELECT COUNT(*) FROM t_stunumber")
    public int getCount ();
    @Insert("INSERT INTO t_stunumber (stuNumber,pass,realName,IDcard,cal) VALUES('${stuNumber}',123,'${realName}',${IDcard},${cal})")
    public int insert(Student stu);
    @Delete("DELETE FROM t_stunumber WHERE stuNumber='${stuNumber}'")
    public int delete(@Param("stuNumber")String stuNumber);
    @Select("SELECT * FROM feedback ${where} ${limit}")
    public List<FeedBack> getAllFeedback(SearchInfo info);
    @Select("SELECT COUNT(*) FROM feedback")
    public int getCountForBack ();
    @Select("SELECT * FROM feedback WHERE stuNumber='${stuNumber}'")
    public List<FeedBack> getBackInfo(@Param("stuNumber")String stuNumber);
    @Select("SELECT * FROM feedback WHERE id=#{id}")
    public List<FeedBack> getBackInfo2(String id);
    @Update("UPDATE feedback SET reply = '${reply}',state ='1' WHERE stuNumber = '${stuNumber}'")
    public int reply(FeedBack feedBack);
    @Update("UPDATE feedback SET reply = #{reply},state ='1' WHERE id = #{id}")
    public int reply2(FeedBack feedBack);
    @Delete("DELETE FROM feedback WHERE stuNumber='${stuNumber}'")
    public int delFeedBack(@Param("stuNumber") String stuNumber);
    @Delete("DELETE FROM feedback WHERE id=#{id}")
    public int delFeedBack2(String id);
    @Select("SELECT * FROM t_stunumber WHERE id=#{id}")
    public List<Student> getStuByid(String id);
    @Update("UPDATE t_stunumber SET pass=#{pass},realName=#{realName},IDcard=#{IDcard},sex=#{sex},cal=#{cal},qq=#{qq},email=#{email} WHERE id=#{id}")
    public int updateStu(Student student);
}
