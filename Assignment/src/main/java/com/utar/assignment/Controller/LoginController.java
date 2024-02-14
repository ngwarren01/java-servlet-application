package com.utar.assignment.Controller;

import com.utar.assignment.model.entity.Customer;
import com.utar.assignment.model.entity.Product;
import com.utar.assignment.model.entity.User;
import com.utar.assignment.model.sessionbean.ClassicmodelsSessionBeanLocal;

import javax.ejb.EJB;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "LoginController", value = "/LoginController")
public class LoginController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    @EJB
    private ClassicmodelsSessionBeanLocal empbean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("cart", null);
        RequestDispatcher req = request.getRequestDispatcher("Login.jsp");
        session.invalidate();
        req.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean invalidLogin = false;
        List<User> lists_customer = empbean.getAllAccountRecords();

        for (User u : lists_customer) {
            if(username.equals(u.getId()) && password.equals(u.getPassword())){
                if(username.equals("admin")){
                    HttpSession session = request.getSession();
                    session.setAttribute("username", username);
                    RequestDispatcher req = request.getRequestDispatcher("AdminPage.jsp");
                    req.forward(request, response);
                }
                else {
                    HttpSession session = request.getSession();
                    session.setAttribute("username", username);
                    session.setAttribute("firstTime","firstTime");
                    RequestDispatcher req = request.getRequestDispatcher("index.jsp");
                    req.forward(request, response);
                }
            }
        }
        if(invalidLogin == false){
            response.setContentType("text/html");
            out.print("Sorry Username or Password Incorrect");
            RequestDispatcher req = request.getRequestDispatcher("Login.jsp");
            req.include(request, response);

        }

    }
}
