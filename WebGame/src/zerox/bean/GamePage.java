package zerox.bean;

import java.util.List;

public class GamePage<T> {
    /*放某一页的数据集合*/
    private List<T> data;

    /*当前页码*/
    private Integer pageNumber;

    /*总共分了多少页*/
    private Integer pageCount;

    private String rangestrs;

    public GamePage() {
    }

    public GamePage(List<T> data, Integer pageNumber, Integer pageCount, String rangestrs) {
        this.data = data;
        this.pageNumber = pageNumber;
        this.pageCount = pageCount;
        this.rangestrs = rangestrs;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

    public Integer getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(Integer pageNumber) {
        this.pageNumber = pageNumber;
    }

    public Integer getPageCount() {
        return pageCount;
    }

    public void setPageCount(Integer pageCount) {
        this.pageCount = pageCount;
    }

    public String getRangestrs() {
        return rangestrs;
    }

    public void setRangestrs(String rangestrs) {
        this.rangestrs = rangestrs;
    }
}
