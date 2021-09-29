package com.ray.jstl.dao;

import com.ray.jstl.models.User;
import com.ray.jstl.utilities.HibernateSessionFactory;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

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

    public List<User> getAllUser(int start, int pageSize) {
        Transaction transaction = null;
        List<User> listOfUser = null;

        try (Session session = HibernateSessionFactory.getSessionFactory().openSession()) {
            // start transaction
            transaction = session.beginTransaction();

            Query selectQuery = session.createQuery("from User");
            selectQuery.setFirstResult(start - 1);
            selectQuery.setMaxResults(pageSize);

            listOfUser = selectQuery.getResultList();

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


    public void insertUser(User user) {
        Transaction transaction = null;

        try (Session session = HibernateSessionFactory.getSessionFactory().openSession()) {
            // start transaction
            transaction = session.beginTransaction();

            // save the user
            session.save(user);

            transaction.commit();

        } catch (Exception ex) {
            if (transaction != null) {
                transaction.rollback();
            }
            ex.printStackTrace();
        }
    }


    public void updateUser(User user) {
        Transaction transaction = null;

        try (Session session = HibernateSessionFactory.getSessionFactory().openSession()) {
            // start transaction
            transaction = session.beginTransaction();

            // update the user
            session.update(user);

            transaction.commit();

        } catch (Exception ex) {
            if (transaction != null) {
                transaction.rollback();
            }
            ex.printStackTrace();
        }
    }


    public void deleteUser(int id) {
        Transaction transaction = null;
        try (Session session = HibernateSessionFactory.getSessionFactory().openSession()) {
            // start transaction
            transaction = session.beginTransaction();

            // get user
            User user = session.get(User.class, id);

            // update the user
            if (user != null) {
                session.delete(user);
            }

            transaction.commit();

        } catch (Exception ex) {
            if (transaction != null) {
                transaction.rollback();
            }
            ex.printStackTrace();
        }
    }

    public  int getTotalUserNumber() {
        int totalUserNumber = 0;

        Transaction transaction = null;
        try (Session session = HibernateSessionFactory.getSessionFactory().openSession()) {
            // start transaction
            transaction = session.beginTransaction();

            totalUserNumber = (int)session.createQuery("select count(id) from User").getSingleResult();

            transaction.commit();

        } catch (Exception ex) {
            if (transaction != null) {
                transaction.rollback();
            }
            ex.printStackTrace();
        }
        return totalUserNumber;
    }
}
