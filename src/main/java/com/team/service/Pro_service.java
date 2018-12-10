package com.team.service;

import com.team.pojo.Proposi;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface Pro_service {
    public int creatPro(Proposi proposi);
    public int updatePro(Proposi proposi);
    public int delPro(int id);
    public List<Proposi> allPro();
    public Proposi getForID(int id);
    public int upState(@Param("id") int id ,@Param("state") String state);
    public int getCountForFile();
}
