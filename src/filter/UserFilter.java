package filter;

import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter("/*")
public class UserFilter implements javax.servlet.Filter {

    private static String encoding = "utf-8";
    private static final String[] pass = {
            "CheckCodeServlet", "UserServlet","admin-login.jsp", "admin-register.jsp",
            ".png", ".jpg", ".jpeg", ".gif", ".css", ".js"
    };

    public void doFilter(javax.servlet.ServletRequest req, javax.servlet.ServletResponse resp, javax.servlet.FilterChain chain) throws javax.servlet.ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        request.setCharacterEncoding(encoding);
        String[] str = request.getServletPath().split("/");
        String str2 = str[str.length-1].trim();
        System.out.println(str2);
        for (String s : pass) {
            if (str2.contains(s)){
                if (str2.equals("admin-login.jsp")){
                    Cookie[] cookies = request.getCookies();
                    Cookie cookie = null;
                    if (cookies != null) {
                        for (Cookie cookie1 : cookies) {
                            if (cookie1.getName().equals("auto_login")) {
                                cookie = cookie1;
                            }
                        }
                    }

                    if (cookie == null) { // 放行
                        chain.doFilter(request, response);
                        return;
                    } else {
                        request.getSession().setAttribute("username",cookie.getValue());
                        response.sendRedirect(request.getContextPath()+"/admin/admin-index.jsp");
                        //request.getRequestDispatcher("/admin/admin-index.jsp").forward(request,response);
                        return;
                    }
                }

                if (!str2.endsWith(".jsp")){
                    chain.doFilter(request, response);
                    return;
                }
            }
        }
        String username = (String) request.getSession().getAttribute("username");
        if (username != null) {   // 放行
            chain.doFilter(request, response);
            return;
        }else {
            response.sendRedirect(request.getContextPath()+"/admin/admin-login.jsp");
        }
    }

    public void init(javax.servlet.FilterConfig config) throws javax.servlet.ServletException {
        if (encoding != null) {
            encoding = "utf-8";
        }
    }

    public void destroy() {
        encoding = null;
    }

}
