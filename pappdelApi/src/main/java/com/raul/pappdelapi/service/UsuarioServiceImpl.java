package com.raul.pappdelapi.service;

import com.raul.pappdelapi.dao.UsuarioDAO;
import com.raul.pappdelapi.entity.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class UsuarioServiceImpl implements UsuarioService {

    private final UsuarioDAO usuarioDAO;

    @Autowired
    public UsuarioServiceImpl(UsuarioDAO usuarioDAO) {
        this.usuarioDAO = usuarioDAO;
    }

    @Override
    public List<Usuario> findAll() {
        return usuarioDAO.findAll();
    }

    @Override
    public Usuario findById(int id) {
        return usuarioDAO.findById(id);
    }

    @Override
    public void save(Usuario usuario) {
        usuarioDAO.save(usuario);
    }

    @Override
    public void deleteById(int id) {
        usuarioDAO.deleteById(id);
    }
}
