package com.team.code;


import com.team.pojo.Student;

import java.util.List;

public class TableSplitResult{
    private Integer page;
    private Integer total;
    private List<Student> stu;

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public List<Student> getStu() {
        return stu;
    }

    public void setStu(List<Student> stu) {
        this.stu = stu;
    }
}
