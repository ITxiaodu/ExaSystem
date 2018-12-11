package com.team.dao;

import com.team.pojo.Teacher;
import com.team.until.SearchInfo;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface Teacher_dao {
    @Select("SELECT * FROM t_teacher ${where} ${limit}")
    public List<Teacher> getAllTeacher(SearchInfo info);
    @Select("SELECT COUNT(*) FROM t_teacher")
    public int getCount ();
    @Insert("INSERT INTO t_teacher (teaName,cal,qq,email) VALUES('${teaName}','${cal}','${qq}','${email}')")
    public int insert(Teacher teacher);
    @Delete("DELETE FROM t_teacher WHERE teaName='${teaName}'")
    public int delete(@Param("teaName") String teaName);

}
