package Controller;

import java.io.*;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.*;
import java.util.*;

import DBConnection.DBConnection;
import Hashing.HashPassword;
import Model.Um;
import Service.AdminService;
import Service.UserService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@MultipartConfig
@WebServlet(name = "userServlet", urlPatterns = "/user")
public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws IOException, ServletException {

        doPost(request, response);

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        String action = request.getParameter("page");

        //login
        if (action.equalsIgnoreCase("login")) {

            String email = request.getParameter("email");
            String password = (HashPassword.hashPassword(request.getParameter("password")));
            System.out.println(email + " " + password + " ");

            Um um = new UserService().getUser(email, password);
            if (um != null) {
                HttpSession session = request.getSession();
                session.setAttribute("uid", um.getId());
                session.setAttribute("fname", um.getFullName());
                session.setAttribute("email", email);
                request.setAttribute("msg", "Login Successful!");
                if (um.getAdmin()) {
                    session.setMaxInactiveInterval(0);
                    RequestDispatcher rd = request.getRequestDispatcher("AdminPanel/adash.jsp");
                    rd.forward(request, response);
                } else {
                    RequestDispatcher rd = request.getRequestDispatcher("UserPanel/udash.jsp");
                    rd.forward(request, response);
                }
            } else {
                request.setAttribute("msg", "Invalid username or password");
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
            }
        }

        //To redirect to Forgot Password Page
        if (action.equalsIgnoreCase("forgot")) {
            RequestDispatcher rd = request.getRequestDispatcher("UserPanel/forgot.jsp");
            rd.forward(request, response);
        }

        //To redirect to Register Page
        if (action.equalsIgnoreCase("newUsers")) {
            String email = request.getParameter("email");

            response.setContentType("text/html");
            request.setAttribute("email", email);
            RequestDispatcher rd = request.getRequestDispatcher("UserPanel/signup.jsp");
            rd.forward(request, response);
        }

        //To register a new account
        if (action.equalsIgnoreCase("signup")) {
            Um user = new Um();

            user.setEmail(request.getParameter("email"));
            user.setFullName(request.getParameter("fname"));
            user.setPassword(HashPassword.hashPassword(request.getParameter("password")));

            new UserService().insertUser(user);

            System.out.printf("Data Inserted");

            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            try {
                rd.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
        }

        // send to login page
        if (action.equalsIgnoreCase("logins")) {
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }

        //To redirect to User Home Page
        if (action.equalsIgnoreCase("home")) {
            RequestDispatcher rd = request.getRequestDispatcher("UserPanel/udash.jsp");
            rd.forward(request, response);
        }

        if (action.equalsIgnoreCase("listyourprojects")) {

            out.print("listYprojects");
            HttpSession session = request.getSession();
            int uid = (int) session.getAttribute("uid");

            Um user = new Um();

            List<Um> projectList = new UserService().getYourProjectList(uid);

            request.setAttribute("user", user);
            request.setAttribute("yourplist", projectList);
            RequestDispatcher rd = request.getRequestDispatcher("UserPanel/yourprojects.jsp");
            rd.forward(request, response);
        }

        //To redirect to Add Project Page
        if (action.equalsIgnoreCase("addp")) {
            RequestDispatcher rd = request.getRequestDispatcher("UserPanel/addproject.jsp");
            rd.forward(request, response);
        }

        //To add project
        if (action.equalsIgnoreCase("addproject")) {
            HttpSession session = request.getSession();
            int uid = (int) session.getAttribute("uid");

            Um project = new Um();

            project.setPname(request.getParameter("pname"));
            project.setId(uid);

            new UserService().insertProject(project);

            System.out.print("Data Inserted");

            Um user = new Um();

            List<Um> projectList = new UserService().getYourProjectList(uid);

            request.setAttribute("user", user);
            request.setAttribute("yourplist", projectList);

            RequestDispatcher rd = request.getRequestDispatcher("UserPanel/yourprojects.jsp");
            try {
                rd.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
        }

        //To redirect to Task Page
        if (action.equalsIgnoreCase("task")) {
            int pid = Integer.parseInt(request.getParameter("pid"));
            String pname = request.getParameter("pname");
            String pstatus = request.getParameter("pstatus");

            out.print("listtasks");

            HttpSession session = request.getSession();
            session.setAttribute("pid", pid);
            session.setAttribute("pname", pname);
            session.setAttribute("pstatus", pstatus);
            session.setAttribute("option", "Tasks");

            Um user = new Um();

            List<Um> taskList = new UserService().getTaskList(pid);

            request.setAttribute("user", user);
            request.setAttribute("tlist", taskList);

            List<Um> projectList = new UserService().getProjectDetail(pid);

            request.setAttribute("pdetail", projectList);

            RequestDispatcher rd = request.getRequestDispatcher("UserPanel/task.jsp");
            rd.forward(request, response);
        }

        //To redirect to Task Page
        if (action.equalsIgnoreCase("tasks")) {
            HttpSession session = request.getSession();
            int pid = (int) session.getAttribute("pid");
            session.setAttribute("option", "Tasks");

            Um user = new Um();

            List<Um> taskList = new UserService().getTaskList(pid);

            request.setAttribute("user", user);
            request.setAttribute("tlist", taskList);

            List<Um> projectList = new UserService().getProjectDetail(pid);

            request.setAttribute("pdetail", projectList);
            RequestDispatcher rd = request.getRequestDispatcher("UserPanel/task.jsp");
            rd.forward(request, response);
        }

        //download
//        if (action.equalsIgnoreCase("download")) {
//            String filePath = request.getParameter("filePath").replaceAll("\\\\", "/");
//            System.out.println(filePath);
//            File downloadFile = new File(filePath);
//            FileInputStream inputStream = new FileInputStream(downloadFile);
//            ServletOutputStream outputStream = response.getOutputStream();
//            response.setContentType("application/octet-stream");
//            response.setContentLength((int) downloadFile.length());
//            response.setHeader("Content-Disposition", "attachment; filename=\"" + downloadFile.getName() + "\"");
//            byte[] buffer = new byte[4096];
//            int bytesRead = -1;
//            while ((bytesRead = inputStream.read(buffer)) != -1) {
//                outputStream.write(buffer, 0, bytesRead);
//            }
//            inputStream.close();
//            outputStream.close();
//        }

        //To redirect to Add Task Page
        if (action.equalsIgnoreCase("addt")) {
            RequestDispatcher rd = request.getRequestDispatcher("UserPanel/addtask.jsp");
            rd.forward(request, response);
        }

        //To add task
        if (action.equalsIgnoreCase("addtask")) {
            Um task = new Um();

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

            task.setTdate(request.getParameter("date"));
            task.setTname(request.getParameter("tname"));
            task.setTaskMember(request.getParameter("tmember"));

            task.setDeliverable(filePath);
            task.setImge(imagePath);

            task.setPid(pid);

            new UserService().insertTask(task);
            System.out.print("Data Inserted");


            Um user = new Um();

            List<Um> taskList = new UserService().getTaskList(pid);

            request.setAttribute("user", user);
            request.setAttribute("tlist", taskList);

            List<Um> projectList = new UserService().getProjectDetail(pid);

            request.setAttribute("pdetail", projectList);

            RequestDispatcher rd = request.getRequestDispatcher("UserPanel/task.jsp");
            try {
                rd.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
        }

        //To redirect to Edit Task Page
        if (action.equalsIgnoreCase("editt")) {
            int tid = Integer.parseInt(request.getParameter("tid"));

            HttpSession session = request.getSession();
            int pid = (int) session.getAttribute("pid");
            session.setAttribute("tid", tid);

            Um user = new Um();

            List<Um> taskList = new UserService().getTask(tid);

            request.setAttribute("user", user);
            request.setAttribute("tlist", taskList);

            RequestDispatcher rd = request.getRequestDispatcher("UserPanel/edittask.jsp");
            rd.forward(request, response);
        }

        //To edit task
        if (action.equalsIgnoreCase("edittask")) {

            Um task = new Um();

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
            int tid = (int) session.getAttribute("tid");
            int pid = (int) session.getAttribute("pid");

            task.setTdate(request.getParameter("date"));
            task.setTname(request.getParameter("tname"));
            task.setTaskMember(request.getParameter("tmember"));
            task.setDeliverable(filePath);
            task.setImge(imagePath);

            task.setTid(tid);

            new UserService().editTask(task);

            System.out.print("Data Edited");

            Um user = new Um();

            List<Um> taskList = new UserService().getTaskList(pid);

            request.setAttribute("user", user);
            request.setAttribute("tlist", taskList);

            List<Um> projectList = new UserService().getProjectDetail(pid);

            request.setAttribute("pdetail", projectList);

            RequestDispatcher rd = request.getRequestDispatcher("UserPanel/task.jsp");
            try {
                rd.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
        }

        //To delete task
        if (action.equalsIgnoreCase("deletetask")) {

            int id = Integer.parseInt(request.getParameter("tid"));

            HttpSession session = request.getSession();
            int pid = (int) session.getAttribute("pid");

            Um task = new Um();

            new UserService().deleteTask(id);

            System.out.print("Data Deleted");

            List<Um> taskList = new UserService().getTaskList(pid);

            request.setAttribute("tlist", taskList);

            List<Um> projectList = new UserService().getProjectDetail(pid);

            request.setAttribute("pdetail", projectList);
            RequestDispatcher rd = request.getRequestDispatcher("UserPanel/task.jsp");
            rd.forward(request, response);
        }

        //To redirect to Setting Page
        if (action.equalsIgnoreCase("setting")) {
            HttpSession session = request.getSession();
            int pid = (int) session.getAttribute("pid");
            session.setAttribute("option", "Settings");

            Um user = new Um();

            List<Um> projectList = new UserService().getProjectDetail(pid);

            request.setAttribute("user", user);
            request.setAttribute("pdetail", projectList);
            RequestDispatcher rd = request.getRequestDispatcher("UserPanel/settings.jsp");
            rd.forward(request, response);
        }

        //To redirect to Edit Project Page
        if (action.equalsIgnoreCase("editp")) {
            HttpSession session = request.getSession();
            int pid = (int) session.getAttribute("pid");

            Um user = new Um();

            List<Um> projectList = new UserService().getProjectDetail(pid);

            request.setAttribute("user", user);
            request.setAttribute("pdetail", projectList);
            RequestDispatcher rd = request.getRequestDispatcher("UserPanel/editproject.jsp");
            rd.forward(request, response);
        }

        //To edit project
        if (action.equalsIgnoreCase("editproject")) {
            HttpSession session = request.getSession();
            int pid = (int) session.getAttribute("pid");
            String pname = request.getParameter("pname");
            String status = request.getParameter("status");

            Um pdetail = new Um();

            pdetail.setPname(pname);
            pdetail.setPstatus(status);

            pdetail.setPid(pid);

            new UserService().editProject(pdetail);

            List<Um> projectList = new UserService().getProjectDetail(pid);

            request.setAttribute("pdetail", projectList);

            RequestDispatcher rd = request.getRequestDispatcher("UserPanel/settings.jsp");
            try {
                rd.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
        }

        //To delete project
        if (action.equalsIgnoreCase("deleteproject")) {
            HttpSession session = request.getSession();
            int pid = (int) session.getAttribute("pid");
            int uid = (int) session.getAttribute("uid");

            UserService userService = new UserService();
            userService.deleteProject(pid);
            userService.deleteProjectTasks(pid);

            System.out.print("Data Deleted");

            List<Um> projectList = new UserService().getYourProjectList(uid);

            request.setAttribute("yourplist", projectList);
            RequestDispatcher rd = request.getRequestDispatcher("UserPanel/yourprojects.jsp");
            rd.forward(request, response);
        }

        if (action.equalsIgnoreCase("searchbox")) {

            out.print("listNprojects");
            HttpSession session = request.getSession();
            int uid = (int) session.getAttribute("uid");

            Um user = new Um();

            List<Um> projectList = new UserService().getNotProjectList(uid);

            request.setAttribute("user", user);
            request.setAttribute("plist", projectList);
            RequestDispatcher rd = request.getRequestDispatcher("UserPanel/search.jsp");
            rd.forward(request, response);
        }

        if (action.equalsIgnoreCase("searchproject")) {

            out.print("listSprojects");
            HttpSession session = request.getSession();
            int uid = (int) session.getAttribute("uid");

            String sresult = request.getParameter("sresult");

            Um user = new Um();

            List<Um> projectList = new UserService().getSearchProjectList(uid, sresult);

            request.setAttribute("user", user);
            request.setAttribute("plist", projectList);
            RequestDispatcher rd = request.getRequestDispatcher("UserPanel/search.jsp");
            rd.forward(request, response);
        }

        //To redirect to Search Project Task Page
        if (action.equalsIgnoreCase("sptask")) {
            int pid = Integer.parseInt(request.getParameter("pid"));
            String pname = request.getParameter("pname");

            out.print("listtasks");

            HttpSession session = request.getSession();
            session.setAttribute("pid", pid);
            session.setAttribute("pname", pname);

            Um user = new Um();

            List<Um> staskList = new UserService().getSearchProjectTaskList(pid);

            request.setAttribute("user", user);
            request.setAttribute("stlist", staskList);

            RequestDispatcher rd = request.getRequestDispatcher("UserPanel/sprojecttask.jsp");
            rd.forward(request, response);
        }

        //To redirect to Add Task Page
        if (action.equalsIgnoreCase("addpst")) {
            RequestDispatcher rd = request.getRequestDispatcher("UserPanel/addsprojecttask.jsp");
            rd.forward(request, response);
        }

        //To add task
        if (action.equalsIgnoreCase("addpstask")) {

            Um task = new Um();

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

            task.setTdate(request.getParameter("date"));
            task.setTname(request.getParameter("tname"));
            task.setTaskMember(request.getParameter("tmember"));
            task.setDeliverable(filePath);
            task.setImge(imagePath);

            task.setPid(pid);

            new UserService().insertTask(task);

            System.out.print("Data Inserted");

            Um user = new Um();

            List<Um> staskList = new UserService().getSearchProjectTaskList(pid);

            request.setAttribute("user", user);
            request.setAttribute("stlist", staskList);

            RequestDispatcher rd = request.getRequestDispatcher("UserPanel/sprojecttask.jsp");
            try {
                rd.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
        }

        //To redirect to User Profile Page
        if (action.equalsIgnoreCase("profile")) {
            RequestDispatcher rd = request.getRequestDispatcher("UserPanel/profile.jsp");
            rd.forward(request, response);
        }

        //To redirect to Change Password Page
        if (action.equalsIgnoreCase("editup")) {
            RequestDispatcher rd = request.getRequestDispatcher("UserPanel/changepassword.jsp");
            rd.forward(request, response);
        }

        //To change password
        if (action.equalsIgnoreCase("changepassword")) {
            Um user = new Um();

            HttpSession session = request.getSession();
            int uid = (int) session.getAttribute("uid");

            user.setPassword(HashPassword.hashPassword(request.getParameter("tpassword")));
            user.setNewPassword(HashPassword.hashPassword(request.getParameter("npassword")));

            new UserService().changePassword(user, uid);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("UserPanel/profile.jsp");
            requestDispatcher.forward(request, response);
        }

        //To logout
        if (action.equalsIgnoreCase("logout")) {
            HttpSession s = request.getSession();
            s.invalidate();
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }

    }
}