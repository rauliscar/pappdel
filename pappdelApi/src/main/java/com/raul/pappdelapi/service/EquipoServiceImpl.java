package com.raul.pappdelapi.service;

import com.raul.pappdelapi.dao.EquipoDAO;
import com.raul.pappdelapi.entity.Equipo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class EquipoServiceImpl implements EquipoService {

    private final EquipoDAO equipoDAO;

    @Autowired
    public EquipoServiceImpl(EquipoDAO equipoDAO) {
        this.equipoDAO = equipoDAO;
    }

    @Override
    public List<Equipo> findAll() {
        return equipoDAO.findAll();
    }

    @Override
    public Equipo findById(int id) {
        return equipoDAO.findById(id);
    }

    @Override
    public void save(Equipo equipo) {
        equipoDAO.save(equipo);
    }

    @Override
    public void deleteById(int id) {
        equipoDAO.deleteById(id);
    }
}
