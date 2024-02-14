package com.utar.assignment.Controller;

import com.utar.assignment.model.entity.Product;
import com.utar.assignment.model.sessionbean.ProductBean.ProductBeanLocal;
import com.utar.assignment.utilities.ValidateManageLogic;

import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ProductController", value = "/ProductController")
public class ProductController extends HttpServlet {

    @EJB
    private ProductBeanLocal empbean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        System.out.println(id);

        try {
            Product product = empbean.findProduct(id);
            request.setAttribute("product_detail_single", product);

            RequestDispatcher req = request.getRequestDispatcher("productUpdate.jsp");
            req.forward(request, response);

        } catch (EJBException ex) {
            System.out.println(ex.getMessage());
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        String productcode = request.getParameter("productcode");
        String productname = request.getParameter("productname");
        String productline = request.getParameter("productline");
        String productscale = request.getParameter("productscale");
        String productvendor = request.getParameter("productvendor");
        String productdescription = request.getParameter("productdescription");
        String quantityinstock = request.getParameter("quantityinstock");
        String buyprice = request.getParameter("buyprice");
        String msrp = request.getParameter("msrp");

        System.out.println(productcode);
        System.out.println(productname);
        System.out.println(productline);
        System.out.println(productscale);
        System.out.println(productvendor);
        System.out.println(productdescription);
        System.out.println(quantityinstock);
        System.out.println(buyprice);
        System.out.println(msrp);

        // this line is to package the whole values into one array string variable -

        String[] s = {productcode, productname, productline,
                      productscale,productvendor,productdescription,
                      quantityinstock,buyprice,msrp};

        try {
            //Validate if the user click update or delete !!
            if (ValidateManageLogic.validateManager(request).equals("UPDATE")) {

                System.out.println("in if loop");
                empbean.updateProduct(s);

            } else if (ValidateManageLogic.validateManager(request).equals("DELETE")) {
             // call session bean deleteEmployee method
                System.out.println("in else if loop");
                empbean.deleteProduct(productcode);
                // if ADD button is clicked
            } else {
            // call session bean addEmployee method
                System.out.println("in else loop");
                empbean.addProduct(s);
            }
        // this line is to redirect to notify record has been updated and redirect to
        // another page
            ValidateManageLogic.navigateJS(out);
        } catch (EJBException ex) {
            ((PrintWriter) out).println("error");
        }
    }

}

