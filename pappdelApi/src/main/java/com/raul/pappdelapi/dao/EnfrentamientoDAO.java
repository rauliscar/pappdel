package com.raul.pappdelapi.dao;

import com.raul.pappdelapi.entity.Enfrentamiento;
import java.util.List;

public interface EnfrentamientoDAO {
    List<Enfrentamiento> findAll();
    Enfrentamiento findById(int id);
    void save(Enfrentamiento enfrentamiento);
    void deleteById(int id);
}
