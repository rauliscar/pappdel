package com.raul.pappdelapi.controller;

import com.raul.pappdelapi.entity.Enfrentamiento;
import com.raul.pappdelapi.service.EnfrentamientoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/pappdel/enfrentamiento")
public class EnfrentamientoController {

    private final EnfrentamientoService enfrentamientoService;

    @Autowired
    public EnfrentamientoController(EnfrentamientoService enfrentamientoService) {
        this.enfrentamientoService = enfrentamientoService;
    }

    @GetMapping("")
    public List<Enfrentamiento> findAll() {
        return enfrentamientoService.findAll();
    }

    @GetMapping("/{enfrentamientoId}")
    public Enfrentamiento getEnfrentamientoById(@PathVariable int enfrentamientoId) {
        Enfrentamiento enfrentamiento = enfrentamientoService.findById(enfrentamientoId);

        if (enfrentamiento == null) {
            throw new RuntimeException("Enfrentamiento id not found - " + enfrentamientoId);
        }

        return enfrentamiento;
    }

    @PostMapping("")
    public Enfrentamiento addEnfrentamiento(@RequestBody Enfrentamiento enfrentamiento) {
        enfrentamiento.setId_enfrentamiento(0);
        enfrentamientoService.save(enfrentamiento);
        return enfrentamiento;
    }

    @PutMapping("")
    public Enfrentamiento updateEnfrentamiento(@RequestBody Enfrentamiento enfrentamiento) {
        enfrentamientoService.save(enfrentamiento);
        return enfrentamiento;
    }

    @DeleteMapping("/{enfrentamientoId}")
    public String deleteEnfrentamiento(@PathVariable int enfrentamientoId) {
        Enfrentamiento enfrentamiento = enfrentamientoService.findById(enfrentamientoId);
        if (enfrentamiento == null) {
            throw new RuntimeException("Enfrentamiento id not found - " + enfrentamientoId);
        }
        enfrentamientoService.deleteById(enfrentamientoId);
        return "Deleted enfrentamiento id - " + enfrentamientoId;
    }
}
