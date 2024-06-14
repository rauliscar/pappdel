package com.raul.pappdelapi.service;

import com.raul.pappdelapi.entity.Equipo;
import java.util.List;

public interface EquipoService {
    List<Equipo> findAll();
    Equipo findById(int id);
    void save(Equipo equipo);
    void deleteById(int id);
}
