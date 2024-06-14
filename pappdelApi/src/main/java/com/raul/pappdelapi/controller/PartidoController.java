package com.raul.pappdelapi.controller;

import com.raul.pappdelapi.entity.Partido;
import com.raul.pappdelapi.service.PartidoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/pappdel/partido")
public class PartidoController {

    private final PartidoService partidoService;

    @Autowired
    public PartidoController(PartidoService partidoService) {
        this.partidoService = partidoService;
    }

    @GetMapping("")
    public List<Partido> findAll() {
        return partidoService.findAll();
    }

    @GetMapping("/{partidoId}")
    public Partido getPartidoById(@PathVariable int partidoId) {
        Partido partido = partidoService.findById(partidoId);

        if (partido == null) {
            throw new RuntimeException("Partido id not found - " + partidoId);
        }

        return partido;
    }

    @PostMapping("")
    public Partido addPartido(@RequestBody Partido partido) {
        partido.setId_partido(0);
        partidoService.save(partido);
        return partido;
    }

    @PutMapping("")
    public Partido updatePartido(@RequestBody Partido partido) {
        partidoService.save(partido);
        return partido;
    }

    @DeleteMapping("/{partidoId}")
    public String deletePartido(@PathVariable int partidoId) {
        Partido partido = partidoService.findById(partidoId);
        if (partido == null) {
            throw new RuntimeException("Partido id not found - " + partidoId);
        }
        partidoService.deleteById(partidoId);
        return "Deleted partido id - " + partidoId;
    }
}
