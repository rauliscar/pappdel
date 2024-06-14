package com.raul.pappdelapi.dao;

import com.raul.pappdelapi.entity.Categoria;

import java.util.List;

public interface CategoriaDAO {
    List<Categoria> findAll();
    Categoria findById(int id);
    void save(Categoria categoria);
    void deleteById(int id);
}
