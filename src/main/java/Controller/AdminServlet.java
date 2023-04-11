package Controller;

import Model.Um;
import Service.UserService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "adminServlet", urlPatterns = "/admin")
public class AdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request,
                           HttpServletResponse response) throws IOException, ServletException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();

        String action = request.getParameter("page");

        if (action.equalsIgnoreCase("first") ){

            String email = request.getParameter("email");
            RequestDispatcher rd;

            response.setContentType("text/html");
            request.setAttribute("email",email);
            rd = request.getRequestDispatcher("pages/signup.jsp");
            rd.forward(request, response);

        }


    }
}