package service.impl;

import dao.DeptDao;
import dao.EmpDao;
import dao.impl.DeptDaoImpl;
import dao.impl.EmpDaoImpl;
import domain.Dept;
import domain.Emp;
import domain.PageBean;
import service.EmpService;

public class EmpServiceImpl implements EmpService {

    EmpDao empDao = null;
    public EmpServiceImpl() {
        empDao = new EmpDaoImpl();
    }

    @Override
    public PageBean findPageEmp(int page) {
        PageBean pageBean = null;
        pageBean = empDao.getEmp(page);
        if (pageBean != null) {
            return pageBean;
        }
        return null;
    }

    @Override
    public boolean addEmp(Emp emp) {
        if (empDao.insertEmp(emp) > 0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean modifyEmp(Emp emp) {
        if (empDao.updateEmp(emp) > 0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean removeEmp(int id) {
        if (empDao.deleteEmp(id) > 0) {
            return true;
        }
        return false;
    }

    @Override
    public Emp findEmpById(int id) {
        Emp emp = null;
        emp = empDao.queryEmpById(id);
        if (emp != null) {
            return emp;
        }
        return null;
    }
}
