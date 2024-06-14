package com.raul.pappdelapi.service;

import com.raul.pappdelapi.entity.Usuario;
import java.util.List;

public interface UsuarioService {
    List<Usuario> findAll();
    Usuario findById(int id);
    void save(Usuario usuario);
    void deleteById(int id);
}
