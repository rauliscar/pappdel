package com.raul.pappdelapi.dao;

import com.raul.pappdelapi.entity.Clasificacion;
import jakarta.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jakarta.persistence.EntityManager;
import java.util.List;

@Repository
public class ClasificacionDAOImpl implements ClasificacionDAO {

    private final EntityManager entityManager;

    @Autowired
    public ClasificacionDAOImpl(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    public List<Clasificacion> findAll() {
        Session currentSession = entityManager.unwrap(Session.class);
        return currentSession.createQuery("from Clasificacion", Clasificacion.class).getResultList();
    }

    @Override
    public Clasificacion findById(int id) {
        Session currentSession = entityManager.unwrap(Session.class);
        return currentSession.get(Clasificacion.class, id);
    }

    @Override
    public void save(Clasificacion clasificacion) {
        Session currentSession = entityManager.unwrap(Session.class);
        Transaction transaction = currentSession.beginTransaction();

        try {
            currentSession.merge(clasificacion);
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

        Query query = entityManager.createQuery("delete from Clasificacion where idClasificacion = :idClasificacion");
        query.setParameter("idClasificacion", id);

        query.executeUpdate();
        t.commit();
        currentSession.close();
    }
}

