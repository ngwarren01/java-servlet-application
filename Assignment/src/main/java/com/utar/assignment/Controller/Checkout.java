package com.utar.assignment.Controller;

import com.utar.assignment.model.entity.Customer;
import com.utar.assignment.model.entity.Order;
import com.utar.assignment.model.entity.Product;
import com.utar.assignment.model.sessionbean.ClassicmodelsSessionBeanLocal;

import javax.ejb.EJB;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Random;

@WebServlet(name = "Checkout", value = "/Checkout")
public class Checkout extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @EJB
    private ClassicmodelsSessionBeanLocal empbean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        LocalDate today = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate date5DaysFromNow = LocalDate.now().plusDays(5);


        String username = (String) session.getAttribute("username");
        double totalPrice = (double) session.getAttribute("totalPrice");
        Customer customer_record = empbean.findCustomerLastName(username);

        // Add Order Record First
        int customerNumber = customer_record.getId();
        int newOrderID = empbean.getMaxOrderID();
        int modifiedOrderID = newOrderID + 1;
        String orderDate = today.format(formatter);
        String requiredDate = date5DaysFromNow.format(formatter);
        String shippedDate = "";
        String Status = "In Process";
        String comments = "";

        String[] s = {String.valueOf(modifiedOrderID), orderDate, requiredDate, shippedDate,
        Status,comments, String.valueOf(customerNumber)};
        empbean.addOrder(s);

        // Add Order Details
        List<Product> product = (List<Product>) session.getAttribute("cart");
        System.out.println("Amount of items = " + product.size());
        for(int x = 0 ; x < product.size(); x++) {
            String productCode = product.get(x).getId();
            int quantityOrdered = product.get(x).getQuantityinstock();
            //If more than 1 Quantity
            System.out.println(product.get(x).getBuyprice());
            double priceEach;
            if (quantityOrdered > 1) {
                priceEach = product.get(x).getBuyprice().doubleValue() / quantityOrdered;
                System.out.println("Inside COnd " + priceEach);
            } else {
                priceEach = product.get(x).getBuyprice().doubleValue();
                System.out.println("Outside COnd " + priceEach);

            }
            int orderLineNumber = 5;

            String[] s2 = {String.valueOf(modifiedOrderID), productCode, String.valueOf(quantityOrdered), String.valueOf(priceEach), String.valueOf(orderLineNumber)};
            empbean.addOrderdetail(s2);
        }

            //Add Payment
            //CheckNumber Gen
            Random random = new Random();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < 2; i++) {
                char c = (char)(random.nextInt(26) + 'A');
                sb.append(c);
            }
            for (int i = 0; i < 5; i++) {
                char c = (char)(random.nextInt(10) + '0');
                sb.append(c);
            }
            String checkNumber = sb.toString();
            String paymentDate = today.format(formatter);
            String amount = String.valueOf(totalPrice);
            String[] s3 = {String.valueOf(customerNumber),checkNumber,paymentDate,amount};
            empbean.addPayment(s3);

            //Reset Cart
            session.setAttribute("firstTime","firstTime");
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);




    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
