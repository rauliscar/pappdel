package com.raul.pappdelapi.dao;

import com.raul.pappdelapi.entity.Usuario;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UsuarioDAOImpl implements UsuarioDAO {

    @Autowired
    public UsuarioDAOImpl(EntityManager entityManager) {
        this.entityManager = entityManager;
        //this.passwordEncoder = passwordEncoder;
    }

    private final EntityManager entityManager;

    /*private final PasswordEncoder passwordEncoder;

    public void registerUser(String rawPassword) {
        String encodedPassword = passwordEncoder.encode(rawPassword);
        // Guardar encodedPassword en la base de datos
    }

    public boolean checkPassword(String rawPassword, String encodedPassword) {
        return passwordEncoder.matches(rawPassword, encodedPassword);
    }*/

    @Override
    public List<Usuario> findAll() {
        Session currentSession = entityManager.unwrap(Session.class);
        return currentSession.createQuery("from Usuario", Usuario.class).getResultList();
    }

    @Override
    public Usuario findById(int id) {
        Session currentSession = entityManager.unwrap(Session.class);
        return currentSession.get(Usuario.class, id);
    }

    @Override
    public void save(Usuario usuario) {
        Session currentSession = entityManager.unwrap(Session.class);
        Transaction transaction = currentSession.beginTransaction();

        try {
            currentSession.merge(usuario);
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

        Query query = entityManager.createQuery("delete from Usuario where id_usuario = :idUsuario");
        query.setParameter("idUsuario", id);

        query.executeUpdate();
        t.commit();
        currentSession.close();    }
}