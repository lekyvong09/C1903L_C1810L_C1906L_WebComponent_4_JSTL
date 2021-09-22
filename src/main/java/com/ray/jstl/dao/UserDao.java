package com.ray.jstl.dao;

import com.ray.jstl.models.User;
import com.ray.jstl.utilities.HibernateSessionFactory;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class UserDao {

    public List<User> getAllUser() {
        Transaction transaction = null;
        List<User> listOfUser = null;

        try (Session session = HibernateSessionFactory.getSessionFactory().openSession()) {
            // start transaction
            transaction = session.beginTransaction();

            listOfUser = session.createQuery("from User").getResultList();

            // commit transaction
            transaction.commit();
        } catch (Exception ex) {
            if (transaction != null) {
                transaction.rollback();
            }
            ex.printStackTrace();
        }

        return listOfUser;
    }

    public User getUser(int id) {
        Transaction transaction = null;
        User user = null;

        try (Session session = HibernateSessionFactory.getSessionFactory().openSession()) {
            // start transaction
            transaction = session.beginTransaction();

            user = session.get(User.class, id);

            // commit transaction
            transaction.commit();

        } catch (Exception ex) {
            if (transaction != null) {
                transaction.rollback();
            }
            ex.printStackTrace();
        }
        return user;
    }
}
