package com.raul.pappdelapi.dao;

import com.raul.pappdelapi.entity.Equipo;
import java.util.List;

public interface EquipoDAO {
    List<Equipo> findAll();
    Equipo findById(int id);
    void save(Equipo equipo);
    void deleteById(int id);
}
