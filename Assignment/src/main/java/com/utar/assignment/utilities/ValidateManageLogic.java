package com.utar.assignment.utilities;

import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;

public class ValidateManageLogic {
    public static String validateManager(HttpServletRequest request) {
        if(request.getParameter("UPDATE")!=null&&request.getParameter("UPDATE").equals("UPDATE")) {
            return "UPDATE";
        }
        else if (request.getParameter("DELETE") != null && request.getParameter("DELETE").equals("DELETE")) {
            return "DELETE";
        }
        return "ADD";
    }
    // this method is used to notify a user that a record has been updated and to
// redirect to another page
    public static void navigateJS(PrintWriter out) {
        out.println("<SCRIPT type=\"text/javascript\">");
        out.println("alert(\"Record has been updated and url will be redirected\")");
        out.println("window.location.assign(\"AdminPage.jsp\")");
//      out.println("window.location.assign(\"PaymentDetailLogic?currentPage=1&recordsPerPage=20&keyword=&direction=ASC\")");
        out.println("</SCRIPT>");
    }

    public static void navigateJSinProfile(PrintWriter out) {
        out.println("<SCRIPT type=\"text/javascript\">");
        out.println("alert(\"Profile has been updated\")");
        out.println("window.location.assign(\"index.jsp\")");
//      out.println("window.location.assign(\"PaymentDetailLogic?currentPage=1&recordsPerPage=20&keyword=&direction=ASC\")");
        out.println("</SCRIPT>");
    }
}
