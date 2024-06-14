package com.raul.pappdelapi.dao;

import com.raul.pappdelapi.entity.Grupo;
import java.util.List;

public interface GrupoDAO {
    List<Grupo> findAll();
    Grupo findById(int id);
    void save(Grupo grupo);
    void deleteById(int id);
}
