package com.utar.assignment.model.sessionbean.ProductBean;

import com.utar.assignment.model.entity.Orderdetail;
import com.utar.assignment.model.entity.Product;
import com.utar.assignment.model.entity.Productline;
import com.utar.assignment.model.entity.User;

import javax.ejb.EJBException;
import javax.ejb.Local;
import java.util.List;

@Local
public interface ProductBeanLocal {

    //CRUD Functions

    //Create
    public void addProduct(String[] s) throws EJBException;

    //Read
    public List<Product> getAllProducts() throws EJBException;
    public List<Product> getAllProductsFromProductline(Productline productLine) throws EJBException;
    public int getNumberOfRows(String keyword) throws EJBException;
    public List<Product> readProducts(int currentPage, int recordsPerPage, String keyword,String sortField, String direction) throws EJBException;
    public Product findProduct(String id) throws EJBException;
    public Product getProductById(String id) throws EJBException;


    //Update
    public void updateProduct(String[] s) throws EJBException;

    //Delete
    public void deleteProduct(String id) throws EJBException;
    public List<Orderdetail> readOrderdetails(String id, String keyword, String direction) throws EJBException;







}
