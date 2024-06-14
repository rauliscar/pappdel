package com.raul.pappdelapi.dao;

import com.raul.pappdelapi.entity.EstadisticasJugador;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class EstadisticasJugadorDAOImpl implements EstadisticasJugadorDAO {

    private final EntityManager entityManager;

    @Autowired
    public EstadisticasJugadorDAOImpl(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    public List<EstadisticasJugador> findAll() {
        Session currentSession = entityManager.unwrap(Session.class);
        return currentSession.createQuery("from EstadisticasJugador", EstadisticasJugador.class).getResultList();
    }

    @Override
    public EstadisticasJugador findById(int id) {
        Session currentSession = entityManager.unwrap(Session.class);
        return currentSession.get(EstadisticasJugador.class, id);
    }

    @Override
    public void save(EstadisticasJugador estadisticasJugador) {
        Session currentSession = entityManager.unwrap(Session.class);
        Transaction transaction = currentSession.beginTransaction();

        try {
            currentSession.merge(estadisticasJugador);
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

        Query query = entityManager.createQuery("delete from EstadisticasJugador where id_estadistica = :idEstadisticasJugador");
        query.setParameter("idEstadisticasJugador", id);

        query.executeUpdate();
        t.commit();
        currentSession.close();    }
}
