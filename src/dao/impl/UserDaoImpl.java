package dao.impl;

import dao.UserDao;
import domain.User;
import uitl.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDaoImpl implements UserDao {

    private DBUtil dbUtil;
    private Connection conn = null;
    private PreparedStatement pstm = null;
    private ResultSet rs = null;

    public UserDaoImpl() {
        this.dbUtil = new DBUtil();
    }

    @Override
    public User findOneUserInfo(User user) {
        try {
            conn=dbUtil.getConn();
            String sql = "select * from admin where username=? and password=?";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, user.getUsername());
            pstm.setString(2, user.getPassword());
            rs = pstm.executeQuery();
            if (rs.next()) {
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbUtil.close(rs,pstm,conn);
        }
        return null;
    }

    @Override
    public boolean insertOneUserInfo(User user) {
        try {
            conn=dbUtil.getConn();
            String sql = "insert into user (username,password,sex,city,birthday,tel) values(?,?,?,?,?,?)";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, user.getUsername());
            pstm.setString(2, user.getPassword());
            int i = pstm.executeUpdate();
            if (i>0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbUtil.close(null,pstm,conn);
        }
        return false;
    }

    @Override
    public int updatePwd(User user) {

        String sql = "update admin set password=? where username=?";
        Object[] obj = new Object[] { user.getPassword(), user.getUsername() };
        int count = 0;
        try {
            count = dbUtil.excuteUpdate(sql, obj);
        } finally {
            dbUtil.release();
        }
        return count;
    }

}
