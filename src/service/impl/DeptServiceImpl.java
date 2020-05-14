package service.impl;

import dao.DeptDao;
import dao.impl.DeptDaoImpl;
import domain.Dept;
import domain.PageBean;
import service.DeptService;

public class DeptServiceImpl implements DeptService {
    DeptDao deptDao = null;
    public DeptServiceImpl() {
        deptDao = new DeptDaoImpl();
    }
    @Override
    public PageBean findPageDept(int page) {
        PageBean pageBean = null;
        pageBean = deptDao.getDept(page);
        if (pageBean != null) {
            return pageBean;
        }
        return null;
    }

    @Override
    public PageBean searchPageDept(int page, String key) {
        PageBean pageBean = null;
        pageBean = deptDao.getSearchDept(page,key);
        if (pageBean != null) {
            return pageBean;
        }
        return null;
    }

    @Override
    public boolean addDept(Dept dept) {
        if (deptDao.insertDept(dept) > 0) {
            return true;
        }
        return false;
    }
    @Override
    public boolean modifyDept(Dept dept) {
        if (deptDao.updateDept(dept) > 0) {
            return true;
        }
        return false;
    }
    @Override
    public boolean removeDept(int id) {
        if (deptDao.deleteDept(id) > 0) {
            return true;
        }
        return false;
    }
    @Override
    public Dept findDeptById(int id) {
        Dept dept = null;
        dept = deptDao.queryDeptById(id);
        if (dept != null) {
            return dept;
        }
        return null;
    }

    @Override
    public Dept findDeptByNo(String deptNo) {
        return deptDao.queryDeptByNo(deptNo);
    }
}
