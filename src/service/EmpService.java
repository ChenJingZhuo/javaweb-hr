package service;

import domain.Emp;
import domain.PageBean;

public interface EmpService {
    // 获得信息
    public PageBean findPageEmp(int page);
    // 添加
    public boolean addEmp(Emp emp);
    // 更新
    public boolean modifyEmp(Emp emp);
    // 删除
    public boolean removeEmp(int id);
    // 根据id查
    public Emp findEmpById(int id);
}
