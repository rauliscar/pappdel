package com.raul.pappdelapi.dao;

import com.raul.pappdelapi.entity.Partido;
import java.util.List;

public interface PartidoDAO {
    List<Partido> findAll();
    Partido findById(int id);
    void save(Partido partido);
    void deleteById(int id);
}
