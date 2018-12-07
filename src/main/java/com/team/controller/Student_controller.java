package com.team.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import com.team.code.PageJsonResult;
import com.team.pojo.FeedBack;
import com.team.pojo.Student;
import com.team.pojo.User;
import com.team.service.Student_service;
import com.team.until.SearchInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("stu")
public class Student_controller {
    private int count;
    @Resource
    Student_service studentService;

    @RequestMapping("to")
    public String toStu(ModelMap m) {
        return "Student/student";
    }

    @RequestMapping("toInfo")
    public String toStuInfo(ModelMap m) {
        return "Student/studentInfo";
    }

    @RequestMapping(value="toInfo",params = "id")
    public String toStuInfo2(String id,ModelMap m) {
        List<Student> list = studentService.getStuByid(id);
        m.put("list",list);
        return toStuInfo(m);
    }

    @RequestMapping("find")
    @ResponseBody
    public Map findUser(User user) {
        return studentService.FindUser(user);
    }

    @RequestMapping("getStu")
    @ResponseBody
    public PageJsonResult getAllStu(Integer pageSize, Integer pageNumber, String searchText, SearchInfo info) {
        if (searchText != null && searchText.length() >= 0)
            info.setWhere("where stuNumber like '%" + searchText + "%'");
        else info.setWhere("");
        info.setPageSize(pageSize);
        info.setPageNumber(pageNumber);
        List list = studentService.getAllStu(info);
        count = studentService.getCount();
        PageJsonResult pageJson = new PageJsonResult();
        pageJson.setTotal(count);
        pageJson.setRows(list);
        return pageJson;
    }

    @RequestMapping("insert")
    public String insertStu(Student student, ModelMap map) {
        int judge = studentService.insert(student);
        map.put("result", "success");
        return toStuPage(map);
    }

    //跳转
    @RequestMapping("toStuPage")
    public String toStuPage(ModelMap map) {
        return "Student/student";
    }

    @RequestMapping("del")
    @ResponseBody
    public Map delStu(@Param("st") String st) {
        Map m = new HashMap();
        String[] stuNumbers = st.split(",");
        for (int i = 0; i < stuNumbers.length; i++) {
            String stu = stuNumbers[i];
            studentService.delete(stu);
        }
        m.put("result", "1");
        return m;
    }

    @RequestMapping("testMap")
    @ResponseBody
    public Map testMap(@Param("st") String st) {
        System.out.println(st);
        Map m = new HashMap();
        m.put("result", "1");
        return m;
    }

    /**
     * @param pageSize   每一页大小
     * @param pageNumber 第几页
     * @param searchText 搜索框内容
     * @param info       自定义模糊查询
     * @return
     */
    @RequestMapping("getFB")
    @ResponseBody
    public PageJsonResult getAllFeedBack(Integer pageSize, Integer pageNumber, String searchText, SearchInfo info) {
        if (searchText != null && searchText.length() >= 0) info.setWhere("where content like '%" + searchText + "%'");
        else info.setWhere("");
        info.setPageSize(pageSize);
        info.setPageNumber(pageNumber);
        List list = studentService.getAllFeedback(info);
        count = studentService.getCountForBack();
        PageJsonResult pageJson = new PageJsonResult();
        pageJson.setTotal(count);
        pageJson.setRows(list);
        return pageJson;
    }

    /**
     * 跳转到反馈页面
     */
    @RequestMapping("toFeedBack")
    public String toFeedBack(ModelMap map) {
        return "Student/stuFeedback";
    }

    /**
     * 跳转到反馈详细页面
     */
    @RequestMapping("toBackInfo")
    public String toBackInfo(ModelMap map) {
        return "Student/feedbackinfo";
    }

    /**
     * 返回反馈页面
     */
    @RequestMapping("goBack")
    public String goBack(ModelMap map) {
        return "Student/stuFeedback";
    }

    /**
     * 通过jd获取详细反馈内容
     */
    @RequestMapping("getInfo")
    public String getInfoForStu(String id, ModelMap map) {
//        List<FeedBack> list = student_service.getBackInfo(stuNumber);
        List<FeedBack> list = studentService.getBackInfo2(id);
        map.put("list", list);
        return toBackInfo(map);
    }

    /**
     * 回复内容上传数据库并返回jsp
     */
    @RequestMapping("reply")
    public String reply(FeedBack feedBack, ModelMap map) {
        SimpleDateFormat df = new SimpleDateFormat("yyyy年MM月dd日");
        String time = df.format(new Date());
        String txt = feedBack.getReply();
        feedBack.setReply(txt + "[" + time + "]");
        int i = studentService.reply2(feedBack);
        if (i == 1) {
            return getInfoForStu(feedBack.getId(), map);
        } else {
            return "";
        }

    }

    /**
     * 通过id删除学生反馈
     */
    @RequestMapping("delFB")
    @ResponseBody
    public Map delFeedBack(String id) {
//        System.out.println(id);
        Map m = new HashMap();
        String[] stuNumbers = id.split(",");
        for (int i = 0; i < stuNumbers.length; i++) {
            String stu = stuNumbers[i];
            System.out.println(stu);
//            student_service.delFeedBack(stu);
            studentService.delFeedBack2(stu);
        }
        m.put("result", "1");
        return m;
    }

    @RequestMapping("stuUpdate")
    public String stuUpdate(Student stu,ModelMap m){
        int i = studentService.updateStu(stu);
        if(i==1) {
            return toStu(m);
        }else{
            return toStu(m);
        }
    }
}
