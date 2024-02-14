package com.utar.assignment.Controller;

import com.utar.assignment.model.entity.User;
import com.utar.assignment.model.sessionbean.ClassicmodelsSessionBeanLocal;

import javax.ejb.EJB;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "RegisterController", value = "/RegisterController")
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @EJB
    private ClassicmodelsSessionBeanLocal empbean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        String user = request.getParameter("user");
        String password = request.getParameter("password");
        String customerName = request.getParameter("customerName");
        String contactFirstName = request.getParameter("contactFirstName");
        String contactLastName = request.getParameter("contactLastName");
        String phone = request.getParameter("phone");
        String addressLine1 = request.getParameter("addressLine1");
        String addressLine2 = request.getParameter("addressLine2");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String postalCode = request.getParameter("postalCode");
        String country = request.getParameter("country");
        String creditLimit = request.getParameter("creditLimit");

        // First check if there is duplicate username or not ?
        boolean validationCheckUser = false;
        List<User> user_records = empbean.getAllAccountRecords();
        for (User u : user_records) {
            if(user.equals((u.getId()))){
                out.print("Sorry Username has been used by other users");
                RequestDispatcher req = request.getRequestDispatcher("registerPage.jsp");
                req.include(request, response);
                validationCheckUser = true;
            }
        }
        if(validationCheckUser == false){

            int customerNumber = empbean.getMaxCustomerNumber() + 1;
            String modifiedCustomerNumber = String.valueOf(customerNumber);
            String salesEmployeeNumber = "None";
            out.println(modifiedCustomerNumber);

            String[] add_User = {user, password};
            String[] add_UserRole = {user};
            String[] add_Customer = {modifiedCustomerNumber, customerName, contactFirstName, contactLastName,
                    phone,addressLine1,addressLine2,city,state,postalCode,country,salesEmployeeNumber,creditLimit};
            try{
                empbean.addUser(add_User);
                empbean.addUserRoles(add_UserRole);
                empbean.addCustomer(add_Customer);
            }catch (Exception ex){
                out.println("ERROR IN ADDING RECORDS");
            }
            RequestDispatcher req = request.getRequestDispatcher("Login.jsp");
            req.forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
