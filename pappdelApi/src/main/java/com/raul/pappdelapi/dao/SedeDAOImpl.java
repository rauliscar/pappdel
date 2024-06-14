package com.raul.pappdelapi.dao;

import com.raul.pappdelapi.entity.Sede;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SedeDAOImpl implements SedeDAO {

    private final EntityManager entityManager;

    @Autowired
    public SedeDAOImpl(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    public List<Sede> findAll() {
        Session currentSession = entityManager.unwrap(Session.class);
        return currentSession.createQuery("from Sede", Sede.class).getResultList();
    }

    @Override
    public Sede findById(int id) {
        Session currentSession = entityManager.unwrap(Session.class);
        return currentSession.get(Sede.class, id);
    }

    @Override
    public void save(Sede sede) {
        Session currentSession = entityManager.unwrap(Session.class);
        Transaction transaction = currentSession.beginTransaction();

        try {
            currentSession.merge(sede);
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
            throw e;
        }
    }

    @Override
    public void deleteById(int id) {
        Session currentSession = entityManager.unwrap(Session.class);

        Transaction t = currentSession.beginTransaction();

        Query query = entityManager.createQuery("delete from Sede where id_sede = :idSede");
        query.setParameter("idSede", id);

        query.executeUpdate();
        t.commit();
        currentSession.close();    }
}
