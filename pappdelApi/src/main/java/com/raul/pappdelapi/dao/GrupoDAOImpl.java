package com.raul.pappdelapi.dao;

import com.raul.pappdelapi.entity.Grupo;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class GrupoDAOImpl implements GrupoDAO {

    private final EntityManager entityManager;

    @Autowired
    public GrupoDAOImpl(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    public List<Grupo> findAll() {
        Session currentSession = entityManager.unwrap(Session.class);
        return currentSession.createQuery("from Grupo", Grupo.class).getResultList();
    }

    @Override
    public Grupo findById(int id) {
        Session currentSession = entityManager.unwrap(Session.class);
        return currentSession.get(Grupo.class, id);
    }

    @Override
    public void save(Grupo grupo) {
        Session currentSession = entityManager.unwrap(Session.class);
        Transaction transaction = currentSession.beginTransaction();

        try {
            currentSession.merge(grupo);
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

        Query query = entityManager.createQuery("delete from Grupo where id_grupo = :idGrupo");
        query.setParameter("idGrupo", id);

        query.executeUpdate();
        t.commit();
        currentSession.close();
    }
}
