package dao;

import domain.Emp;
import domain.PageBean;

import java.util.List;

public interface EmpDao {
    // 获得总的记录数
    public int getEmpRows();
    // 获得分页信息
    public PageBean getEmp(int page);
    // 查询所有的部门信息
    public List<Emp> getAllEmp();
    // 添加
    public int insertEmp(Emp emp);
    // 更新
    public int updateEmp(Emp emp);
    // 删除
    public int deleteEmp(int id);
    // 根据id查
    public Emp queryEmpById(int id);
    // 根据dptNo查
    public Emp queryEmpByNo(String deptNo);
}
