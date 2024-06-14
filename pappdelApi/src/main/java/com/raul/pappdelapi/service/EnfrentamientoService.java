package com.raul.pappdelapi.service;

import com.raul.pappdelapi.entity.Enfrentamiento;
import java.util.List;

public interface EnfrentamientoService {
    List<Enfrentamiento> findAll();
    Enfrentamiento findById(int id);
    void save(Enfrentamiento enfrentamiento);
    void deleteById(int id);
}
