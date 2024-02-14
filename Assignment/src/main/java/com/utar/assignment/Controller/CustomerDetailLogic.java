package com.utar.assignment.Controller;
import com.utar.assignment.model.entity.Customer;
import com.utar.assignment.model.entity.Employee;
import com.utar.assignment.model.entity.Payment;
import com.utar.assignment.model.sessionbean.ClassicmodelsSessionBeanLocal;

import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "CustomerDetailLogic", value = "/CustomerDetailLogic")

public class CustomerDetailLogic extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @EJB
    private ClassicmodelsSessionBeanLocal empbean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int nOfPages = 0;
        int currentPage = Integer.valueOf(request.getParameter("currentPage"));
        int recordsPerPage = Integer.valueOf(request.getParameter("recordsPerPage"));
        String keyword = request.getParameter("keyword");
        String direction = request.getParameter("direction");
        PrintWriter out = response.getWriter();

        //Page Navigation
        try {
            //Get Total Records from Payment DB
            int rows = empbean.getNumberOfRowsCustomer(keyword);
            nOfPages = rows / recordsPerPage;

            //Determine number of pages needed - Ensure that Data is sufficient of 1 page
            if (rows % recordsPerPage != 0) {
                nOfPages++;
            }
            if (currentPage > nOfPages && nOfPages != 0) {
                currentPage = nOfPages;
            }
            List<Customer> customer_rec = empbean.readCustomer(currentPage, recordsPerPage, keyword, direction);
            List<Employee> employee_rec = empbean.getAllEmployeeRecords();
            request.setAttribute("customer_records", customer_rec);
            request.setAttribute("employee_records", employee_rec);

            List<Customer> customer_count = empbean.getCountofCustomerRecords();
            request.setAttribute("customer_count", customer_count);

            List<Customer> creditLimit = empbean.getAverageCreditLimit();
            request.setAttribute("creditLimit", creditLimit);

        } catch (EJBException ex) {
            out.println("Prob");
        }
        request.setAttribute("nOfPages", nOfPages);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("recordsPerPage", recordsPerPage);
        request.setAttribute("keyword", keyword);
        request.setAttribute("direction", direction);


        RequestDispatcher dispatcher = request.getRequestDispatcher("CustomerDetail.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
