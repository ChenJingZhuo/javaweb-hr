package uitl;

import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class DBUtil {
    String user = null;
    String password = null;
    String url = null;
    String driver = null;

    private Connection conn = null;
    private PreparedStatement pstm = null;
    private ResultSet rs = null;

    // 获得连接
    public Connection getConn() {
        try {
            // 通过反射获得输入流
            InputStream in = DBUtil.class.getClassLoader().getResourceAsStream("database.properties");
            // 获得属性
            Properties props = new Properties();
            props.load(in);
            // 获得属性值
            driver = props.getProperty("driver");
            url = props.getProperty("url");
            user = props.getProperty("user");
            password = props.getProperty("password");
            // System.out.println(driver+","+url+","+","+user+","+password);
            Class.forName(driver);
            conn = DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    /**
     * 执行查询
     * @return返回记录
     */
    public int getRecord(String sql) {
        int totalRecord = 0;
        try {
            conn = this.getConn();
            pstm = conn.prepareStatement(sql);
            rs = pstm.executeQuery();
            while (rs.next()) {
                totalRecord = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalRecord;
    }

    /**
     * 执行搜索总数
     * @return返回记录
     */
    public int getRecord2(String sql, Object[] keys) {
        int totalRecord = 0;
        try {
            conn = this.getConn();
            pstm = conn.prepareStatement(sql);
            prepareStateSql(keys,keys.length);
            rs = pstm.executeQuery();
            while (rs.next()) {
                totalRecord = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalRecord;
    }

    /*
     * 执行查询
     * @sql
     * @return 返回rs
     */
    public ResultSet excuteQuery(String sql) {
        try {
            conn = this.getConn();
            pstm = conn.prepareStatement(sql);
            rs = pstm.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }

    /**
     * 执行带参数的查询
     * @sql
     * @Obj
     * @return 返回rs
     */
    public ResultSet excuteQuery(String sql, Object[] obj) {
        try {
            conn = this.getConn();
            pstm = conn.prepareStatement(sql);
            // 装载参数
            prepareStateSql(obj, obj.length);
            rs = pstm.executeQuery();
        } catch (SQLException e) {
            System.out.println("查询操作失败");
        }
        return rs;
    }

    /**
     * 执行插入、更新、删除操作
     * @param sql
     * @param obj
     * @return 受影响的行数
     */
    public int excuteUpdate(String sql, Object[] obj) {
        int count = 0;
        try {
            conn = this.getConn();
            pstm = conn.prepareStatement(sql);
            // 装载参数
            prepareStateSql(obj, obj.length);
            count = pstm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("插入、更新、删除操作失败");
        }
        return count;
    }

    /**
     * 实现装载prepareStatement
     * @param obj
     * @param length
     */
    public void prepareStateSql(Object[] obj, int length) throws SQLException {
        for (int i = 0; i < length; i++) {
            if (obj[i] == null) {
                obj[i] = false;
            }
            pstm.setObject(i + 1, obj[i]);
        }
    }

    public void close(ResultSet rs,PreparedStatement pstm,Connection conn) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 关闭连接
    public void release() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
