package com.utar.assignment.Controller;

import com.utar.assignment.model.entity.Employee;
import com.utar.assignment.model.entity.Office;
import com.utar.assignment.model.sessionbean.ClassicmodelsSessionBeanLocal;
import com.utar.assignment.utilities.ValidateManageLogic;

import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;


@WebServlet("/EmployeeController")

public class EmployeeController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @EJB
    private ClassicmodelsSessionBeanLocal empbean;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String id = request.getParameter("id");
        try {
            Employee employee = empbean.findEmployee(Integer.parseInt(id));
            request.setAttribute("employee_detail_single", employee);
            List<Employee> employee_rec = empbean.getAllEmployeeRecords();
            request.setAttribute("employee_records", employee_rec);
            List<Office> office_rec = empbean.getAllOfficeRecords();
            request.setAttribute("office_records", office_rec);
            RequestDispatcher req = request.getRequestDispatcher("EmployeeUpdate.jsp");
            req.forward(request, response);
        } catch (EJBException ex) {
            out.println("error1");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("employeeNumber");
        String lastName = request.getParameter("lastName");
        String firstName = request.getParameter("firstName");
        String extension = request.getParameter("extension");
        String email = request.getParameter("email");
        String officeCode = request.getParameter("officeCode");
        String reportsTo = request.getParameter("reportsTo");
        String jobTitle = request.getParameter("jobTitle");
        PrintWriter out = response.getWriter();
// this line is to package the whole values into one array string variable -
// easier just pass one parameter object
        String[] s = {id, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle};
        try {
            if (ValidateManageLogic.validateManager(request).equals("UPDATE")) {
// call session bean updateEmployee method
                empbean.updateEmployee(s);
            } else if (ValidateManageLogic.validateManager(request).equals("DELETE")) {
// call session bean deleteEmployee method
                empbean.deleteEmployee(id);
// if ADD button is clicked
            } else {
// call session bean addEmployee method
                empbean.addEmployee(s);
            }
// this line is to redirect to notify record has been updated and redirect to
// another page
            ValidateManageLogic.navigateJS(out);
        } catch (EJBException ex) {
            out.println("error22");
        }
    }
}