package dao;

import domain.Dept;
import domain.PageBean;

import java.util.List;

public interface DeptDao {
    // 获得总的记录数
    public int getDeptRows();
    // 获得分页信息
    public PageBean getDept(int page);
    // 查询所有的部门信息
    public List<Dept> getAllDept();
    // 搜索相关的部门信息
    public PageBean getSearchDept(int page, String key);
    // 添加
    public int insertDept(Dept dept);
    // 更新
    public int updateDept(Dept dept);
    // 删除
    public int deleteDept(int id);
    // 根据id查
    public Dept queryDeptById(int id);
    // 根据dptNo查
    public Dept queryDeptByNo(String deptNo);
}
