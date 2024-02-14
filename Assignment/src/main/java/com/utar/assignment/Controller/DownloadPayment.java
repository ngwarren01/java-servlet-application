package com.utar.assignment.Controller;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import com.utar.assignment.model.entity.Payment;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "DownloadPayment", value = "/DownloadPayment")
public class DownloadPayment extends HttpServlet {
    @PersistenceContext(unitName = "classicmodels")
    EntityManager em;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the data from your database
        List<Payment> payments = em.createNamedQuery("Payment.findbyAll").getResultList();

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
        for (Payment payment : payments) {
            Paragraph paragraph = new Paragraph();
            paragraph.add("Customer Number: " + payment.getId().getCustomernumber() + "\n");
            paragraph.add("Check Number: " + payment.getId().getChecknumber() + "\n");
            paragraph.add("Payment Date: " + payment.getPaymentdate() + "\n");
            paragraph.add("Amount: " + payment.getAmount() + "\n\n");
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
        response.setHeader("Content-Disposition", "attachment; filename=payments_record.pdf");
        // Write the PDF file to the response output stream
        ServletOutputStream out = response.getOutputStream();
        baos.writeTo(out);
        out.flush();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
