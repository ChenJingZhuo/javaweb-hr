package servlet;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import domain.Dept;
import domain.Msg;
import domain.PageBean;
import service.DeptService;
import service.impl.DeptServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;

@WebServlet("/admin/DeptServlet")
public class DeptServlet extends HttpServlet {

    //private DeptService deptService = new DeptServiceImpl();
    private DeptService deptService;

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

    // 执行部门查询所有
    public void deptList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");
        /*String keyword = request.getParameter("keyword");
        if (keyword!=null&&keyword.length()>0){
            searchDept(request,response);
            return;
        }*/
        int curPage = 0;
        if (page == null || page.length() < 1) {// 如果page为空，则当前页为1
            curPage = 1;
        } else {
            curPage = Integer.parseInt(page);
        }
        DeptService deptService = new DeptServiceImpl();
        PageBean pageBean = deptService.findPageDept(curPage);
        // System.out.println("**********" + pageBean.getTotalPages());
        // System.out.println("**********$$$$" + pageBean.getCurPage());
        request.setAttribute("pageBean", pageBean);
        request.getRequestDispatcher("admin-dept.jsp").forward(request, response);
    }

    public void searchDept(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");
        String keyword = request.getParameter("keyword").trim();
        if (keyword==null||!(keyword.length()>0)){
            deptList(request,response);
            return;
        }
        int curPage = 0;
        if (page == null || page.length() < 1) {// 如果page为空，则当前页为1
            curPage = 1;
        } else {
            curPage = Integer.parseInt(page);
        }
        DeptService deptService = new DeptServiceImpl();
        PageBean pageBean = deptService.searchPageDept(curPage,keyword);
        // System.out.println("**********" + pageBean.getTotalPages());
        // System.out.println("**********$$$$" + pageBean.getCurPage());
        request.setAttribute("pageBean", pageBean);
        request.setAttribute("keyword", keyword);
        request.getRequestDispatcher("admin-dept.jsp").forward(request, response);
    }

    //// 执行部门查询
    //public void deptById(HttpServletRequest request, HttpServletResponse response)
    //        throws ServletException, IOException {
    //    String deptId = request.getParameter("deptId");
    //    deptService = new DeptServiceImpl();
    //    Dept dept = deptService.findDeptById(Integer.parseInt(deptId));
    //    if (dept != null) {
    //        request.setAttribute("dept", dept);
    //        request.getRequestDispatcher("admin-dept-update.jsp").forward(request, response);
    //    }
    //}

    // 执行部门查询
    public void deptById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String deptId = request.getParameter("deptId");
        deptService = new DeptServiceImpl();
        Dept dept = deptService.findDeptById(Integer.parseInt(deptId));
        Msg msg=new Msg();
        msg.add("deptId", dept.getDeptId());
        msg.add("deptNo", dept.getDeptId());
        msg.add("deptName", dept.getDeptName());
        msg.add("enabled", dept.getEnabled());
        JSONObject deptData = JSONObject.parseObject(JSON.toJSONString(msg.getMap()));
        System.out.println(deptData);
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        out.print(deptData);
        out.close();
    }

    // 执行部门添加
    public void addDept(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String deptNo = request.getParameter("deptNo");
        String deptName = request.getParameter("deptName");
        String enabled = request.getParameter("enabled");
        Dept dept = new Dept();
        dept.setDeptNo(deptNo);
        dept.setDeptName(deptName);
        dept.setEnabled(Integer.parseInt(enabled));
        deptService = new DeptServiceImpl();
        PrintWriter out = response.getWriter();
        Dept deptByNo = deptService.findDeptByNo(deptNo);
        if (deptByNo.getDeptNo()!=null){
            String jsonMsg = JSON.toJSONString(Msg.error2());
            out.print(jsonMsg);
        }else {
            boolean flag = deptService.addDept(dept);
            // Msg.success();
            if (flag) {
                //response.sendRedirect("DeptServlet?method=deptList");
                String jsonMsg = JSON.toJSONString(Msg.success());
                System.out.println(jsonMsg);
                out.print(jsonMsg);
            } else {
                String jsonMsg = JSON.toJSONString(Msg.error());
                out.print(jsonMsg);
            }
        }
        out.close();
    }

    public void findDeptByNo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String deptNo = request.getParameter("deptNo");
        deptService = new DeptServiceImpl();
        Dept dept = deptService.findDeptByNo(deptNo);
        PrintWriter out = response.getWriter();
        if (dept.getDeptNo()!=null){
            String jsonMsg = JSON.toJSONString(Msg.error2());
            out.print(jsonMsg);
        }else {
            String jsonMsg = JSON.toJSONString(Msg.success());
            out.print(jsonMsg);
        }
        out.close();
    }

    // 执行部门修改
    public void updateDept(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String deptId = request.getParameter("deptId");
        String deptNo = request.getParameter("deptNo");
        String deptName = request.getParameter("deptName");
        String enabled = request.getParameter("enabled");
        System.out.println("##########" + enabled);
        Dept dept = new Dept();
        dept.setDeptId(Integer.parseInt(deptId));
        dept.setDeptNo(deptNo);
        dept.setDeptName(deptName);
        dept.setEnabled(Integer.parseInt(enabled));
        deptService = new DeptServiceImpl();
        Dept deptByNo = deptService.findDeptByNo(deptNo);
        PrintWriter out = response.getWriter();
        if (deptByNo.getDeptNo()!=null){
            String jsonMsg = JSON.toJSONString(Msg.error2());
            out.print(jsonMsg);
        }else {
            boolean flag = deptService.modifyDept(dept);
            if (flag) {
                //response.sendRedirect("DeptServlet?method=deptList");
                String jsonMsg = JSON.toJSONString(Msg.success());
                System.out.println(jsonMsg);
                out.print(jsonMsg);
            } else {
                String jsonMsg = JSON.toJSONString(Msg.error());
                out.print(jsonMsg);
            }
        }
        out.close();
    }

    // 执行部门删除
    public void deleteDept(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String deptId = request.getParameter("deptId");
        // System.out.println("##############"+deptId);
        deptService = new DeptServiceImpl();
        boolean flag = deptService.removeDept(Integer.parseInt(deptId));
        if (flag) {
            response.sendRedirect("DeptServlet?method=deptList");
        }
    }

    // 删除所有部门
    public void deptAllDept(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String del_deptidstr = request.getParameter("del_deptidstr");
        String[] str_ids = del_deptidstr.split(",");
        deptService = new DeptServiceImpl();
        // 组装id的集合
        for (String deptId : str_ids) {
            //System.out.println("#####" + deptId);
            deptService.removeDept(Integer.parseInt(deptId));
        }
        response.sendRedirect("DeptServlet?method=deptList");
    }

}
