package com.utar.assignment.Controller;

import com.utar.assignment.model.entity.Employee;
import com.utar.assignment.model.entity.Office;
import com.utar.assignment.model.sessionbean.ClassicmodelsSessionBeanLocal;

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

@WebServlet(name = "EmployeeDetailLogic", value = "/EmployeeDetailLogic")

public class EmployeeDetailLogic extends HttpServlet {
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
            int rows = empbean.getNumberOfRowsEmployee(keyword);
            nOfPages = rows / recordsPerPage;

            //Determine number of pages needed - Ensure that Data is sufficient of 1 page
            if (rows % recordsPerPage != 0) {
                nOfPages++;
            }
            if (currentPage > nOfPages && nOfPages != 0) {
                currentPage = nOfPages;
            }
            List<Employee> employee_rec = empbean.readEmployee(currentPage, recordsPerPage, keyword, direction);
            request.setAttribute("employee_records", employee_rec);
            List<Office> office_rec = empbean.getAllOfficeRecords();
            request.setAttribute("office_records", office_rec);

        } catch (EJBException ex) {
            out.println("Prob");
        }
        request.setAttribute("nOfPages", nOfPages);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("recordsPerPage", recordsPerPage);
        request.setAttribute("keyword", keyword);
        request.setAttribute("direction", direction);


        RequestDispatcher dispatcher = request.getRequestDispatcher("EmployeeDetail.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
