package com.utar.assignment.Controller;

import com.utar.assignment.model.entity.Product;
import com.utar.assignment.model.entity.Productline;
import com.utar.assignment.model.sessionbean.ProductBean.ProductBeanLocal;

import javax.ejb.EJB;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

import static java.lang.Integer.parseInt;

@WebServlet(name = "ProductLineController", value = "/ProductLineController")
public class ProductLineController extends HttpServlet {

    private static final int PRODUCTS_PER_PAGE = 20;

    @EJB
    private ProductBeanLocal empbean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("in ProductLineController DOget");
        int productID = parseInt(request.getParameter("id"));
        System.out.println(productID);
        List<Product> productList = getProductbyId(productID);
        System.out.println("Product list size: " + productList.size());
        request.setAttribute("productList",productList);

        // forward the request to the JSP page for display
        RequestDispatcher dispatcher = request.getRequestDispatcher("productLine.jsp");
        dispatcher.forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }



    public List<Product> getProductbyId(int productID) {

        Productline productline = new Productline();
        List<Product> product = null;

        switch (productID) {
            case 1:
                productline.setId("Classic Cars");
                product = empbean.getAllProductsFromProductline(productline);
                break;

            case 2:
                productline.setId("Motorcycles");
                product = empbean.getAllProductsFromProductline(productline);
                break;

            case 3:
                productline.setId("Planes");
                product = empbean.getAllProductsFromProductline(productline);
                break;

            case 4:
                productline.setId("Ships");
                product = empbean.getAllProductsFromProductline(productline);
                break;

            case 5:
                productline.setId("Trains");
                product = empbean.getAllProductsFromProductline(productline);
                break;

            case 6:
                productline.setId("Trucks and Buses");
                product = empbean.getAllProductsFromProductline(productline);
                break;

            case 7:
                productline.setId("Vintage Cars");
                product = empbean.getAllProductsFromProductline(productline);
                break;

            case 8:
                product = empbean.getAllProducts();
                break;
        }
        return product;
    }
}
