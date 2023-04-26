package Controller;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.*;
import java.util.*;

import DBConnection.DBConnection;
import Model.Um;
import Service.AdminService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@MultipartConfig
@WebServlet(name = "adminServlet", urlPatterns = "/admin")
public class AdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws IOException, ServletException {

        doPost(request, response);

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        String action = request.getParameter("page");

        //To redirect to User Home Page
        if (action.equalsIgnoreCase("home")) {
            RequestDispatcher rd = request.getRequestDispatcher("AdminPanel/adash.jsp");
            rd.forward(request, response);
        }

        //To redirect to Users Page
        if (action.equalsIgnoreCase("userlist")) {

            out.print("ListUsers");

            Um user = new Um();

            List<Um> userList = new AdminService().getUList();

            request.setAttribute("user", user);
            request.setAttribute("ulist", userList);
            RequestDispatcher rd = request.getRequestDispatcher("AdminPanel/suserlist.jsp");
            rd.forward(request, response);
        }

        if (action.equalsIgnoreCase("searchuser")) {

            out.print("SearchUsers");
            ;

            String sresult = request.getParameter("sresult");

            Um user = new Um();

            List<Um> userList = new AdminService().getSearchUser(sresult);

            request.setAttribute("user", user);
            request.setAttribute("ulist", userList);
            RequestDispatcher rd = request.getRequestDispatcher("AdminPanel/suserlist.jsp");
            rd.forward(request, response);
        }

        //To redirect to Edit User Page
        if (action.equalsIgnoreCase("editu")) {
            int uid = Integer.parseInt(request.getParameter("uid"));

            Um user = new Um();

            List<Um> userList = new AdminService().getUserDetail(uid);

            request.setAttribute("user", user);
            request.setAttribute("udetail", userList);
            RequestDispatcher rd = request.getRequestDispatcher("AdminPanel/useredit.jsp");
            rd.forward(request, response);
        }

        //To edit user
        if (action.equalsIgnoreCase("edituser")) {
            int uid = Integer.parseInt(request.getParameter("uid"));
            String fname = request.getParameter("fname");
            String email = request.getParameter("email");

            Um user = new Um();

            user.setFullName(fname);
            user.setEmail(email);

            user.setId(uid);

            new AdminService().editUser(user);

            List<Um> userList = new AdminService().getUList();

            request.setAttribute("ulist", userList);
            RequestDispatcher rd = request.getRequestDispatcher("AdminPanel/suserlist.jsp");
            rd.forward(request, response);
        }

        //To redirect to Projects Page
        if (action.equalsIgnoreCase("projectlist")) {

            out.print("ListProjects");

            Um user = new Um();

            List<Um> projectList = new AdminService().getPList();

            request.setAttribute("user", user);
            request.setAttribute("plist", projectList);
            RequestDispatcher rd = request.getRequestDispatcher("AdminPanel/sprojectlist.jsp");
            rd.forward(request, response);
        }

        //Search project
        if (action.equalsIgnoreCase("searchproject")) {

            out.print("SearchUsers");
            ;

            String sresult = request.getParameter("sresult");

            Um user = new Um();

            List<Um> projectList = new AdminService().getSearchProject(sresult);

            request.setAttribute("user", user);
            request.setAttribute("plist", projectList);
            RequestDispatcher rd = request.getRequestDispatcher("AdminPanel/sprojectlist.jsp");
            rd.forward(request, response);
        }

        //To redirect to Edit Project Page
        if (action.equalsIgnoreCase("editp")) {
            int pid = Integer.parseInt(request.getParameter("pid"));

            Um user = new Um();

            List<Um> projectList = new AdminService().getProjectDetail(pid);

            request.setAttribute("user", user);
            request.setAttribute("pdetail", projectList);
            RequestDispatcher rd = request.getRequestDispatcher("AdminPanel/projectedit.jsp");
            rd.forward(request, response);
        }

        //To edit project
        if (action.equalsIgnoreCase("editproject")) {
            int pid = Integer.parseInt(request.getParameter("pid"));
            String pname = request.getParameter("pname");
            String status = request.getParameter("status");

            Um project = new Um();

            project.setPname(pname);
            project.setPstatus(status);

            project.setPid(pid);

            new AdminService().editProject(project);

            List<Um> projectList = new AdminService().getPList();

            request.setAttribute("plist", projectList);
            RequestDispatcher rd = request.getRequestDispatcher("AdminPanel/sprojectlist.jsp");
            rd.forward(request, response);
        }

        //To delete project
        if (action.equalsIgnoreCase("deleteproject"))
        {
            int id = Integer.parseInt(request.getParameter("id"));

            AdminService adminService = new AdminService();
            adminService.deleteProject(id);
            adminService.deleteProjectTasks(id);

            List<Um> projectList = new AdminService().getPList();

            request.setAttribute("plist", projectList);
            RequestDispatcher rd = request.getRequestDispatcher("AdminPanel/sprojectlist.jsp");
            rd.forward(request, response);
        }

        //To redirect to Tasks Page
        if (action.equalsIgnoreCase("tasklist")) {

            out.print("ListTasks");
            int pid = Integer.parseInt(request.getParameter("pid"));
            String pname = request.getParameter("pname");

            HttpSession session = request.getSession();
            session.setAttribute("pid", pid);
            session.setAttribute("pname", pname);

            Um user = new Um();

            List<Um> taskList = new AdminService().getTList(pid);

            request.setAttribute("user", user);
            request.setAttribute("tlist", taskList);

            List<Um> projectList = new AdminService().getProjectDetail(pid);

            request.setAttribute("pdetail", projectList);
            RequestDispatcher rd = request.getRequestDispatcher("AdminPanel/ptasklist.jsp");
            rd.forward(request, response);
        }

        //To redirect to Edit Task Page
        if (action.equalsIgnoreCase("editt")) {
            int tid = Integer.parseInt(request.getParameter("tid"));

            HttpSession session = request.getSession();
            session.setAttribute("tid", tid);

            Um user = new Um();

            List<Um> taskList = new AdminService().getTaskDetail(tid);

            request.setAttribute("user", user);
            request.setAttribute("tdetail", taskList);
            RequestDispatcher rd = request.getRequestDispatcher("AdminPanel/taskedit.jsp");
            rd.forward(request, response);
        }

        //To edit task
        if (action.equalsIgnoreCase("edittask")) {

            Part deliverable = request.getPart("deliverable");
            String file = null;
            String filePath = null;
            if (deliverable != null) {
                file = Paths.get(deliverable.getSubmittedFileName()).getFileName().toString();
                InputStream fileContent = deliverable.getInputStream();
                Files.copy(fileContent, Paths.get("C:\\Users\\inozu\\workspace\\OperisProject\\src\\main\\webapp\\upload\\deliverable\\" + file), StandardCopyOption.REPLACE_EXISTING);
                filePath = "C:\\Users\\inozu\\workspace\\OperisProject\\src\\main\\webapp\\upload\\deliverable\\" + file;
            }

            Part img = request.getPart("image");
            String image = null;
            String imagePath = null;
            if (img != null) {
                image = Paths.get(img.getSubmittedFileName()).getFileName().toString();
                InputStream imageContent = img.getInputStream();
                Files.copy(imageContent, Paths.get("C:\\Users\\inozu\\workspace\\OperisProject\\src\\main\\webapp\\upload\\image\\" + image), StandardCopyOption.REPLACE_EXISTING);
                imagePath = "C:\\Users\\inozu\\workspace\\OperisProject\\src\\main\\webapp\\upload\\image\\" + image;
            }

            HttpSession session = request.getSession();
            int pid = (int) session.getAttribute("pid");
            int tid = Integer.parseInt(request.getParameter("tid"));

            String tdate = request.getParameter("date");
            String tname = request.getParameter("tname");
            String tmember = request.getParameter("tmember");

            Um task = new Um();

            task.setTdate(tdate);
            task.setTname(tname);
            task.setTaskMember(tmember);
            task.setDeliverable(filePath);
            task.setImge(imagePath);

            task.setTid(tid);

            new AdminService().editTask(task);

            List<Um> taskList = new AdminService().getTList(pid);

            request.setAttribute("tlist", taskList);
            RequestDispatcher rd = request.getRequestDispatcher("AdminPanel/ptasklist.jsp");
            rd.forward(request, response);
        }

        //To delete task
        if (action.equalsIgnoreCase("deletetask"))
        {
            HttpSession session = request.getSession();
            int pid = (int) session.getAttribute("pid");
            int tid = Integer.parseInt(request.getParameter("tid"));

            AdminService adminService = new AdminService();
            adminService.deleteTask(tid);

            List<Um> taskList = new AdminService().getTList(pid);

            request.setAttribute("tlist", taskList);

            List<Um> projectList = new AdminService().getProjectDetail(pid);

            request.setAttribute("pdetail", projectList);
            RequestDispatcher rd = request.getRequestDispatcher("AdminPanel/ptasklist.jsp");
            rd.forward(request, response);
        }

        //To logout
        if (action.equalsIgnoreCase("logout")) {
            HttpSession session = request.getSession();
            session.invalidate();
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }

    }
}