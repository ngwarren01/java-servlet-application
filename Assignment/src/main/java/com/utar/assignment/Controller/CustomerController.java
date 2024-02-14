package com.utar.assignment.Controller;

import com.utar.assignment.model.entity.Customer;
import com.utar.assignment.model.entity.Employee;
import com.utar.assignment.model.sessionbean.ClassicmodelsSessionBeanLocal;
import com.utar.assignment.utilities.ValidateManageLogic;

import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "CustomerController", value = "/CustomerController")
public class CustomerController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    @EJB
    private ClassicmodelsSessionBeanLocal empbean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String id = (request.getParameter("id"));
        out.println(id);
        try {
            Customer customer = empbean.findCustomer(Integer.parseInt(id));
            request.setAttribute("customer_detail_single", customer);
            List<Employee> employee_rec = empbean.getAllEmployeeRecords();
            request.setAttribute("employee_records", employee_rec);
            //forward the update part to other people
            RequestDispatcher req = request.getRequestDispatcher("CustomerUpdate.jsp");
            req.forward(request, response);
        } catch (EJBException ex) {
            out.println("error1");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String[] address = new String[2];
        String customerNumber = request.getParameter("customerNumber");
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
        String salesEmployeeNumber = request.getParameter("salesEmployeeNumber");
        String creditLimit = request.getParameter("creditLimit");

        String profile = request.getParameter("profile");
        if(profile == null || profile.isEmpty()){
            profile = "none";
        }
        System.out.println(profile);

        System.out.println(customerNumber);
        System.out.println(customerName);
        System.out.println(contactFirstName);
        System.out.println(contactLastName);
        System.out.println(phone);
        System.out.println(addressLine1);
        System.out.println(addressLine2);
        System.out.println(city);
        System.out.println(state);
        System.out.println(postalCode);
        System.out.println(country);
        System.out.println(salesEmployeeNumber);
        System.out.println(creditLimit);


// this line is to package the whole values into one array string variable -

        String[] s = {customerNumber, customerName, contactLastName, contactFirstName,
                phone,addressLine1,addressLine2,city,state,postalCode,country,salesEmployeeNumber,creditLimit};
        try {
            //Validate if the user click update or delete !!

            if (ValidateManageLogic.validateManager(request).equals("UPDATE")) {
// call session bean updateEmployee method
                empbean.updateCustomer(s);
            }
            else if (ValidateManageLogic.validateManager(request).equals("DELETE")) {
// call session bean deleteEmployee method
                empbean.deleteCustomer(Integer.parseInt(customerNumber));
// if ADD button is clicked
            }else {
// call session bean addEmployee method
                empbean.addCustomer(s);
            }
// this line is to redirect to notify record has been updated and redirect to
// another page

            if(profile.equals("profile")){
                ValidateManageLogic.navigateJSinProfile(out);
            }
            ValidateManageLogic.navigateJS(out);
        } catch (EJBException ex) {
            out.println("error22");
        }
    }

}
