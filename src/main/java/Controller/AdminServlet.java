package Controller;

import java.io.*;
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

        if (action.equalsIgnoreCase("listuser")) {

            Um user = new Um();
            List<Um> userList = new AdminService().getUserList();

            request.setAttribute("user", user);
            request.setAttribute("userlist", userList);
            RequestDispatcher rd = request.getRequestDispatcher("Pages/listuser.jsp");
            rd.forward(request, response);
        }

        //To redirect to User Home Page
        if (action.equalsIgnoreCase("home")) {
            RequestDispatcher rd = request.getRequestDispatcher("AdminPanel/adash.jsp");
            rd.forward(request, response);
        }

        //To redirect to Users Page
        if (action.equalsIgnoreCase("user")) {
            RequestDispatcher rd = request.getRequestDispatcher("AdminPanel/suserlist.jsp");
            rd.forward(request, response);
        }

        //To redirect to Projects Page
        if (action.equalsIgnoreCase("project")) {
            RequestDispatcher rd = request.getRequestDispatcher("AdminPanel/sprojectlist.jsp");
            rd.forward(request, response);
        }

//        if (action.equalsIgnoreCase("searchbox")) {
//
//            out.print("listNprojects");
//            HttpSession session = request.getSession();
//            int uid = (int) session.getAttribute("uid");
//
//            Um user = new Um();
//
//            List<Um> projectList = new UserService().getNotProjectList(uid);
//
//            request.setAttribute("user", user);
//            request.setAttribute("plist", projectList);
//            RequestDispatcher rd = request.getRequestDispatcher("UserPanel/search.jsp");
//            rd.forward(request, response);
//        }
//
//        if (action.equalsIgnoreCase("searchproject")) {
//
//            out.print("listSprojects");
//            HttpSession session = request.getSession();
//            int uid = (int) session.getAttribute("uid");
//
//            String sresult = request.getParameter("sresult");
//
//            Um user = new Um();
//
//            List<Um> projectList = new UserService().getSearchProjectList(uid, sresult);
//
//            request.setAttribute("user", user);
//            request.setAttribute("plist", projectList);
//            RequestDispatcher rd = request.getRequestDispatcher("UserPanel/search.jsp");
//            rd.forward(request, response);
//        }

        //To logout
        if (action.equalsIgnoreCase("logout")) {
            HttpSession s = request.getSession();
            s.invalidate();
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }

    }
}