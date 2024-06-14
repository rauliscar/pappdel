package com.raul.pappdelapi.service;

import com.raul.pappdelapi.entity.EstadisticasJugador;
import java.util.List;

public interface EstadisticasJugadorService {
    List<EstadisticasJugador> findAll();
    EstadisticasJugador findById(int id);
    void save(EstadisticasJugador estadisticasJugador);
    void deleteById(int id);
}
