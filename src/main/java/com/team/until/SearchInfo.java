package com.team.until;

public class SearchInfo {
    private int pageSize=10;
    private int pageNumber=1;
    private String limit=" limit 0,"+ pageSize;
    private String where;

    public String getLimit() {
        return limit;
    }

    public void setPageNumber(int pageNumber) {
        int curr = (pageNumber-1)*pageSize;
        limit =" limit "+curr+","+pageSize;
        this.pageNumber = pageNumber;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public String getWhere() {
        return where;
    }

    public void setWhere(String where) {
        this.where = where;
    }

}
