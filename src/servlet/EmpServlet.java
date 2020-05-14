package servlet;

import domain.PageBean;
import service.DeptService;
import service.EmpService;
import service.impl.DeptServiceImpl;
import service.impl.EmpServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;

@WebServlet("/admin/EmpServlet")
public class EmpServlet extends HttpServlet {
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
        doPost(request, response);
    }

    private void empList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String page = request.getParameter("page");
        int curPage = 0;
        if (page == null || page.length() < 1) {// 如果page为空，则当前页为1
            curPage = 1;
        } else {
            curPage = Integer.parseInt(page);
        }
        EmpService empService = new EmpServiceImpl();
        PageBean pageBean = empService.findPageEmp(curPage);
        // System.out.println("**********" + pageBean.getTotalPages());
        // System.out.println("**********$$$$" + pageBean.getCurPage());
        request.setAttribute("pageBean", pageBean);
        request.getRequestDispatcher("admin-emp.jsp").forward(request, response);
    }

}
