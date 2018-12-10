package com.team.dao;

import com.team.pojo.Proposi;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface Pro_Dao {
    @Insert("INSERT INTO proposition (proName,content,score,time,proRequ,othRequ,state)" +
    "VALUES (#{proName},#{content},#{score},#{time},#{proRwqu},#{proRequ},#{state})")
    public int creatPro(Proposi proposi);
    @Update("UPDATE proposition SET proName=#{proName},content=#{content},score=#{score},"+
    "time=#{time},proRequ=#{proRequ},othRequ=#{othRequ} WHERE id=#{id}")
    public int updatePro(Proposi proposi);
    @Delete("DELETE FROM proposition WHERE id = #{id}")
    public int delPro(int id);
    @Select("SELECT * FROM proposition")
    public List<Proposi> allPro();
    @Select("SELECT * FROM proposition WHERE id=#{id}")
    public Proposi getForID(int id);
    @Update("UPDATE proposition SET state=#{state} WHERE id=#{id}")
    public int upState(@Param("id") int id,@Param("state") String state);
    @Select("SELECT COUNT(*) FROM profile")
    public int getCountForFile();
}
