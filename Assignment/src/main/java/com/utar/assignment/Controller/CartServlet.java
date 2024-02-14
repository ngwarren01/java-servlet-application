package com.utar.assignment.Controller;

import com.utar.assignment.model.entity.Product;
import com.utar.assignment.model.entity.Productline;
import com.utar.assignment.model.sessionbean.ProductBean.ProductBeanLocal;


import javax.ejb.EJB;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CartServlet", value = "/CartServlet")
public class CartServlet extends HttpServlet {

    @EJB
    ProductBeanLocal empbean;

    private List<Product> cart = new ArrayList<Product>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        String productId = request.getParameter("productId");

        if (action != null && action.equals("remove") && productId != null) {
            removeItem(productId);
        }

        request.setAttribute("cart", cart);
        request.getRequestDispatcher("cart.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //Get in Here first
        HttpSession session = request.getSession();
        System.out.println(session.getAttribute("firstTime"));
        if(session.getAttribute("firstTime").equals("firstTime")){
            cart = new ArrayList<Product>();
            session.setAttribute("firstTime","secondTime");
        }
        String productID = request.getParameter("productId");
        System.out.println(productID);

        Product product = empbean.findProduct(productID);

        product.setQuantityinstock(1);

        addItem(product);

        System.out.println(cart.size());

        session.setAttribute("cart",cart);

        //request.setAttribute("cart", cart);
        request.getRequestDispatcher("cart.jsp").forward(request, response);

    }

    private void addItem(Product product) {
        for (Product item : cart) {
            if (item.getId().equals(product.getId())) {
                item.setQuantityinstock(item.getQuantityinstock() + product.getQuantityinstock());
                item.setBuyprice(item.getBuyprice().add(product.getBuyprice()));
                return;
            }
        }
        cart.add(product);
    }


    private void removeItem(String productId) {
        for (Product p : cart) {
            if (p.getId().equals(productId)) {
                cart.remove(p);
                break;
            }
        }
    }


}
