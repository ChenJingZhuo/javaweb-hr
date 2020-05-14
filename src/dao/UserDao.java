package dao;

import domain.User;

/**
 * 用户操作的DAO
 */

public interface UserDao {
    /**
     * 查询一条用户信息
     * @param user
     * @return
     */
    User findOneUserInfo(User user);

    /**
     * 添加一条用户信息
     * @param user
     * @return
     */
    boolean insertOneUserInfo(User user);

    /**
     * 修改用户密码
     * @param user
     * @return
     */
    public int updatePwd(User user);
}
