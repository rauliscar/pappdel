package com.raul.pappdelapi.service;

import com.raul.pappdelapi.entity.Grupo;
import java.util.List;

public interface GrupoService {
    List<Grupo> findAll();
    Grupo findById(int id);
    void save(Grupo grupo);
    void deleteById(int id);
}
