package com.utar.assignment.model.sessionbean;

import com.utar.assignment.model.entity.*;

import javax.ejb.EJBException;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.List;

@Stateless
public class ClassmodelsSessionBean implements ClassicmodelsSessionBeanLocal {
    @PersistenceContext(unitName = "classicmodels")
    EntityManager em;

    @Override
    public List<Payment> getAllPaymentRecords() throws EJBException {
        return em.createNamedQuery("Payment.findbyAll").getResultList();
    }

    @Override
    public List<Customer> getAllCustomerRecords() throws EJBException {
        return em.createNamedQuery("Customer.findbyAll").getResultList();
    }

    @Override
    public List<Employee> getAllEmployeeRecords() throws EJBException {
        return em.createNamedQuery("Employee.findbyAll").getResultList();
    }

    @Override
    public List<User> getAllAccountRecords() throws EJBException {
        return em.createNamedQuery("User.findbyAll").getResultList();
    }

    @Override
    public List<Product> getAllProductRecords() throws EJBException {
        return em.createNamedQuery("Product.findbyAll").getResultList();
    }

    @Override
    public List<Payment> getCountofPaymentRecords() throws EJBException {
        return em.createNamedQuery("Payment.countAll").getResultList();
    }

    @Override
    public List<Customer> getCountofCustomerRecords() throws EJBException {
        return em.createNamedQuery("Customer.countAll").getResultList();
    }

    @Override
    public List<Payment> getSumAmount() throws EJBException {
        return em.createNamedQuery("Payment.sumAll").getResultList();
    }

    @Override
    public List<Customer> getAverageCreditLimit() throws EJBException {
        return em.createNamedQuery("Customer.averageCreditLimit").getResultList();
    }

    @Override
    public int getMaxCustomerNumber() throws EJBException {
        Query query = em.createNamedQuery("Customer.findMaxCusNum");
        Integer id = (Integer) query.getSingleResult();
        int maxId = id.intValue();
        return maxId;
    }

    @Override
    public int getMaxOrderID() throws EJBException {
        Query query = em.createNamedQuery("Order.findMaxOrderId");
        Integer id = (Integer) query.getSingleResult();
        int maxId = id.intValue();
        return maxId;
    }

    @Override
    public List<Office> getAllOfficeRecords() throws EJBException {
        return em.createNamedQuery("Office.findbyAll").getResultList();
    }

    @Override
    public List<Order> getAllOrderRecords() throws EJBException {
        return em.createNamedQuery("Order.findbyAll").getResultList();
    }

    @Override
    public Product findProduct(String id) throws EJBException {
        Query query = em.createNamedQuery("Product.findbyId");
        query.setParameter("id", id);
        return (Product) query.getSingleResult();
    }

    @Override
    public List<Orderdetail> getAllOrderdetailRecords() throws EJBException {
        return em.createNamedQuery("Orderdetail.findbyAll").getResultList();
    }

    @Override
    public int getNumberOfRowsPayment(String keyword) throws EJBException{
        Query query = null;
        if(keyword.isEmpty()) {
            query = em.createNativeQuery("SELECT COUNT(*) AS totalrow FROM classicmodels.payments");
        }
        else{
            query = em.createNativeQuery("SELECT COUNT(*) AS totalrow from classicmodels.payments WHERE concat(checknumber,customernumber) LIKE ?");
            query.setParameter(1, "%" + keyword + "%");
        }
        BigInteger results = (BigInteger) query.getSingleResult();
        int i = results.intValue();
        return i;
    }

    @Override
    public int getNumberOfRowsCustomer(String keyword) throws EJBException{
        Query query = null;
        if(keyword.isEmpty()) {
            query = em.createNativeQuery("SELECT COUNT(*) AS totalrow FROM classicmodels.customers");
        }
        else{
            query = em.createNativeQuery("SELECT COUNT(*) AS totalrow from classicmodels.customers WHERE concat(customernumber,customername) LIKE ?");
            query.setParameter(1, "%" + keyword + "%");
        }
        BigInteger results = (BigInteger) query.getSingleResult();
        int i = results.intValue();
        return i;
    }

    @Override
    public int getNumberOfRowsEmployee(String keyword) throws EJBException {
        Query query = null;
        if(keyword.isEmpty()) {
            query = em.createNativeQuery("SELECT COUNT(*) AS totalrow FROM classicmodels.employees");
        }
        else{
            query = em.createNativeQuery("SELECT COUNT(*) AS totalrow from classicmodels.employees WHERE concat(employeenumber,lastname,firstname) LIKE ?");
            query.setParameter(1, "%" + keyword + "%");
        }
        BigInteger results = (BigInteger) query.getSingleResult();
        int i = results.intValue();
        return i;
    }

    @Override
    public int getNumberOfRowsOffice(String keyword) throws EJBException {
        Query query = null;
        if(keyword.isEmpty()) {
            query = em.createNativeQuery("SELECT COUNT(*) AS totalrow FROM classicmodels.offices");
        }
        else{
            query = em.createNativeQuery("SELECT COUNT(*) AS totalrow from classicmodels.offices WHERE concat(officeCode) LIKE ?");
            query.setParameter(1, "%" + keyword + "%");
        }
        BigInteger results = (BigInteger) query.getSingleResult();
        int i = results.intValue();
        return i;
    }

    @Override
    public int getNumberOfRowsOrder(String keyword) throws EJBException {
        Query query = null;
        if(keyword.isEmpty()) {
            query = em.createNativeQuery("SELECT COUNT(*) AS totalrow FROM classicmodels.orders");
        }
        else{
            query = em.createNativeQuery("SELECT COUNT(*) AS totalrow from classicmodels.orders WHERE concat(orderNumber) LIKE ?");
            query.setParameter(1, "%" + keyword + "%");
        }
        BigInteger results = (BigInteger) query.getSingleResult();
        int i = results.intValue();
        return i;
    }

    @Override
    public List<Payment> readPayment(int currentPage, int recordsPerPage, String keyword, String direction) throws EJBException {
        Query q = null;
        int start = 0;
        direction = " " + direction;
        if (keyword.isEmpty()) {
            q = em.createNativeQuery("SELECT * FROM classicmodels.payments order by amount" + direction, Payment.class);
            //start of the record that shows ( every 20 records then start new record )
            start = currentPage * recordsPerPage - recordsPerPage;
        }
        else {
            q = em.createNativeQuery("SELECT * from classicmodels.payments WHERE concat(checknumber,customernumber) LIKE ? order by amount" + direction,Payment.class);
            start = currentPage * recordsPerPage - recordsPerPage;
            q.setParameter(1, "%" + keyword + "%");
        }
        //use of setMaxResults --> to replace LIMIT & setFirstResult --> to replace OFFSET
        List<Payment> results = q.setFirstResult(start).setMaxResults(recordsPerPage).getResultList();
        return results;
    }

    @Override
    public List<Customer> readCustomer(int currentPage, int recordsPerPage, String keyword, String direction) throws EJBException {
        Query q = null;
        int start = 0;
        direction = " " + direction;
        if (keyword.isEmpty()) {
            q = em.createNativeQuery("SELECT * FROM classicmodels.customers order by customernumber" + direction, Customer.class);
            //start of the record that shows ( every 20 records then start new record )
            start = currentPage * recordsPerPage - recordsPerPage;
        }
        else {
            q = em.createNativeQuery("SELECT * from classicmodels.customers WHERE concat(customernumber,customername) LIKE ? order by customernumber" + direction,Customer.class);
            start = currentPage * recordsPerPage - recordsPerPage;
            q.setParameter(1, "%" + keyword + "%");
        }
        //use of setMaxResults --> to replace LIMIT & setFirstResult --> to replace OFFSET
        List<Customer> results = q.setFirstResult(start).setMaxResults(recordsPerPage).getResultList();
        return results;
    }

    @Override
    public List<Employee> readEmployee(int currentPage, int recordsPerPage, String keyword, String direction) throws EJBException {
        Query q = null;
        int start = 0;
        direction = " " + direction;
        if (keyword.isEmpty()) {
            q = em.createNativeQuery("SELECT * FROM classicmodels.employees order by employeenumber" + direction, Employee.class);
            //start of the record that shows ( every 20 records then start new record )
            start = currentPage * recordsPerPage - recordsPerPage;
        }
        else {
            q = em.createNativeQuery("SELECT * from classicmodels.employees WHERE concat(employeenumber,lastname,firstname) LIKE ? order by employeenumber" + direction,Employee.class);
            start = currentPage * recordsPerPage - recordsPerPage;
            q.setParameter(1, "%" + keyword + "%");
        }
        //use of setMaxResults --> to replace LIMIT & setFirstResult --> to replace OFFSET
        List<Employee> results = q.setFirstResult(start).setMaxResults(recordsPerPage).getResultList();
        return results;
    }

    @Override
    public List<Office> readOffice(int currentPage, int recordsPerPage, String keyword, String direction) throws EJBException {
        Query q = null;
        int start = 0;
        direction = " " + direction;
        if (keyword.isEmpty()) {
            q = em.createNativeQuery("SELECT * FROM classicmodels.offices order by officecode" + direction, Office.class);
            //start of the record that shows ( every 20 records then start new record )
            start = currentPage * recordsPerPage - recordsPerPage;
        }
        else {
            q = em.createNativeQuery("SELECT * from classicmodels.offices WHERE concat(officecode) LIKE ? order by officecode" + direction,Office.class);
            start = currentPage * recordsPerPage - recordsPerPage;
            q.setParameter(1, "%" + keyword + "%");
        }
        //use of setMaxResults --> to replace LIMIT & setFirstResult --> to replace OFFSET
        List<Office> results = q.setFirstResult(start).setMaxResults(recordsPerPage).getResultList();
        return results;
    }

    @Override
    public List<Order> readOrder(int currentPage, int recordsPerPage, String keyword, String direction) throws EJBException {
        Query q = null;
        int start = 0;
        direction = " " + direction;
        if (keyword.isEmpty()) {
            q = em.createNativeQuery("SELECT * FROM classicmodels.orders order by ordernumber"+ direction , Order.class);
            start = currentPage * recordsPerPage - recordsPerPage;
        }else{

            q = em.createNativeQuery("SELECT * from classicmodels.orders WHERE concat(CAST(ordernumber AS VARCHAR(10)),orderdate,requireddate,shippeddate,status,comments,customernumber) LIKE ? order by ordernumber"+ direction ,Order.class);
            start = currentPage * recordsPerPage - recordsPerPage;
            q.setParameter(1, "%" + keyword + "%");
        }
        List<Order> results = q.setFirstResult(start).setMaxResults(recordsPerPage).getResultList();
        return results;
    }

    @Override
    public List<Orderdetail> readOrderdetails(int id, String keyword, String direction) throws EJBException {
        Query q= null;
        direction = " " + direction;
        if (keyword.isEmpty()) {
            q = em.createNativeQuery("SELECT * FROM classicmodels.orderdetails WHERE ordernumber = ? order by productcode"+ direction , Orderdetail.class);
            q.setParameter(1 , id);
            //start of the record that shows ( every 20 records then start new record )
        }else{
            q = em.createNativeQuery("SELECT * FROM classicmodels.orderdetails WHERE ordernumber = ? AND concat(productcode, orderlinenumber,priceeach,quantityordered) LIKE ? order by productcode"+ direction , Orderdetail.class);
            q.setParameter(1 , id);
            q.setParameter(2 ,"%" + keyword + "%");

        }
        List<Orderdetail> results = q.getResultList();
        return results;
    }

    @Override
    public Payment findPayment(String id) throws EJBException {
        Query query = em.createNamedQuery("Payment.findbyId");
        query.setParameter("id", id);
        return (Payment) query.getSingleResult();

    }

    @Override
    public List<Payment> findPaymentbyCustomerNumber(int id) throws EJBException {
        Query query = em.createNamedQuery("Payment.findbyCustomerNumber");
        query.setParameter("id", id);
        return query.getResultList();
    }

    @Override
    public List<Orderdetail> findOrderDetailsbyOrderID(int id) throws EJBException {
        Query query = em.createNamedQuery("Orderdetail.findOrderDetailsbyOrderID");
        query.setParameter("id", id);
        return query.getResultList();
    }


    /* find Customer By their ID which is primary key (Unique)*/
    @Override
    public Customer findCustomer(int id) throws EJBException {
        Query query = em.createNamedQuery("Customer.findbyId");
        query.setParameter("id", id);
        return (Customer) query.getSingleResult();

    }

    @Override
    public Customer findCustomerLastName(String id) throws EJBException {
        Query query = em.createNamedQuery("Customer.findbyLastName");
        query.setParameter("id", id);
        return (Customer) query.getSingleResult();
    }

    @Override
    public Employee findEmployee(int id) throws EJBException {
    Query query = em.createNamedQuery("Employee.findbyId");
        query.setParameter("id", id);
        return (Employee) query.getSingleResult();
    }

    @Override
    public List<Order> findOrderbyCustomerNumber(int id) throws EJBException {
        Query query = em.createNamedQuery("Order.findByCustomerNumber");
        query.setParameter("id", id);
        return query.getResultList();
    }

    @Override
    public Office findOffice(int id) throws EJBException {
        Query query = em.createNamedQuery("Office.findbyId");
        query.setParameter("id", id);
        return (Office) query.getSingleResult();
    }

    @Override
    public Order findOrderRecords(int id) throws EJBException {
        Query query = em.createNamedQuery("Order.findbyId");
        query.setParameter("id", id);
        return (Order) query.getSingleResult();
    }

    @Override
    public Orderdetail findOrderDetailsRecords(String productCode, int id) throws EJBException {
        Query query = em.createNamedQuery("Orderdetail.findbyProductCode");
        query.setParameter("productCode", productCode);
        query.setParameter("id", id);
        return (Orderdetail) query.getSingleResult();
    }

    @Override
    public void updatePayment(String[] s) throws EJBException {
        /*System.out.println(s[0]);         // New CustomerNumber*/
        /*System.out.println(s[1]);         // CheckNumber*/
        /*System.out.println(s[2]);         // Date*/
        /*System.out.println(s[3]);         // Amount*/

        Payment payment = findPayment(s[1]);
        PaymentId paymentId = payment.getId();
        Customer customer = findCustomer(Integer.parseInt(s[0]));

        payment.setCustomer(customer);

        paymentId.setCustomernumber(Integer.valueOf(s[0]));
        payment.setId(paymentId);

        payment.setPaymentdate(s[2]);
        payment.setAmount(BigDecimal.valueOf(Double.parseDouble(s[3])));

        em.persist(payment);

    }

    @Override
    public void updateCustomer(String[] s) throws EJBException {
        Customer customer = findCustomer(Integer.parseInt(s[0]));
        customer.setCustomername(s[1]);
        customer.setContactlastname(s[2]);
        customer.setContactfirstname(s[3]);
        customer.setPhone(s[4]);
        customer.setAddressline1(s[5]);
        customer.setCity(s[7]);
        customer.setCountry(s[10]);

        if(!(s[11].equals("None"))){
            Employee emp = findEmployee(Integer.parseInt(s[11]));
            customer.setSalesrepemployeenumber(emp);
        }
        else{
            customer.setSalesrepemployeenumber(null);
        }

        if(s[6].length() != 0){
            customer.setAddressline2(s[6]);
        }
        else{
            customer.setAddressline2(null);
        }
        if(s[8].length() != 0 && !(s[8].equals("null"))){
            customer.setState(s[8]);
        }
        else{
            customer.setState(null);
        }
        if(s[9].length() != 0 && !(s[9].equals("null"))){
            customer.setPostalcode(s[9]);
        }
        else{
            customer.setPostalcode(null);
        }
        if(s[12].length() != 0 && !(s[12].equals(""))){
            customer.setCreditlimit(BigDecimal.valueOf(Double.parseDouble(s[12])));
        }
        else{
            customer.setCreditlimit(null);
        }
        /* If got empNum to None  need to something*/
        em.merge(customer);


    }

    @Override
    public void updateEmployee(String[] s) throws EJBException {
        Employee employee = findEmployee(Integer.parseInt(s[0]));
        employee.setLastname(s[1]);
        employee.setFirstname(s[2]);
        employee.setExtension(s[3]);
        employee.setEmail(s[4]);

        Office office = findOffice(Integer.parseInt(s[5]));
        employee.setOfficecode(office);

        if(s[6].length() != 0){
            employee.setReportsto(s[6]);
        }
        else{
            employee.setReportsto(null);
        }
        employee.setJobtitle(s[7]);
        em.merge(employee);
    }

    @Override
    public void updateOffice(String[] s) throws EJBException {
        Office office = findOffice(Integer.parseInt(s[0]));
        office.setCity(s[1]);
        office.setPhone(s[2]);
        office.setAddressline1(s[3]);
        if(s[4].length() != 0){
            office.setAddressline2(s[4]);
        }
        else{
            office.setAddressline2(null);
        }

        if(s[5].length() != 0){
            office.setState(s[5]);
        }
        else{
            office.setState(null);
        }
        office.setCountry(s[6]);
        office.setPostalcode(s[7]);
        office.setTerritory(s[8]);
        em.merge(office);
    }

    @Override
    public void updateOrder(String[] s) throws EJBException {
        Order order = findOrderRecords(Integer.parseInt(s[0]));
        order.setRequireddate(s[2]);
        order.setShippeddate(s[3]);
        order.setStatus(s[4]);
        order.setComments(s[5]);
        order.setCustomernumber(Integer.parseInt(s[6]));
        em.merge(order);
    }

    @Override
    public void updateOrderdetail(String[] s) throws EJBException {
        Orderdetail orderdetail = findOrderDetailsRecords(s[1], Integer.parseInt(String.valueOf(Integer.parseInt(s[0]))));
        OrderdetailId orderDetailId = new OrderdetailId();
        orderdetail.setQuantityordered(Integer.parseInt(s[2]));
        orderdetail.setPriceeach(BigDecimal.valueOf(Double.parseDouble(s[3])));
        orderdetail.setOrderlinenumber(Integer.parseInt(s[4]));
        em.merge(orderdetail);
    }

    @Override
    public void deletePayment(String id) throws EJBException {
        Payment payment = findPayment(id);
        em.remove(payment);
    }

    @Override
    public void deleteCustomer(int id) throws EJBException {
        Customer customer = findCustomer(id);
        Query query = em.createNamedQuery("Payment.findbyCustomerNumber");
        query.setParameter("id", id);
        List<Payment> payment = query.getResultList();
        if(payment.size() != 0){

            for (int x = 0 ; x < payment.size() ; x++){
                Payment payment_record = findPayment(payment.get(x).getId().getChecknumber());
                em.remove(payment_record);
            }
        }


        em.remove(customer);
    }

    @Override
    public void deleteEmployee(String id) throws EJBException {
        List<Customer> customers = getAllCustomerRecords();
        int ID = Integer.parseInt(id);
        if(customers.size() != 0){
            for (int x = 0 ; x < customers.size() ; x++) {
                System.out.println(customers.size());
                if (customers.get(x) != null) {
                    if (customers.get(x).getSalesrepemployeenumber() != null) {
                        if (customers.get(x).getSalesrepemployeenumber().getId() == ID) {
                            System.out.println("HI");
                            Customer single_customer = findCustomer(customers.get(x).getId());
                            single_customer.setSalesrepemployeenumber(null);
                            em.merge(single_customer);
                        }
                    }
                }
            }
        }
        Employee employee = findEmployee(Integer.parseInt(id));
        em.remove(employee);
    }

    @Override
    public void deleteOffice(String id) throws EJBException {
        Office office = findOffice(Integer.parseInt(id));
        List<Employee> employees = getAllEmployeeRecords();

        int ID = Integer.parseInt(id);
        if(employees.size() != 0){
            for (int x = 0 ; x < employees.size() ; x++) {
                if (employees.get(x) != null) {
                    if (employees.get(x).getOfficecode().getId() == ID) {
                            System.out.println("HI");
                            Employee single_employee = findEmployee(employees.get(x).getId());
                            em.remove(single_employee);
                        }
                    }
                }
            }
        em.remove(office);
    }

    @Override
    public void deleteOrder(String id) throws EJBException {
        Order order = findOrderRecords(Integer.parseInt(id));
        List<Orderdetail> orderDetails = readOrderdetails(Integer.parseInt(id), "", "ASC");
        for (Orderdetail od : orderDetails) {
            em.remove(od);
        }
        em.remove(order);
    }

    @Override
    public void deleteOrderdetail(String productCode, int id) throws EJBException {
        Orderdetail orderdetail = findOrderDetailsRecords(productCode, Integer.parseInt(String.valueOf(id)));
        em.remove(orderdetail);
    }


    @Override
    public void addPayment(String[] s) throws EJBException {
        try {
            Payment payment = new Payment();
            PaymentId paymentId = new PaymentId();

            paymentId.setCustomernumber(Integer.valueOf(s[0]));
            paymentId.setChecknumber(s[1]);

            Customer customer = findCustomer(Integer.parseInt(s[0]));

            payment.setCustomernumber(customer);
            payment.setCustomer(customer);
            payment.setId(paymentId);
            payment.setPaymentdate(s[2]);
            payment.setAmount(BigDecimal.valueOf(Double.parseDouble(s[3])));
            em.persist(payment);
        }catch (Exception ex){
            System.out.println("ERROR");
            ex.printStackTrace();
        }
    }

    @Override
    public void addCustomer(String[] s) throws EJBException {
        // Optional Field is Addr line 2, state, postalcode, sales rep, creditlimit
        Customer customer = new Customer();
        customer.setId(Integer.valueOf(s[0]));
        customer.setCustomername(s[1]);
        customer.setContactfirstname(s[2]);
        customer.setContactlastname(s[3]);
        customer.setPhone(s[4]);
        customer.setAddressline1(s[5]);
        customer.setCity(s[7]);
        customer.setCountry(s[10]);


        if(s[6].length() != 0){
            customer.setAddressline2(s[6]);

        }
        if(s[8].length() != 0){
            customer.setState(s[8]);

        }
        if(s[9].length() != 0){
            customer.setPostalcode(s[9]);
        }
        if(!(s[11].equals("None"))){
            Employee emp = findEmployee(Integer.parseInt(s[11]));
            customer.setSalesrepemployeenumber(emp);
        }
        if(s[12].length() != 0){
            customer.setCreditlimit(BigDecimal.valueOf(Double.parseDouble(s[12])));
        }
        em.persist(customer);
    }

    @Override
    public void addUser(String[] s) throws EJBException {
        User user = new User();
        user.setId(s[0]);
        user.setPassword(s[1]);
        em.persist(user);
    }

    @Override
    public void addUserRoles(String[] s) throws EJBException {
        UserRoleId userRoleid = new UserRoleId();
        userRoleid.setUsername(s[0]);
        userRoleid.setRole("user");
        UserRole userRole = new UserRole();
        userRole.setId(userRoleid);
        em.persist(userRole);
    }

    @Override
    public void addEmployee(String[] s) throws EJBException {
        Employee employee = new Employee();
        employee.setId(Integer.valueOf(s[0]));
        employee.setLastname(s[1]);
        employee.setFirstname(s[2]);
        employee.setExtension(s[3]);
        employee.setEmail(s[4]);
        Office office = findOffice(Integer.parseInt(s[5]));
        employee.setOfficecode(office);
        employee.setReportsto(s[6]);
        employee.setJobtitle(s[7]);
        em.persist(employee);
    }

    @Override
    public void addOffice(String[] s) throws EJBException {
        Office office = new Office();
        office.setId(Integer.valueOf(s[0]));
        office.setCity(s[1]);
        office.setPhone(s[2]);
        office.setAddressline1(s[3]);
        office.setAddressline2(s[4]);
        office.setState(s[5]);
        office.setCountry(s[6]);
        office.setPostalcode(s[7]);
        office.setTerritory(s[8]);

        em.persist(office);
    }

    @Override
    public void addOrder(String[] s) throws EJBException {
            Order order= new Order();
            order.setId(Integer.parseInt(s[0]));
            order.setOrderdate(s[1]);
            order.setRequireddate(s[2]);
            order.setShippeddate(s[3]);
            order.setStatus(s[4]);
            order.setComments(s[5]);
            order.setCustomernumber(Integer.parseInt(s[6]));
            em.persist(order);
    }

    @Override
    public void addOrderdetail(String[] s) throws EJBException {

            Orderdetail orderdetail= new Orderdetail();
            OrderdetailId orderdetailId = new OrderdetailId();
            orderdetailId.setOrdernumber(Integer.parseInt(s[0]));
            orderdetailId.setProductcode(s[1]);
            Order order = findOrderRecords(Integer.parseInt(s[0]));
            Product product = findProduct(s[1]);
            orderdetail.setId(orderdetailId);
            orderdetail.setOrdernumber(order);
            orderdetail.setProductcode(product);
            orderdetail.setQuantityordered(Integer.parseInt(s[2]));
            orderdetail.setPriceeach(BigDecimal.valueOf(Double.parseDouble(s[3])));
            orderdetail.setOrderlinenumber(Integer.parseInt(s[4]));
            em.persist(orderdetail);
    }
}
