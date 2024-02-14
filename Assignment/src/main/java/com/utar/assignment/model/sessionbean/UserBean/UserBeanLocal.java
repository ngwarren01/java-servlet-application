package com.utar.assignment.model.sessionbean.UserBean;

import com.utar.assignment.model.entity.User;

import javax.ejb.EJBException;
import javax.ejb.Local;

@Local
public interface UserBeanLocal {


    public User getUserByUsername(String username) throws EJBException;

    public User getUserByUsernameAndPassword(String username, String password) throws EJBException;

    public String getUserRoleByUsername(String username) throws EJBException;




}
