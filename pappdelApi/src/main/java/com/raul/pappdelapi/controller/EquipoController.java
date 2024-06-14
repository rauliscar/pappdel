package com.raul.pappdelapi.controller;

import com.raul.pappdelapi.entity.Equipo;
import com.raul.pappdelapi.service.EquipoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/pappdel/equipo")
public class EquipoController {

    private final EquipoService equipoService;

    @Autowired
    public EquipoController(EquipoService equipoService) {
        this.equipoService = equipoService;
    }

    @GetMapping("")
    public List<Equipo> findAll() {
        return equipoService.findAll();
    }

    @GetMapping("/{equipoId}")
    public Equipo getEquipoById(@PathVariable int equipoId) {
        Equipo equipo = equipoService.findById(equipoId);

        if (equipo == null) {
            throw new RuntimeException("Equipo id not found - " + equipoId);
        }

        return equipo;
    }

    @PostMapping("")
    public Equipo addEquipo(@RequestBody Equipo equipo) {
        equipo.setId_equipo(0);
        equipoService.save(equipo);
        return equipo;
    }

    @PutMapping("")
    public Equipo updateEquipo(@RequestBody Equipo equipo) {
        equipoService.save(equipo);
        return equipo;
    }

    @DeleteMapping("/{equipoId}")
    public String deleteEquipo(@PathVariable int equipoId) {
        Equipo equipo = equipoService.findById(equipoId);
        if (equipo == null) {
            throw new RuntimeException("Equipo id not found - " + equipoId);
        }
        equipoService.deleteById(equipoId);
        return "Deleted equipo id - " + equipoId;
    }
}
