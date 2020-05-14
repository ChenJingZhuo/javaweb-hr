package service;

import domain.Dept;
import domain.PageBean;

public interface DeptService {
    // 获得信息
    public PageBean findPageDept(int page);
    // 获得搜索信息
    public PageBean searchPageDept(int page, String key);
    // 添加
    public boolean addDept(Dept dept);
    // 更新
    public boolean modifyDept(Dept dept);
    // 删除
    public boolean removeDept(int id);
    // 根据id查
    public Dept findDeptById(int id);
    // 根据deptNo查
    public Dept findDeptByNo(String deptNo);
}
