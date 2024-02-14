package com.utar.assignment.Controller;

import com.utar.assignment.model.entity.Customer;
import com.utar.assignment.model.entity.Payment;
import com.utar.assignment.model.entity.Product;
import com.utar.assignment.model.sessionbean.ProductBean.ProductBean;
import com.utar.assignment.model.sessionbean.ProductBean.ProductBeanLocal;

import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.validation.constraints.Null;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "SingleProductPagination", value = "/SingleProductPagination")
public class SingleProductPagination extends HttpServlet {

    @EJB
    ProductBeanLocal empbean;

    //SingleProductPagination?id=

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String id = request.getParameter("id");
        System.out.println(id);

        try {
            Product product = empbean.findProduct(id);
            request.setAttribute("product", product);
            //forward the update part to other people

            RequestDispatcher req = request.getRequestDispatcher("singleProductPage.jsp");
            req.forward(request, response);

        } catch (EJBException ex) {
            System.out.println("error");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
