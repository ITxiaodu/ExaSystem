package com.team.controller;

import com.team.code.PageJsonResult;
import com.team.pojo.Proposi;
import com.team.service.Pro_service;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;


@Controller
@RequestMapping("pro")
public class Pro_controller {

    @Resource
    Pro_service pro_service;

    @RequestMapping("toProMain")
    public String toProMain(ModelMap m){
        return "Proposi/index";
    }
    @RequestMapping("toProInfo")
    public String toProInfo(ModelMap m){
        return "Proposi/proposiInfo";
    }
    @RequestMapping("getAll")
    public String getAll(ModelMap m){
        List list = pro_service.allPro();
        m.put("list",list);
        return toProMain(m);
    }
    @RequestMapping(value = "toProInfo", params = "id")
    public String toProInfoByID(ModelMap m,String id){
        int i = Integer.parseInt(id);
        Proposi pro = pro_service.getForID(i);
        m.put("info",pro);
        return toProInfo(m);
    }
    @RequestMapping("upSt")
    public String upState(ModelMap m,String id,String type){
        int i = Integer.parseInt(id);
        if (type.equals("fb")){
            pro_service.upState(i,"1");
        }else {
            pro_service.upState(i,"0");
        }
        return toProInfoByID(m,id);
    }
    @RequestMapping("upAll")
    public String updateAll(String id,ModelMap m,Proposi pro){
        System.out.println(id);
        pro_service.updatePro(pro);
        return toProInfoByID(m,id);
    }
    @RequestMapping("add")
    public String addPro(Proposi proposi,ModelMap m){
        pro_service.creatPro(proposi);
        return getAll(m);
    }
    @RequestMapping("del")
    public String delForId(ModelMap m,String id){
        int i=Integer.parseInt(id);
        pro_service.delPro(i);
        return getAll(m);
    }
    @RequestMapping("pExa")
    public PageJsonResult getProExa(){
        int fileCount = pro_service.getCountForFile();
        PageJsonResult pjr = new PageJsonResult();
        pjr.setTotal(fileCount);
        return pjr;
    }
}
