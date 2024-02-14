package com.utar.assignment.model.sessionbean;

import com.utar.assignment.model.entity.*;

import javax.ejb.EJBException;


import javax.ejb.Local;
import java.util.List;

@Local
public interface ClassicmodelsSessionBeanLocal {
    /* Read All Records*/
    public List<Payment> getAllPaymentRecords() throws EJBException;
    public List<Customer> getAllCustomerRecords() throws EJBException;
    public List<Employee> getAllEmployeeRecords() throws EJBException;
    public List<User> getAllAccountRecords() throws EJBException;
    public List<Product> getAllProductRecords() throws EJBException;
    public List<Payment> getCountofPaymentRecords() throws EJBException;
    public List<Customer> getCountofCustomerRecords() throws EJBException;
    public List<Payment> getSumAmount() throws EJBException;
    public List<Customer> getAverageCreditLimit() throws EJBException;
    public int getMaxCustomerNumber() throws EJBException;
    public int getMaxOrderID() throws EJBException;
    public List<Office> getAllOfficeRecords() throws EJBException;
    public List<Order> getAllOrderRecords() throws EJBException;
    public Product findProduct(String id) throws EJBException;
    public List<Orderdetail> getAllOrderdetailRecords() throws EJBException;


    /* Read Single Records*/
    public Payment findPayment(String id) throws EJBException;
    public List<Payment> findPaymentbyCustomerNumber(int id) throws EJBException;
    public List<Orderdetail> findOrderDetailsbyOrderID(int id) throws EJBException;
    public Customer findCustomer(int id) throws EJBException;
    public Customer findCustomerLastName(String id) throws EJBException;
    public Employee findEmployee(int id) throws EJBException;
    public List<Order> findOrderbyCustomerNumber(int id) throws EJBException;
    public Office findOffice(int id) throws EJBException;
    public Order findOrderRecords(int id) throws EJBException;
    public Orderdetail findOrderDetailsRecords(String productCode, int id) throws EJBException;

    /* Update Single Records*/
    public void updatePayment(String[] s) throws EJBException;
    public void updateCustomer(String[] s) throws EJBException;
    public void updateEmployee(String[] s) throws EJBException;
    public void updateOffice(String[] s) throws EJBException;
    public void updateOrder(String[] s) throws EJBException;
    public void updateOrderdetail(String[] s) throws EJBException;

    /* Delete Single Records*/
    public void deletePayment(String id) throws EJBException;
    public void deleteCustomer(int id) throws EJBException;
    public void deleteEmployee(String id) throws EJBException;
    public void deleteOffice(String id) throws EJBException;
    public void deleteOrder(String id) throws EJBException;
    public void deleteOrderdetail(String productCode, int id) throws EJBException;



    /* Add Single Records */
    public void addPayment(String[] s) throws EJBException;
    public void addCustomer(String[] s) throws EJBException;
    public void addUser(String[] s) throws EJBException;
    public void addUserRoles(String[] s) throws EJBException;
    public void addEmployee(String[] s) throws EJBException;
    public void addOffice(String[] s) throws EJBException;
    public void addOrder(String[] s) throws EJBException;
    public void addOrderdetail(String[] s) throws EJBException;

    /* Find the total records of the DB */
    public int getNumberOfRowsPayment(String keyword) throws EJBException;
    public int getNumberOfRowsCustomer(String keyword) throws EJBException;
    public int getNumberOfRowsEmployee(String keyword) throws EJBException;
    public int getNumberOfRowsOffice(String keyword) throws EJBException;
    public int getNumberOfRowsOrder(String keyword) throws EJBException;

    /*Filtered Payment Results*/
    public List<Payment> readPayment(int currentPage, int recordsPerPage, String keyword, String direction) throws EJBException;
    public List<Customer> readCustomer(int currentPage, int recordsPerPage, String keyword, String direction) throws EJBException;
    public List<Employee> readEmployee(int currentPage, int recordsPerPage, String keyword, String direction) throws EJBException;
    public List<Office> readOffice(int currentPage, int recordsPerPage, String keyword, String direction) throws EJBException;
    public List<Order> readOrder(int currentPage, int recordsPerPage, String keyword, String direction) throws EJBException;
    public List<Orderdetail> readOrderdetails(int id,String keyword, String direction) throws EJBException;
}
