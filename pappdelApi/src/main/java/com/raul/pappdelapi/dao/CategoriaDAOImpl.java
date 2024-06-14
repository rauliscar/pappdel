package com.raul.pappdelapi.dao;

import com.raul.pappdelapi.controller.EstadisticasJugadorController;
import com.raul.pappdelapi.entity.Categoria;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CategoriaDAOImpl implements CategoriaDAO {

    private final EntityManager entityManager;

    @Autowired
    public CategoriaDAOImpl(EntityManager entityManager) {
        this.entityManager = entityManager;
    }
    @Override
    public List<Categoria> findAll() {
        Session currentSession = entityManager.unwrap(Session.class);
        return currentSession.createQuery("from Categoria", Categoria.class).getResultList();
    }

    @Override
    public Categoria findById(int id) {
        Session currentSession = entityManager.unwrap(Session.class);
        return currentSession.get(Categoria.class, id);
    }

    @Override
    public void save(Categoria categoria) {
        Session currentSession = entityManager.unwrap(Session.class);
        Transaction transaction = currentSession.beginTransaction();

        try {
            currentSession.merge(categoria);
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

        Query query = entityManager.createQuery("delete from Categoria where id_categoria = :idCategoria");
        query.setParameter("idCategoria", id);

        query.executeUpdate();
        t.commit();
        currentSession.close();
    }
}
