package com.raul.pappdelapi.dao;

import com.raul.pappdelapi.entity.Equipo;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class EquipoDAOImpl implements EquipoDAO {

    private final EntityManager entityManager;

    @Autowired
    public EquipoDAOImpl(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    public List<Equipo> findAll() {
        Session currentSession = entityManager.unwrap(Session.class);
        return currentSession.createQuery("from Equipo", Equipo.class).getResultList();
    }

    @Override
    public Equipo findById(int id) {
        Session currentSession = entityManager.unwrap(Session.class);
        return currentSession.get(Equipo.class, id);
    }

    @Override
    public void save(Equipo equipo) {
        Session currentSession = entityManager.unwrap(Session.class);
        Transaction transaction = currentSession.beginTransaction();

        try {
            currentSession.merge(equipo);
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

        Query query = entityManager.createQuery("delete from Equipo where id_equipo = :idEquipo");
        query.setParameter("idEquipo", id);

        query.executeUpdate();
        t.commit();
        currentSession.close();
    }
}
