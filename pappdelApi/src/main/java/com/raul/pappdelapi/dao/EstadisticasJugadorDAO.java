package com.raul.pappdelapi.dao;

import com.raul.pappdelapi.entity.EstadisticasJugador;

import java.util.List;

public interface EstadisticasJugadorDAO {
    List<EstadisticasJugador> findAll();
    EstadisticasJugador findById(int id);
    void save(EstadisticasJugador estadisticasJugador);
    void deleteById(int id);
}
