package com.raul.pappdelapi.service;

import com.raul.pappdelapi.dao.ClasificacionDAO;
import com.raul.pappdelapi.entity.Clasificacion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ClasificacionServiceImpl implements ClasificacionService {

    private final ClasificacionDAO clasificacionDAO;

    @Autowired
    public ClasificacionServiceImpl(ClasificacionDAO clasificacionDAO) {
        this.clasificacionDAO = clasificacionDAO;
    }

    @Override
    public List<Clasificacion> findAll() {
        return clasificacionDAO.findAll();
    }

    @Override
    public Clasificacion findById(int id) {
        return clasificacionDAO.findById(id);
    }

    @Override
    public void save(Clasificacion clasificacion) {
        clasificacionDAO.save(clasificacion);
    }

    @Override
    public void deleteById(int id) {
        clasificacionDAO.deleteById(id);
    }
}
