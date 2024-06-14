package com.raul.pappdelapi.service;

import com.raul.pappdelapi.dao.EnfrentamientoDAO;
import com.raul.pappdelapi.entity.Enfrentamiento;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class EnfrentamientoServiceImpl implements EnfrentamientoService {

    private final EnfrentamientoDAO enfrentamientoDAO;

    @Autowired
    public EnfrentamientoServiceImpl(EnfrentamientoDAO enfrentamientoDAO) {
        this.enfrentamientoDAO = enfrentamientoDAO;
    }

    @Override
    public List<Enfrentamiento> findAll() {
        return enfrentamientoDAO.findAll();
    }

    @Override
    public Enfrentamiento findById(int id) {
        return enfrentamientoDAO.findById(id);
    }

    @Override
    public void save(Enfrentamiento enfrentamiento) {
        enfrentamientoDAO.save(enfrentamiento);
    }

    @Override
    public void deleteById(int id) {
        enfrentamientoDAO.deleteById(id);
    }
}
