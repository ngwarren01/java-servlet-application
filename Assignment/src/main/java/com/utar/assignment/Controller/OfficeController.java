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


@WebServlet("/OfficeController")

public class OfficeController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @EJB
    private ClassicmodelsSessionBeanLocal empbean;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String id = request.getParameter("id");
        try {
            Office office = empbean.findOffice(Integer.parseInt(id));
            request.setAttribute("office_detail_single", office);
            List<Employee> employee_rec = empbean.getAllEmployeeRecords();
            request.setAttribute("employee_records", employee_rec);
            List<Office> office_rec = empbean.getAllOfficeRecords();
            request.setAttribute("office_records", office_rec);
            RequestDispatcher req = request.getRequestDispatcher("OfficeUpdate.jsp");
            req.forward(request, response);
        } catch (EJBException ex) {
            out.println("error1");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("officeCode");
        String city = request.getParameter("city");
        String phone = request.getParameter("phone");
        String addressLine1 = request.getParameter("addressLine1");
        String addressLine2 = request.getParameter("addressLine2");
        String state = request.getParameter("state");
        String country = request.getParameter("country");
        String postalCode = request.getParameter("postalCode");
        String territory = request.getParameter("territory");
        PrintWriter out = response.getWriter();
// this line is to package the whole values into one array string variable -
// easier just pass one parameter object
        String[] s = {id, city, phone, addressLine1, addressLine2, state, country, postalCode, territory};
        try {
            if (ValidateManageLogic.validateManager(request).equals("UPDATE")) {
// call session bean updateOffice method
                empbean.updateOffice(s);
            } else if (ValidateManageLogic.validateManager(request).equals("DELETE")) {
// call session bean deleteOffice method
                empbean.deleteOffice(id);
// if ADD button is clicked
            } else {
// call session bean addOffice method
                empbean.addOffice(s);
            }
// this line is to redirect to notify record has been updated and redirect to
// another page
            ValidateManageLogic.navigateJS(out);
        } catch (EJBException ex) {
            out.println("error22");
        }
    }
}