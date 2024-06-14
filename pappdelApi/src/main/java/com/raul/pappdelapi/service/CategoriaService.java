package com.raul.pappdelapi.service;

import com.raul.pappdelapi.controller.EstadisticasJugadorController;
import com.raul.pappdelapi.entity.Categoria;

import java.util.List;

public interface CategoriaService {
    List<Categoria> findAll();
    Categoria findById(int id);
    void save(Categoria categoria);
    void deleteById(int id);
}
