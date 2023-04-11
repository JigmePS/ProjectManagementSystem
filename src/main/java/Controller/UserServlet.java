package Controller;

import java.io.*;
import java.sql.*;
import java.util.*;

import DBConnection.DBConnection;
import Model.Um;
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

        if (action.equalsIgnoreCase("login") ){

            String email = request.getParameter("email");
            String password = (request.getParameter("password"));
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

        //To redirect in Forgot Password Page
        if (action.equalsIgnoreCase("forgot"))

        {
            RequestDispatcher rd = request.getRequestDispatcher("UserPanel/forgot.jsp");
            rd.forward(request, response);
        }

        //To redirect in Register Page
        if (action.equalsIgnoreCase("newUsers"))

        {
            String email = request.getParameter("email");

            response.setContentType("text/html");
            request.setAttribute("email",email);
            RequestDispatcher rd = request.getRequestDispatcher("UserPanel/signup.jsp");
            rd.forward(request, response);
        }

        //To register a new account
        if (action.equalsIgnoreCase("signup"))

        {
            Um user = new Um();

            user.setEmail(request.getParameter("email"));
            user.setFullName(request.getParameter("fname"));
            user.setPassword(request.getParameter("password"));

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
        if (action.equalsIgnoreCase("login"))

        {
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }

        if (action.equalsIgnoreCase("logout"))

        {
            HttpSession s = request.getSession();
            s.invalidate();
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }

        if (action.equalsIgnoreCase("listuser") ){

            Um user = new Um();
            List<Um> userList = new UserService().getUserList();

            request.setAttribute("user", user);
            request.setAttribute("userlist", userList);
            RequestDispatcher rd = request.getRequestDispatcher("Pages/listuser.jsp");
            rd.forward(request, response);
        }

        //To redirect to User Home Page
        if (action.equalsIgnoreCase("home"))

        {
            RequestDispatcher rd = request.getRequestDispatcher("UserPanel/udash.jsp");
            rd.forward(request, response);
        }

        //To redirect to User Profile Password Page
        if (action.equalsIgnoreCase("profile"))

        {
            RequestDispatcher rd = request.getRequestDispatcher("UserPanel/profile.jsp");
            rd.forward(request, response);
        }

        if (action.equalsIgnoreCase("addProject"))

        {
            HttpSession session = request.getSession();
            int uid = (int) session.getAttribute("uid");

            Um project = new Um();

            project.setPname(request.getParameter("pname"));
            project.setId(uid);

            new UserService().insertProject(project);

            System.out.printf("Data Inserted");

            RequestDispatcher rd = request.getRequestDispatcher("UserPanel/udash.jsp");
            try {
                rd.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
        }

        if (action.equalsIgnoreCase("listyourprojects") ){

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

        if (action.equalsIgnoreCase("searchbox") ){

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

        //To redirect to Task Page
        if (action.equalsIgnoreCase("task"))

        {
            RequestDispatcher rd = request.getRequestDispatcher("UserPanel/Task.jsp");
            rd.forward(request, response);
        }

        //To redirect to Member Page
        if (action.equalsIgnoreCase("member"))

        {
            RequestDispatcher rd = request.getRequestDispatcher("UserPanel/member.jsp");
            rd.forward(request, response);
        }

        //To redirect to Setting Page
        if (action.equalsIgnoreCase("setting"))

        {
            RequestDispatcher rd = request.getRequestDispatcher("UserPanel/setting.jsp");
            rd.forward(request, response);
        }
    }
}