package com.raul.pappdelapi.service;

import com.raul.pappdelapi.dao.GrupoDAO;
import com.raul.pappdelapi.entity.Grupo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class GrupoServiceImpl implements GrupoService {

    private final GrupoDAO grupoDAO;

    @Autowired
    public GrupoServiceImpl(GrupoDAO grupoDAO) {
        this.grupoDAO = grupoDAO;
    }

    @Override
    public List<Grupo> findAll() {
        return grupoDAO.findAll();
    }

    @Override
    public Grupo findById(int id) {
        return grupoDAO.findById(id);
    }

    @Override
    public void save(Grupo grupo) {
        grupoDAO.save(grupo);
    }

    @Override
    public void deleteById(int id) {
        grupoDAO.deleteById(id);
    }
}
