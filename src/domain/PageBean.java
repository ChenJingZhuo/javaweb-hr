package domain;

import java.util.List;

public class PageBean {
    private int curPage;// 当前页数
    private int totalPages;// 总页数
    private int toalRows;// 总行数（记录数）
    private int pageSize;// 每页显示的行数
    private List data;// 用来封装每页显示的数据
    public int getCurPage() {

        if (curPage > getTotalPages()) {// 如果当前页数大于总的页数
            curPage = getTotalPages();
        } else if (curPage < 1) {
            curPage = 1;
        }
        return curPage;
    }
    public void setCurPage(int curPage) {
        this.curPage = curPage;
    }
    public int getTotalPages() {// 获得总的页数
        if (toalRows % pageSize == 0) {
            totalPages = toalRows / pageSize;
        } else {
            totalPages = toalRows / pageSize + 1;
        }
        return totalPages;
    }
    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    public int getToalRows() {
        return toalRows;
    }
    public void setToalRows(int toalRows) {
        this.toalRows = toalRows;
    }
    public int getPageSize() {
        return pageSize;
    }
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
    public List getData() {
        return data;
    }
    public void setData(List data) {
        this.data = data;
    }
}
