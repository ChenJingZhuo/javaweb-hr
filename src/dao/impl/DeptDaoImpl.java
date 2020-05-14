package dao.impl;

import dao.DeptDao;
import domain.Dept;
import domain.PageBean;
import uitl.DBUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DeptDaoImpl implements DeptDao {
    DBUtil dBUtil = null;
    public DeptDaoImpl() {
        dBUtil = new DBUtil();
    }
    @Override
    public int insertDept(Dept dept) {
        int count = 0;
        String sql = "insert into dept(deptNo,deptName,enabled)values(?,?,?)";
        Object[] obj = new Object[] { dept.getDeptNo(), dept.getDeptName(), dept.getEnabled() };
        count = dBUtil.excuteUpdate(sql, obj);
        dBUtil.release();
        return count;
    }
    @Override
    public int updateDept(Dept dept) {
        int count = 0;
        String sql = "update dept set deptNo=?, deptName=?,enabled=? where deptId=?";
        Object[] obj = new Object[] { dept.getDeptNo(), dept.getDeptName(), dept.getEnabled(), dept.getDeptId() };
        count = dBUtil.excuteUpdate(sql, obj);
        dBUtil.release();
        return count;
    }

    @Override
    public int deleteDept(int id) {
        int count = 0;
        String sql = "delete from dept where deptId=?";
        Object[] obj = new Object[] { id };
        count = dBUtil.excuteUpdate(sql, obj);
        dBUtil.release();
        return count;
    }
    @Override
    public Dept queryDeptById(int id) {
        Dept dept = new Dept();
        String sql = "select * from dept where deptId=?";
        Object[] obj = new Object[] { id };
        ResultSet rs = dBUtil.excuteQuery(sql, obj);
        try {
            while (rs.next()) {
                dept.setDeptId(rs.getInt("deptId"));
                dept.setDeptNo(rs.getString("deptNo"));
                dept.setDeptName(rs.getString("deptName"));
                dept.setEnabled(rs.getInt("enabled"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dBUtil.release();
        }
        return dept;
    }
    @Override
    public int getDeptRows() {
        int totalRows = 0;
        String sql = "select count(*) from dept";
        totalRows = dBUtil.getRecord(sql);
        dBUtil.release();
        return totalRows;
    }

    @Override
    public PageBean getDept(int page) {
        List list = new ArrayList();
        ResultSet rs = null;
        PageBean bean = new PageBean();
        bean.setPageSize(5);// 设置每页显示条数
        bean.setCurPage(page);// 设置当前页数
        bean.setToalRows(getDeptRows());// 设置总的记录数
        int offset = (bean.getCurPage() - 1) * bean.getPageSize();// 起始数据的行数
        int rows = bean.getPageSize();// 每页要显示的记录数
        try {
            String sql = "select * from dept limit " + offset + "," + rows;
            rs = dBUtil.excuteQuery(sql);
            while (rs.next()) {
                Dept dept = new Dept();
                dept.setDeptId(rs.getInt("deptId"));
                dept.setDeptNo(rs.getString("deptNo"));
                dept.setDeptName(rs.getString("deptName"));
                dept.setEnabled(rs.getInt("enabled"));
                list.add(dept);
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
    public Dept queryDeptByNo(String deptNo) {
        Dept dept = new Dept();
        String sql = "select * from dept where deptNo=?";
        Object[] obj = new Object[] { deptNo };
        ResultSet rs = dBUtil.excuteQuery(sql, obj);
        try {
            while (rs.next()) {
                dept.setDeptId(rs.getInt("deptId"));
                dept.setDeptNo(rs.getString("deptNo"));
                dept.setDeptName(rs.getString("deptName"));
                dept.setEnabled(rs.getInt("enabled"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dBUtil.release();
        }
        return dept;
    }
    @Override
    public List<Dept> getAllDept() {
        List<Dept> depts = new ArrayList<Dept>();
        ResultSet rs = null;
        try {
            String sql = "select * from dept";
            rs = dBUtil.excuteQuery(sql);
            while (rs.next()) {
                Dept dept = new Dept();
                dept.setDeptId(rs.getInt("deptId"));
                dept.setDeptNo(rs.getString("deptNo"));
                dept.setDeptName(rs.getString("deptName"));
                dept.setEnabled(rs.getInt("enabled"));
                depts.add(dept);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dBUtil.release();
        }
        return depts;
    }

    @Override
    public PageBean getSearchDept(int page, String key) {
        String enabled = null;
        if (key=="是")enabled="1";
        else if (key=="否")enabled="0";
        else enabled=key;
        String[] keys={key,key,key,enabled};
        List list = new ArrayList();
        ResultSet rs = null;
        PageBean bean = new PageBean();
        bean.setPageSize(5);// 设置每页显示条数
        bean.setCurPage(page);// 设置当前页数
        //bean.setToalRows(totalRows);// 设置搜索的记录数
        int offset = (bean.getCurPage() - 1) * bean.getPageSize();// 起始数据的行数
        int rows = bean.getPageSize();// 每页要显示的记录数
        try {
            String sql = "select count(*) from dept where (deptId like concat('%',?,'%') or deptNo like concat('%',?,'%') or deptName like concat('%',?,'%') or enabled like concat('%',?,'%'))";
            String sql2 = "select * from dept where (deptId like concat('%',?,'%') or deptNo like concat('%',?,'%') or deptName like concat('%',?,'%') or enabled like concat('%',?,'%')) limit " + offset + "," + rows;
            bean.setToalRows(dBUtil.getRecord2(sql,keys));
            System.out.println("bean.setToalRows:"+bean.getToalRows());
            rs = dBUtil.excuteQuery(sql2,keys);
            System.out.println("rs====="+rs);
            while (rs.next()) {
                Dept dept = new Dept();
                dept.setDeptId(rs.getInt("deptId"));
                dept.setDeptNo(rs.getString("deptNo"));
                dept.setDeptName(rs.getString("deptName"));
                dept.setEnabled(rs.getInt("enabled"));
                list.add(dept);
            }
            bean.setData(list);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dBUtil.release();
        }
        return bean;
        /*
        String sql = "select * from dept where 1 = 1 ";
        Set<String> keySet = condition.keySet();
        StringBuilder sb = new StringBuilder(sql);
        List<Object> params = new ArrayList<Object>();
        int i=0;
        for (String key : keySet) {
            if ("currentPage".equals(key)||"rows".equals(key)){
                continue;
            }
            String value = condition.get(key)[0];
            if (value!=null&&!"".equals(value)){
                i++;
                if (i==1){
                    sb.append(" and ("+key+" like ? ");
                    params.add("'%"+value+"%'");
                }else {
                    sb.append(" or "+key+" like ? ");
                    params.add("%"+value+"%");
                }
            }
        }
        if (i>0){
            sb.append(")");
        }
        //添加分页查询
        sb.append(" limit ?,? ");
        params.add(start);
        params.add(rows);
        sql=sb.toString();
        System.out.println(sql);
        System.out.println(params);

        return template.query(sql,new BeanPropertyRowMapper<>(Dept.class),params.toArray());
         */
    }

}
