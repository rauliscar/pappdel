package com.raul.pappdelapi.dao;

import com.raul.pappdelapi.entity.Partido;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PartidoDAOImpl implements PartidoDAO {

    private final EntityManager entityManager;

    @Autowired
    public PartidoDAOImpl(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    public List<Partido> findAll() {
        Session currentSession = entityManager.unwrap(Session.class);
        return currentSession.createQuery("from Partido", Partido.class).getResultList();
    }

    @Override
    public Partido findById(int id) {
        Session currentSession = entityManager.unwrap(Session.class);
        return currentSession.get(Partido.class, id);
    }

    @Override
    public void save(Partido partido) {
        Session currentSession = entityManager.unwrap(Session.class);
        Transaction transaction = currentSession.beginTransaction();

        try {
            currentSession.merge(partido);
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

        Query query = entityManager.createQuery("delete from Partido where id_partido = :idPartido");
        query.setParameter("idPartido", id);

        query.executeUpdate();
        t.commit();
        currentSession.close();    }
}
