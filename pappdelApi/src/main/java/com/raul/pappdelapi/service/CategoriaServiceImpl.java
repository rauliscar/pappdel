package com.raul.pappdelapi.service;

import com.raul.pappdelapi.controller.EstadisticasJugadorController;
import com.raul.pappdelapi.dao.CategoriaDAO;
import com.raul.pappdelapi.entity.Categoria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class CategoriaServiceImpl implements CategoriaService {

    private final CategoriaDAO categoriaDAO;

    @Autowired
    public CategoriaServiceImpl(CategoriaDAO categoriaDAO) {
        this.categoriaDAO = categoriaDAO;
    }

    @Override
    public List<Categoria> findAll() {
        return categoriaDAO.findAll();
    }

    @Override
    public Categoria findById(int id) {
        return categoriaDAO.findById(id);
    }

    @Override
    public void save(Categoria categoria) {
        categoriaDAO.save(categoria);
    }

    @Override
    public void deleteById(int id) {
        categoriaDAO.deleteById(id);
    }
}
