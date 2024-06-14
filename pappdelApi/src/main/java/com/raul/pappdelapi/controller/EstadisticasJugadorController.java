package com.raul.pappdelapi.controller;

import com.raul.pappdelapi.entity.EstadisticasJugador;
import com.raul.pappdelapi.entity.Grupo;
import com.raul.pappdelapi.service.EstadisticasJugadorService;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/pappdel/estadisticasJugador")
public class EstadisticasJugadorController {

    private final EstadisticasJugadorService estadisticasJugadorService;

    @Autowired
    public EstadisticasJugadorController(EstadisticasJugadorService estadisticasJugadorService) {
        this.estadisticasJugadorService = estadisticasJugadorService;
    }

    @GetMapping("")
    public List<EstadisticasJugador> findAll() {
        return estadisticasJugadorService.findAll();
    }

    @GetMapping("/{estadisticasJugadorId}")
    public EstadisticasJugador getEstadisticasJugadorById(@PathVariable int estadisticasJugadorId) {
        EstadisticasJugador estadisticasJugador = estadisticasJugadorService.findById(estadisticasJugadorId);

        if (estadisticasJugador == null) {
            throw new RuntimeException("EstadisticasJugador id not found - " + estadisticasJugadorId);
        }

        return estadisticasJugador;
    }

    @PostMapping("")
    public EstadisticasJugador addEstadisticasJugador(@RequestBody EstadisticasJugador estadisticasJugador) {
        estadisticasJugador.setId_estadistica(0);
        estadisticasJugadorService.save(estadisticasJugador);
        return estadisticasJugador;
    }

    @PutMapping("")
    public EstadisticasJugador updateEstadisticasJugador(@RequestBody EstadisticasJugador estadisticasJugador) {
        estadisticasJugadorService.save(estadisticasJugador);
        return estadisticasJugador;
    }

    @DeleteMapping("/{estadisticasJugadorId}")
    public String deleteEstadisticasJugador(@PathVariable int estadisticasJugadorId) {
        EstadisticasJugador estadisticasJugador = estadisticasJugadorService.findById(estadisticasJugadorId);
        if (estadisticasJugador == null) {
            throw new RuntimeException("EstadisticasJugador id not found - " + estadisticasJugadorId);
        }
        estadisticasJugadorService.deleteById(estadisticasJugadorId);
        return "Deleted estadisticasJugador id - " + estadisticasJugadorId;
    }
}
