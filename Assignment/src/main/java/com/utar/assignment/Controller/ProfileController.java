package com.utar.assignment.Controller;

import com.utar.assignment.model.entity.*;
import com.utar.assignment.model.sessionbean.ClassicmodelsSessionBeanLocal;

import javax.ejb.EJB;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProfileController", value = "/ProfileController")
public class ProfileController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @EJB
    private ClassicmodelsSessionBeanLocal empbean;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        out.println(username);
        Customer customer_record = empbean.findCustomerLastName(username);
        int customerNumber = customer_record.getId();
        List<Payment> payment_record = empbean.findPaymentbyCustomerNumber((customerNumber));  // 141
        List<Order> order_record = empbean.findOrderbyCustomerNumber(customerNumber);  // all order_record from 141

        int orderdetail_size = order_record.size();  // 26 order
        List<Orderdetail> order_detail = new ArrayList<>();

        // Get all order details for order_record
        for (Order order : order_record) {
            List<Orderdetail> details = empbean.findOrderDetailsbyOrderID(order.getId());
            order_detail.addAll(details);
        }
        List<Product> product_records = empbean.getAllProductRecords();

        session.setAttribute("product_records", product_records);
        session.setAttribute("numberofOrderDetail", orderdetail_size);
        session.setAttribute("order_detail", order_detail);
        session.setAttribute("order_record", order_record);
        session.setAttribute("payment_record", payment_record);
        session.setAttribute("customer_record", customer_record);


        RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
        dispatcher.forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
