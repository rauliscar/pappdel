package com.raul.pappdelapi.service;

import com.raul.pappdelapi.entity.Clasificacion;
import java.util.List;

public interface ClasificacionService {
    List<Clasificacion> findAll();
    Clasificacion findById(int id);
    void save(Clasificacion clasificacion);
    void deleteById(int id);
}