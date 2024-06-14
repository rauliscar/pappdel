package com.raul.pappdelapi.service;

import com.raul.pappdelapi.dao.PartidoDAO;
import com.raul.pappdelapi.entity.Partido;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class PartidoServiceImpl implements PartidoService {

    private final PartidoDAO partidoDAO;

    @Autowired
    public PartidoServiceImpl(PartidoDAO partidoDAO) {
        this.partidoDAO = partidoDAO;
    }

    @Override
    public List<Partido> findAll() {
        return partidoDAO.findAll();
    }

    @Override
    public Partido findById(int id) {
        return partidoDAO.findById(id);
    }

    @Override
    public void save(Partido partido) {
        partidoDAO.save(partido);
    }

    @Override
    public void deleteById(int id) {
        partidoDAO.deleteById(id);
    }
}
