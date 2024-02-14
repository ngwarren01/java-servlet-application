package com.utar.assignment.model.sessionbean.ProductBean;

import com.utar.assignment.model.entity.*;

import javax.ejb.EJBException;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.List;


@Stateless
public class ProductBean implements ProductBeanLocal {

    @PersistenceContext(unitName = "classicmodels")
    EntityManager em;

    // Create New Product
    @Override
    public void addProduct(String[] s) throws EJBException {
        Product p = new Product();
        Productline pl = new Productline();

        p.setId(s[0]);
        p.setProductname(s[1]);
        pl.setId(s[2]);
        p.setProductline(pl);
        p.setProductscale(s[3]);
        p.setProductvendor(s[4]);
        p.setProductdescription(s[5]);
        p.setQuantityinstock(Integer.valueOf(s[6]));
        p.setBuyprice(BigDecimal.valueOf(Double.valueOf(s[7])));
        p.setMsrp(BigDecimal.valueOf(Double.valueOf(s[8])));
        em.persist(p);
    }

    // Get All Products in List
    @Override
    public List<Product> getAllProducts() throws EJBException {
        Query query = em.createQuery("SELECT p FROM Product p", Product.class);
        return query.getResultList();

    }

    // Get All Products from productline (Classic Cars, Motorcycles, etc)
    @Override
    public List<Product> getAllProductsFromProductline(Productline productLine) throws EJBException {
        Query query = em.createQuery("SELECT p FROM Product p WHERE p.productline = :productLine");
        query.setParameter("productLine", productLine);
        List<Product> products = query.getResultList();
        return products;
    }

    // Get The numbers of Rows of the keyword in database (Searching)
    @Override
    public int getNumberOfRows(String keyword) throws EJBException {
        Query q = null;
        if (keyword.isEmpty()) {
            q = em.createNativeQuery("SELECT COUNT(*) AS totalrow FROM classicmodels.products");
        } else {
            q = em.createNativeQuery("SELECT COUNT(*) AS totalrow from classicmodels.products WHERE concat(productcode,productname,productline) LIKE ?");
            q.setParameter(1, "%" + keyword + "%");
        }
        BigInteger results = (BigInteger) q.getSingleResult();
        int i = results.intValue();
        return i;
    }

    // Get the List of Products in the catalog (Searching, Sorting)
    public List<Product> readProducts(int currentPage, int recordsPerPage, String keyword, String sortField, String direction) throws EJBException {

        Query q = null;
        int start = 0;

        if (keyword.isEmpty() && sortField.isEmpty() && direction.isEmpty()) {
            System.out.println("In if loop");
            q = em.createQuery("SELECT p FROM Product p ORDER BY p.id");
            start = currentPage * recordsPerPage - recordsPerPage;
        } else if (keyword.isEmpty()) {
            System.out.println("In else if loop");
            q = em.createQuery("SELECT p FROM Product p ORDER BY p." + sortField + " " + direction);
            start = currentPage * recordsPerPage - recordsPerPage;
        } else {
            System.out.println("In else loop");
            q = em.createQuery("SELECT p FROM Product p WHERE p.id LIKE :keyword OR p.productname LIKE :keyword OR p.productvendor LIKE :keyword ORDER BY p." + sortField + " " + direction);
            start = currentPage * recordsPerPage - recordsPerPage;
            q.setParameter("keyword", "%" + keyword + "%");
        }
        List<Product> results = q.setFirstResult(start).setMaxResults(recordsPerPage).getResultList();
        System.out.println(results.size());
        return results;
    }

    // Gets the specific product based on productID
    @Override
    public Product findProduct(String id) throws EJBException {
        Query query = em.createQuery("SELECT p FROM Product p WHERE p.id = :id");
        query.setParameter("id", id);
        return (Product) query.getSingleResult();
    }

    @Override
    public Product getProductById(String id) throws EJBException {
        Query query = em.createNativeQuery("SELECT * FROM classicmodels.products WHERE productcode = ?", Product.class);
        query.setParameter(1, id);
        return (Product) query.getSingleResult();
    }


    // Update Products Details
    @Override
    public void updateProduct(String[] s) throws EJBException {

        Product p = findProduct(s[0]);
        Productline pl = new Productline();
        p.setId(s[0]);
        p.setProductname(s[1]);
        pl.setId(s[2]);
        p.setProductline(pl);
        p.setProductscale(s[3]);
        p.setProductvendor(s[4]);
        p.setProductdescription(s[5]);
        p.setQuantityinstock(Integer.valueOf(s[6]));
        p.setBuyprice(BigDecimal.valueOf(Double.valueOf(s[7])));
        p.setMsrp(BigDecimal.valueOf(Double.valueOf(s[8])));
        em.merge(p);
    }

    // Delete Product
    @Override
    public void deleteProduct(String id) throws EJBException {
        Product p = findProduct(id);
        List<Orderdetail> orderDetails = readOrderdetails(id, "", "ASC");
        for (Orderdetail od : orderDetails) {
            em.remove(od);
        }
        em.remove(p);
    }

    @Override
    public List<Orderdetail> readOrderdetails(String id, String keyword, String direction) throws EJBException {
        Query q= null;
        direction = " " + direction;
        if (keyword.isEmpty()) {
            q = em.createNativeQuery("SELECT * FROM classicmodels.orderdetails WHERE productCode = ? order by productcode"+ direction , Orderdetail.class);
            q.setParameter(1 , id);
            //start of the record that shows ( every 20 records then start new record )
        }else{
            q = em.createNativeQuery("SELECT * FROM classicmodels.orderdetails WHERE productCode = ? AND concat(productcode, orderlinenumber,priceeach,quantityordered) LIKE ? order by productcode"+ direction , Orderdetail.class);
            q.setParameter(1 , id);
            q.setParameter(2 ,"%" + keyword + "%");

        }
        List<Orderdetail> results = q.getResultList();
        return results;
    }


}
