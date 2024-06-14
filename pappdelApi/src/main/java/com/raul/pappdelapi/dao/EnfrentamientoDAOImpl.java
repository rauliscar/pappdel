package com.raul.pappdelapi.dao;

import com.raul.pappdelapi.entity.Enfrentamiento;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class EnfrentamientoDAOImpl implements EnfrentamientoDAO {

    private final EntityManager entityManager;

    @Autowired
    public EnfrentamientoDAOImpl(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    public List<Enfrentamiento> findAll() {
        Session currentSession = entityManager.unwrap(Session.class);
        return currentSession.createQuery("from Enfrentamiento", Enfrentamiento.class).getResultList();
    }

    @Override
    public Enfrentamiento findById(int id) {
        Session currentSession = entityManager.unwrap(Session.class);
        return currentSession.get(Enfrentamiento.class, id);
    }

    @Override
    public void save(Enfrentamiento enfrentamiento) {
        Session currentSession = entityManager.unwrap(Session.class);
        Transaction transaction = currentSession.beginTransaction();

        try {
            currentSession.merge(enfrentamiento);
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

        Query query = entityManager.createQuery("delete from Enfrentamiento where id_enfrentamiento = :idEnfrentamiento");
        query.setParameter("idEnfrentamiento", id);

        query.executeUpdate();
        t.commit();
        currentSession.close();
    }
}
