package servlet;

import domain.User;
import service.UserService;
import uitl.MD5Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.lang.reflect.Method;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {

    private UserService service = new UserService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String methodName = request.getParameter("method");
        try {
            Method method = getClass().getDeclaredMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
            method.invoke(this, request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (!request.getSession().getAttribute("code").toString().trim().equals(request.getParameter("verifycode"))){
            request.setAttribute("code_error","验证码错误");
            request.getRequestDispatcher("/admin/admin-login.jsp").forward(request,response);
            return;
        }
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        String remember = request.getParameter("remember");
        User user = service.userLogin(new User(username, MD5Util.MD5(password)));
        if (user!=null){
            if (remember!=null){
                Cookie cookie = new Cookie("auto_login",username);
                cookie.setMaxAge(30);
                response.addCookie(cookie);
            }
            LocalDateTime dateTime=LocalDateTime.now();
            DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy年MM月dd日 HH:mm:ss");
            HttpSession session = request.getSession();
            session.setAttribute("username",username);
            session.setAttribute("last_login_time", dateTime.format(dtf));
            response.sendRedirect(request.getContextPath()+"/admin/admin-index.jsp");
        }else {
            request.setAttribute("login_user",username);
            request.setAttribute("login_error","登录失败，用户名或密码错误，或用户不存在");
            request.getRequestDispatcher("/admin/admin-login.jsp").forward(request,response);
        }
    }

    private void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        User user = new User(username,password);
        if (service.userRegister(user)){
            request.getSession().setAttribute("username",username);
            response.sendRedirect(request.getContextPath()+"/admin/admin-login.jsp");
        }else {
            request.setAttribute("register_error","注册失败");
            request.getRequestDispatcher("/admin/admin-register.jsp").forward(request,response);
        }
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().invalidate();
        for (Cookie cookie : request.getCookies()) {
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }
        response.sendRedirect(request.getContextPath()+"/admin/admin-login.jsp");
    }

    private void adminChangePwd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = (String) request.getSession().getAttribute("username");
        String np1 = request.getParameter("password");
        String np2 = request.getParameter("rePassword");
        if (!np1.equals(np2)){
            request.setAttribute("pwd_update_error","密码不一致");
            request.getRequestDispatcher("/admin/admin-dept.jsp").forward(request,response);
            return;
        }
        //System.out.println(username + "," + newPassword);
        User user = new User();
        user.setUsername(username);
        user.setPassword(MD5Util.MD5(np1));
        boolean flag = service.changePwd(user);
        if (flag) {
            logout(request,response);
        }
    }
}
