package dao.impl;

import dao.EmpDao;
import domain.Dept;
import domain.Emp;
import domain.Emp;
import domain.PageBean;
import uitl.DBUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmpDaoImpl implements EmpDao {

    DBUtil dBUtil = null;
    public EmpDaoImpl() {
        dBUtil = new DBUtil();
    }

    @Override
    public int getEmpRows() {
        int totalRows = 0;
        String sql = "select count(*) from emp";
        totalRows = dBUtil.getRecord(sql);
        dBUtil.release();
        return totalRows;
    }

    @Override
    public PageBean getEmp(int page) {
        List list = new ArrayList();
        ResultSet rs = null;
        PageBean bean = new PageBean();
        bean.setPageSize(5);// 设置每页显示条数
        bean.setCurPage(page);// 设置当前页数
        bean.setToalRows(getEmpRows());// 设置总的记录数
        int offset = (bean.getCurPage() - 1) * bean.getPageSize();// 起始数据的行数
        int rows = bean.getPageSize();// 每页要显示的记录数
        try {
            String sql = "select * from emp limit " + offset + "," + rows;
            rs = dBUtil.excuteQuery(sql);
            while (rs.next()) {
                Emp emp = new Emp();
                emp.setEmpId(rs.getInt("empId"));
                emp.setEmpNo(rs.getString("empNo"));
                emp.setEmpName(rs.getString("empName"));
                emp.setSex(rs.getInt("sex"));
                emp.setDeptName(rs.getString("deptName"));
                emp.setPosition(rs.getString("position"));
                emp.setBirthday(rs.getString("birthday"));
                emp.setTel(rs.getString("tel"));
                emp.setStatus(rs.getString("status"));
                list.add(emp);
            }
            bean.setData(list);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dBUtil.release();
        }
        return bean;
    }

    @Override
    public List<Emp> getAllEmp() {
        List<Emp> depts = new ArrayList<Emp>();
        ResultSet rs = null;
        try {
            String sql = "select * from emp";
            rs = dBUtil.excuteQuery(sql);
            while (rs.next()) {
                Emp emp = new Emp();
                emp.setEmpId(rs.getInt("empId"));
                emp.setEmpNo(rs.getString("empNo"));
                emp.setEmpName(rs.getString("empName"));
                emp.setSex(rs.getInt("sex"));
                emp.setDeptName(rs.getString("deptName"));
                emp.setPosition(rs.getString("position"));
                emp.setBirthday(rs.getString("birthday"));
                emp.setTel(rs.getString("tel"));
                emp.setStatus(rs.getString("status"));
                depts.add(emp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dBUtil.release();
        }
        return depts;
    }

    @Override
    public int insertEmp(Emp emp) {
        int count = 0;
        String sql = "insert into emp(empNo,empName,sex,deptName,position,birthday,tel,status)values(?,?,?,?,?,?,?,?)";
        Object[] obj = new Object[] { emp.getEmpNo(), emp.getEmpName(), emp.getSex() };
        count = dBUtil.excuteUpdate(sql, obj);
        dBUtil.release();
        return count;
    }

    @Override
    public int updateEmp(Emp emp) {
        int count = 0;
        String sql = "update emp set empNo=?,empName=?,sex=?,deptName=?,position=?,birthday=?,tel=?,status=? where empId=?";
        Object[] obj = new Object[] { emp.getEmpNo(), emp.getDeptName(), emp.getSex(), emp.getDeptName(), emp.getPosition(), emp.getBirthday(), emp.getTel(), emp.getStatus() };
        count = dBUtil.excuteUpdate(sql, obj);
        dBUtil.release();
        return count;
    }

    @Override
    public int deleteEmp(int id) {
        int count = 0;
        String sql = "delete from emp where empId=?";
        Object[] obj = new Object[] { id };
        count = dBUtil.excuteUpdate(sql, obj);
        dBUtil.release();
        return count;
    }

    @Override
    public Emp queryEmpById(int id) {
        Emp emp = new Emp();
        String sql = "select * from emp where empId=?";
        Object[] obj = new Object[] { id };
        ResultSet rs = dBUtil.excuteQuery(sql, obj);
        try {
            while (rs.next()) {
                emp.setEmpId(rs.getInt("empId"));
                emp.setEmpNo(rs.getString("empNo"));
                emp.setEmpName(rs.getString("empName"));
                emp.setSex(rs.getInt("sex"));
                emp.setDeptName(rs.getString("deptName"));
                emp.setPosition(rs.getString("position"));
                emp.setBirthday(rs.getString("birthday"));
                emp.setTel(rs.getString("tel"));
                emp.setStatus(rs.getString("status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dBUtil.release();
        }
        return emp;
    }

    @Override
    public Emp queryEmpByNo(String empNo) {
        Emp emp = new Emp();
        String sql = "select * from emp where empNo=?";
        Object[] obj = new Object[] { empNo };
        ResultSet rs = dBUtil.excuteQuery(sql, obj);
        try {
            while (rs.next()) {
                emp.setEmpId(rs.getInt("empId"));
                emp.setEmpNo(rs.getString("empNo"));
                emp.setEmpName(rs.getString("empName"));
                emp.setSex(rs.getInt("sex"));
                emp.setDeptName(rs.getString("deptName"));
                emp.setPosition(rs.getString("position"));
                emp.setBirthday(rs.getString("birthday"));
                emp.setTel(rs.getString("tel"));
                emp.setStatus(rs.getString("status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dBUtil.release();
        }
        return emp;
    }
}
