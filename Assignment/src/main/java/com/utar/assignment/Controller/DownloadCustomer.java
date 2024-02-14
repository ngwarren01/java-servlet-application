package com.utar.assignment.Controller;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import com.utar.assignment.model.entity.Customer;
import com.utar.assignment.model.entity.Payment;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DownloadCustomer", value = "/DownloadCustomer")

public class DownloadCustomer extends HttpServlet {
    @PersistenceContext(unitName = "classicmodels")
    EntityManager em;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
// Get the data from your database
        List<Customer> customer = em.createNamedQuery("Customer.findbyAll").getResultList();

// Create a new PDF document
        Document document = new Document();
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        try {
            PdfWriter writer = PdfWriter.getInstance(document, baos);
        } catch (DocumentException e) {
            e.printStackTrace();
        }
        document.open();

// Add the data to the PDF document
        for (Customer c : customer) {
            Paragraph paragraph = new Paragraph();
            paragraph.add("Customer Number: " + c.getId()+ "\n");
            paragraph.add("Customer Name: " + c.getCustomername() + "\n");
            paragraph.add("Contact Last Name: " + c.getContactlastname() + "\n");
            paragraph.add("Contact First Name: " + c.getContactfirstname() + "\n");
            paragraph.add("Phone: " + c.getPhone()+ "\n");
            paragraph.add("Address Line 1: " + c.getAddressline1() + "\n");
            paragraph.add("Address Line 2: " + c.getAddressline2() + "\n");
            paragraph.add("City: " + c.getCity() + "\n");
            paragraph.add("State: " + c.getState()+ "\n");
            paragraph.add("Postal Code: " + c.getPostalcode() + "\n");
            paragraph.add("Country: " + c.getCountry() + "\n");
            if(c.getSalesrepemployeenumber() == null){
                paragraph.add("Sales Rep Employee Number : None" + "\n");
            }
            else{
                paragraph.add("Sales Rep Employee Number : " + c.getSalesrepemployeenumber().getId() + "\n");
            }
            paragraph.add("Credit Limit: " + c.getCreditlimit() + "\n\n");

            try {
                document.add(paragraph);
            } catch (DocumentException e) {
                System.out.println("ERROR HERE BRO");
                e.printStackTrace();
            }
        }

        // Close the document
        document.close();

        // Set the response headers to allow downloading of the file
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=customer_record.pdf");
        // Write the PDF file to the response output stream
        ServletOutputStream out = response.getOutputStream();
        baos.writeTo(out);
        out.flush();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
