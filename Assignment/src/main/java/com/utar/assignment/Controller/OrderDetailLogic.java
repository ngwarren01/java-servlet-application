    package com.utar.assignment.Controller;

    import com.utar.assignment.model.entity.Orderdetail;
    import com.utar.assignment.model.entity.Product;
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
    import java.util.ArrayList;
    import java.util.List;

    @WebServlet(name = "OrderDetailLogic", value = "/OrderDetailLogic")
    public class OrderDetailLogic extends HttpServlet {


        private static final long serialVersionUID = 1L;
        @EJB
        private ClassicmodelsSessionBeanLocal empbean;

        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            PrintWriter out = response.getWriter();
            int id = Integer.parseInt(request.getParameter("id"));
            String keyword = request.getParameter("keyword");
            String direction = request.getParameter("direction");
            out.println(id);

                List<Orderdetail> lists = empbean.readOrderdetails(id,keyword,direction);
                if (lists.size() != 0) {
                    System.out.println("notnull");
                    request.setAttribute("order_detail_single", lists);
                    // other logic here
                }else{
                    // If the list is null, create an empty list instead
                    List<Orderdetail> emptyList = new ArrayList<Orderdetail>();
                    System.out.println("null");
                    request.setAttribute("order_detail_single", emptyList);
                }

                List<Product> products = empbean.getAllProductRecords();
                request.setAttribute("product_list",products);

                out.println(lists);


            request.setAttribute("keyword", keyword);
            request.setAttribute("direction", direction);
            request.setAttribute("id",request.getParameter("id"));
            out.println("Keyword : " + keyword);
            out.println("Direction : " + direction);
            out.println("ID: " + id);

            RequestDispatcher dispatcher = request.getRequestDispatcher("OrderDetailList.jsp");
            dispatcher.forward(request, response);

        }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
        }
    }



