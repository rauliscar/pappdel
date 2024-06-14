package com.raul.pappdelapi.service;

import com.raul.pappdelapi.entity.Partido;
import java.util.List;

public interface PartidoService {
    List<Partido> findAll();
    Partido findById(int id);
    void save(Partido partido);
    void deleteById(int id);
}
