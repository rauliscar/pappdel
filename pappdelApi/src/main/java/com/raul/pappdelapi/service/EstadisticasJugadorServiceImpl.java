package com.raul.pappdelapi.service;

import com.raul.pappdelapi.dao.EstadisticasJugadorDAO;
import com.raul.pappdelapi.entity.EstadisticasJugador;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class EstadisticasJugadorServiceImpl implements EstadisticasJugadorService {

    private final EstadisticasJugadorDAO estadisticasJugadorDAO;

    @Autowired
    public EstadisticasJugadorServiceImpl(EstadisticasJugadorDAO estadisticasJugadorDAO) {
        this.estadisticasJugadorDAO = estadisticasJugadorDAO;
    }

    @Override
    public List<EstadisticasJugador> findAll() {
        return estadisticasJugadorDAO.findAll();
    }

    @Override
    public EstadisticasJugador findById(int id) {
        return estadisticasJugadorDAO.findById(id);
    }

    @Override
    public void save(EstadisticasJugador estadisticasJugador) {
        estadisticasJugadorDAO.save(estadisticasJugador);
    }

    @Override
    public void deleteById(int id) {
        estadisticasJugadorDAO.deleteById(id);
    }
}
