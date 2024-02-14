package com.utar.assignment.Controller;

import com.utar.assignment.model.entity.Customer;
import com.utar.assignment.model.entity.Order;
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

@WebServlet(name = "OrderController", value = "/OrderController")
public class OrderController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    @EJB
    private ClassicmodelsSessionBeanLocal empbean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        int id = Integer.parseInt(request.getParameter("id"));
        out.println(id);

        try {

            Order order = empbean.findOrderRecords(id);
            request.setAttribute("order", order);
            List<Customer> customer = empbean.getAllCustomerRecords();
            request.setAttribute("customer_records", customer);


            RequestDispatcher req = request.getRequestDispatcher("OrderListUpdate.jsp");
            req.forward(request, response);
        } catch (EJBException ex) {
            out.println("error");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        // Order data
        String orderNumber = request.getParameter("orderNumber");
        String orderDate = request.getParameter("orderDate");
        String requireDate = request.getParameter("requireDate");
        String shippedDate = request.getParameter("shippedDate");
        String status = request.getParameter("status");
        String comments = request.getParameter("comments");
        String customerNumber = request.getParameter("customerNumber");


// this line is to package the whole values into one array string variable -
        String[] s = {orderNumber, orderDate , requireDate, shippedDate ,status,comments,customerNumber};
        System.out.println("orderNumber : " + s[0]);
        System.out.println("orderDate : " + s[1]);
        System.out.println("requireDate : " + s[2]);
        System.out.println("shippedDate : " + s[3]);
        System.out.println("status : " + s[4]);
        System.out.println("comments : " + s[5]);
        System.out.println("customerNumber : " + s[6]);

        try {
            //Validate if the user click update or delete !!
            if (ValidateManageLogic.validateManager(request).equals("UPDATE")) {
                empbean.updateOrder(s);
            }
            else if (ValidateManageLogic.validateManager(request).equals("DELETE")) {
                empbean.deleteOrder(orderNumber);
            }
            else{
                empbean.addOrder(s);
            }
            ValidateManageLogic.navigateJS(out);
        } catch (EJBException ex) {
            out.println("error");
        }
    }
}

