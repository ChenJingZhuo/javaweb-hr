package test;

import dao.DeptDao;
import dao.impl.DeptDaoImpl;
import domain.Dept;
import domain.PageBean;
import org.junit.Before;
import org.junit.Test;

import java.util.List;

public class DeptDaoTest {
    DeptDao deptDao = null;

    @Before
    public void before() {
        deptDao = new DeptDaoImpl();
    }

    @Test
    public void testAdd() {
        Dept dept = new Dept();
        dept.setDeptNo("600");
        dept.setDeptName("内务部");
        dept.setEnabled(1);
        int count = deptDao.insertDept(dept);
        System.out.println("###########" + count);
    }
    @Test
    public void testUpdate() {
        Dept dept = new Dept();
        dept.setDeptId(4);
        dept.setDeptNo("400");
        dept.setDeptName("销售部");
        dept.setEnabled(0);
        int count = deptDao.updateDept(dept);
        System.out.println("###########" + count);
    }
    @Test
    public void testDelete() {
        int count = deptDao.deleteDept(4);
        System.out.println("###########" + count);
    }
    @Test
    public void testFindById() {
        Dept dept = deptDao.queryDeptById(3);
        System.out.println("###########" + dept.getDeptName());
    }
    @Test
    public void testgetRecord() {
        int totalRows = deptDao.getDeptRows();
        System.out.println("###########" + totalRows);
    }
    @Test
    public void testPageDept() {
        PageBean pageBean = deptDao.getDept(1);
        System.out.println("*****#####" + pageBean.getToalRows());
        for (Dept dept : (List<Dept>) pageBean.getData()) {
            System.out.println("*****#####" + dept.getDeptName());
        }
    }

    @Test
    public void testFindByNo() {
        Dept dept = deptDao.queryDeptByNo("d101");
        System.out.println("###########" + dept.getDeptNo());
    }
}
