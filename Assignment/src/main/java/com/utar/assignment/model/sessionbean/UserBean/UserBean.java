package com.utar.assignment.model.sessionbean.UserBean;

import com.utar.assignment.model.entity.User;
import com.utar.assignment.model.entity.UserRole;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;


@Stateless
public class UserBean implements UserBeanLocal {

    @PersistenceContext(unitName = "classicmodels")
    EntityManager em;

    @Override
    public User getUserByUsername(String username) {
        Query query = em.createQuery("SELECT u FROM User u WHERE u.id = :username");
        query.setParameter("username", username);
        List<User> users = query.getResultList();
        if (users.isEmpty()) {
            return null;
        } else {
            return users.get(0);
        }
    }

    @Override
    public User getUserByUsernameAndPassword(String username, String password) {
        Query query = em.createQuery("SELECT u FROM User u WHERE u.id = :username AND u.password = :password");
        query.setParameter("username", username);
        query.setParameter("password", password);
        List<User> users = query.getResultList();
        if (users.isEmpty()) {
            return null;
        } else {
            return users.get(0);
        }
    }

    public String getUserRoleByUsername(String username) {
        Query query = em.createQuery("SELECT ur FROM UserRole ur WHERE ur.id.username = :username");
        query.setParameter("username", username);
        List<UserRole> userRoles = query.getResultList();
        if (userRoles.isEmpty()) {
            return null;
        } else {
            UserRole userRole = userRoles.get(0);
            return userRole.getId().getRole();
        }
    }

}
