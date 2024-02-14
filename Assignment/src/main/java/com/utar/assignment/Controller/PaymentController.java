package com.utar.assignment.Controller;

import com.utar.assignment.model.entity.Customer;
import com.utar.assignment.model.entity.Payment;
import com.utar.assignment.model.sessionbean.ClassicmodelsSessionBeanLocal;
import com.utar.assignment.utilities.ValidateManageLogic;

import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.List;

@WebServlet(name = "PaymentController", value = "/PaymentController")
public class PaymentController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    @EJB
    private ClassicmodelsSessionBeanLocal empbean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String id = request.getParameter("id");
        String currentCustomerNumber = request.getParameter("currentCustomerNumber");
        out.println(id);
        try {
            Payment payment = empbean.findPayment(id);
            request.setAttribute("payment_detail_single", payment);
            //forward the update part to other people

            List<Customer> lists_customer = empbean.getAllCustomerRecords();
            request.setAttribute("customer_records", lists_customer);

            /* For original CustomerNumber (Before Change) */
            request.setAttribute("currentCustomerNumber", currentCustomerNumber);



            RequestDispatcher req = request.getRequestDispatcher("PaymentUpdate.jsp");
            req.forward(request, response);
        } catch (EJBException ex) {
            out.println("error1");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String customerNumber = request.getParameter("customerNumber");
        String checkNumber = request.getParameter("checkNumber");
        String paymentDate = request.getParameter("paymentDate");
        String amount = request.getParameter("amount");

// this line is to package the whole values into one array string variable -

        String[] s = {customerNumber, checkNumber, paymentDate, amount};
        try {
            //Validate if the user click update or delete !!
            if (ValidateManageLogic.validateManager(request).equals("UPDATE")) {
// call session bean updateEmployee method
                empbean.updatePayment(s);
            }
            else if (ValidateManageLogic.validateManager(request).equals("DELETE")) {
// call session bean deleteEmployee method
                empbean.deletePayment(checkNumber);
// if ADD button is clicked
            }else {
// call session bean addEmployee method
                empbean.addPayment(s);
            }
// this line is to redirect to notify record has been updated and redirect to
// another page
        ValidateManageLogic.navigateJS(out);
        } catch (EJBException ex) {
                out.println("error");
            }
        }
    }


