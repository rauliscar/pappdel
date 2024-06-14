package com.raul.pappdelapi.dao;

import com.raul.pappdelapi.entity.Usuario;
import java.util.List;

public interface UsuarioDAO {
    List<Usuario> findAll();
    Usuario findById(int id);
    void save(Usuario usuario);
    void deleteById(int id);
}