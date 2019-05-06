package com.spring.dto;

 

import java.io.Serializable;
import java.util.List;

public class PageList<T> implements Serializable {
    private int pageNum = 1;
    private int pageSize = 20;
    private int total = 0;
    private int isEnd = 0;
    private int nextPage = 1;
    private String pid;
    private int totalPage;
    private List<T> data;
    private static final int DEFAULT_PAGE_SIZE = 100;

    public PageList() {
    }

    public PageList(int pageNum, int pageSize) {
        this.setPageNum(pageNum);
        this.setPageSize(pageSize);
    }

    public PageList(int pageNum, int pageSize, int total) {
        this.setPageNum(pageNum);
        this.setPageSize(pageSize);
        this.setTotal(total);
    }
    
    public PageList(List<T> datas,int pageNum, int pageSize, int total) {
    	this.setData(datas);
        this.setPageNum(pageNum);
        this.setPageSize(pageSize);
        this.setTotal(total);
    }

    public int getPageNum() {
        return this.pageNum;
    }

    public void setPageNum(int pageNum) {
        if(pageNum <= 0) {
            this.pageNum = 1;
        } else {
            this.pageNum = pageNum;
        }

    }

    public int getPageSize() {
        return this.pageSize;
    }

    public void setPageSize(int pageSize) {
        if(pageSize <= 100 && pageSize > 0) {
            this.pageSize = pageSize;
        } else {
            this.pageSize = 100;
        }

        this.setTotalPage();
    }

    public int getTotal() {
        return this.total;
    }

    public void setTotal(int total) {
        if(total >= 0) {
            this.total = total;
            this.setTotalPage();
        }

    }

    public int getIsEnd() {
        return this.isEnd;
    }

    public int getNextPage() {
        return this.nextPage;
    }

    public void totalRefresh() {
        if(this.pageNum < this.totalPage) {
            this.nextPage = this.pageNum + 1;
            this.isEnd = 0;
        } else {
            this.isEnd = 1;
            this.nextPage = this.totalPage;
        }

    }

    public void noTotalRefreshWithDataSize(int curDataSize) {
        if(curDataSize != 0 && curDataSize >= this.pageSize) {
            this.isEnd = 0;
            this.nextPage = this.pageNum + 1;
        } else {
            this.isEnd = 1;
            this.nextPage = this.pageNum;
        }

    }

    public String getPid() {
        return this.pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public int getTotalPage() {
        return this.totalPage;
    }

    public void setTotalPage() {
        if(this.pageSize > 0 && this.total > 0) {
            this.totalPage = this.total / this.pageSize + (this.total % this.pageSize > 0?1:0);
        } else {
            this.totalPage = 0;
        }

        this.totalRefresh();
    }

    /** @deprecated */
    @Deprecated
    public List<T> getData() {
        return this.data;
    }

    /** @deprecated */
    @Deprecated
    public void setData(List<T> data) {
        this.data = data;
    }

    public static <T> PageList<T> bulidPageList(List<T> dataList, int pageNo, int pageSize, int totalRows) {
        return new PageList(dataList, pageNo, pageSize, totalRows);
    }
    
    public String toString() {
        return "Page [pageNum=" + this.pageNum + ", pageSize=" + this.pageSize + ", total=" + this.total + ", isEnd=" + this.isEnd + ", nextPage=" + this.nextPage + ", pid=" + this.pid + ", totalPage=" + this.totalPage + ",data=" + this.data + "]";
    }
}

