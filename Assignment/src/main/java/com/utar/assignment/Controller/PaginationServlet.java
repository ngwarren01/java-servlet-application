package com.utar.assignment.Controller;

import com.utar.assignment.model.entity.Product;
import com.utar.assignment.model.sessionbean.ProductBean.ProductBeanLocal;

import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "PaginationServlet", value = "/PaginationServlet")
public class PaginationServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    @EJB
    private ProductBeanLocal empbean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int nOfPages= 0;
        int currentPage = Integer.valueOf(request.getParameter("currentPage"));
        int recordsPerPage = Integer.valueOf(request.getParameter("recordsPerPage"));
        String keyword = request.getParameter("keyword");
        String direction = request.getParameter("direction");
        String sortField = request.getParameter("sortField");


        try {
            int rows = empbean.getNumberOfRows(keyword);
            nOfPages = rows / recordsPerPage;
            if (rows % recordsPerPage != 0) {
                nOfPages++;
            }
            if (currentPage > nOfPages && nOfPages != 0) {
                currentPage = nOfPages;
            }

            List<Product> lists = empbean.readProducts(currentPage, recordsPerPage,keyword,sortField,direction);
            request.setAttribute("products", lists);
            System.out.println(lists.size());
        } catch (EJBException ex) {
            ex.printStackTrace();
        }

        try {
            request.setAttribute("nOfPages", nOfPages);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("recordsPerPage", recordsPerPage);
            request.setAttribute("keyword",keyword);
            request.setAttribute("direction", direction);
            request.setAttribute("sortField",sortField);

            HttpSession session = request.getSession();
            if(session.getAttribute("username").equals("admin")){
                RequestDispatcher dispatcher = request.getRequestDispatcher("productDetails_admin_admin.jsp");
                dispatcher.forward(request, response);
            }
            RequestDispatcher dispatcher = request.getRequestDispatcher("productDetails.jsp");
            System.out.println("before dispatcher");
            dispatcher.forward(request, response);
            System.out.println("after dispatcher");
        } catch (ServletException | IOException e) {
            // Handle the exception
            e.printStackTrace();
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
