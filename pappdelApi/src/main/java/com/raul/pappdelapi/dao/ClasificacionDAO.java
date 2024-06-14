package com.raul.pappdelapi.dao;

import com.raul.pappdelapi.entity.Clasificacion;
import java.util.List;

public interface ClasificacionDAO {
    List<Clasificacion> findAll();
    Clasificacion findById(int id);
    void save(Clasificacion clasificacion);
    void deleteById(int id);
}

